## Introduction
With WooCommerce 3.5+ there is a new Worker Queue system, WC_Queue. This new system allows for scheduling and running background jobs using the [Action Scheduler library](https://github.com/Prospress/action-scheduler), however, it is easily overridable to hook in a Worker Queue system of your own likings like Amazon SQS or any other queue system out there.

## Using WC_Queue
The Worker Queue can be accessed using the `WC()->queue()` method, this will return the WC_Queue implementation, by default it will utilise WC_Action_Queue but as mentioned it can be extended to use any other queue system, see the implementing a custom worker queue section for more details on that.

Queues work the same as the WordPress hook system, you have a function that processes your job, you attach that function to a unique action and then call that action to schedule or cancel jobs.

### Adding jobs to the queue
`WC()->queue()->add( $hook, $args = array(), $group = '' )` - You will use this method to execute a **one time job** that will **fire as soon as possible**. You pass the hook that needs to be executed as `$hook`, any arguments you want to use inside that hook in `$args` and if you specify a group name in `$group` it will run the job as part of a group meaning it will process jobs first in first out for that group and not all in async.
Example:
```
function my_job_function( $param1, $param2 ) {
    // This is the code that will execute when the job runs.
    error_log( 'Param1: ' . $param1 );
    error_log( 'Param2: ' . $param2 );
}
add_action( 'my_job_action', 'my_job_queue', 10, 2 );
WC()->queue()-add( 'my_job_action', array( 'param1' => 'Param 1 value', 'param2' => 'Param 2 value' ), 'my-job-group' );
```

`WC()->queue()->schedule_single( $timestamp, $hook, $args = array(), $group = '' )` - You will use this method to execute a **one time job** that will fire at the specified timestamp as passed into `$timestamp`. You pass the hook that needs to be executed as `$hook`, any arguments you want to use inside that hook in `$args` and if you specify a group name in `$group` it will run the job as part of a group.

`WC()->queue->schedule_recurring( $timestamp, $interval_in_seconds, $hook, $args = array(), $group = '' )` - You will use this method to schedule recurring jobs that will start at the timestamp provided in `$timestamp` repeating every n seconds provided in $interval_in_seconds. You pass the hook that needs to be executed as `$hook`, any arguments you want to use inside that hook in `$args` and if you specify a group name in `$group` it will run the job as part of a group.

`WC()->queue->schedule_cron( $timestamp, $cron_schedule, $hook, $args = array(), $group = '' )` - You will use this method to schedule a job to run on a cron-like schedule starting on or after the timestamp provided in `$timestamp` and executing based on the [cron schedule](https://en.wikipedia.org/wiki/Cron) provided in $cron_schedule. You pass the hook that needs to be executed as `$hook`, any arguments you want to use inside that hook in `$args` and if you specify a group name in `$group` it will run the job as part of a group.

## Extending WC_Queue with your own queue system
WC_Queue is fully extendable via the [WC_Queue_Interface](https://github.com/woocommerce/woocommerce/blob/master/includes/interfaces/class-wc-queue-interface.php) interface. Your class needs to implement all those methods as defined in the interface and then you can add the functionality inside those methods to reference an external queue API for example.

In order for WooCommerce to use your queue class you will need to hook into the `woocommerce_queue_class` filter and pass the class name of your queue class to make it use that.

### Custom queue class example
```
class WC_My_Custom_Queue implements WC_Queue_Interface {
	/**
	 * Enqueue an action to run one time, as soon as possible
	 *
	 * @param string $hook The hook to trigger.
	 * @param array  $args Arguments to pass when the hook triggers.
	 * @param string $group The group to assign this job to.
	 * @return string The action ID.
	 */
	public function add( $hook, $args = array(), $group = '' ) {
		// Code here to add a one time job.
                return $action_id;
	}

	/**
	 * Schedule an action to run once at some time in the future
	 *
	 * @param int    $timestamp When the job will run.
	 * @param string $hook The hook to trigger.
	 * @param array  $args Arguments to pass when the hook triggers.
	 * @param string $group The group to assign this job to.
	 * @return string The action ID.
	 */
	public function schedule_single( $timestamp, $hook, $args = array(), $group = '' ) {
		// Code here to add a single recurring job at a specific time.
                return $action_id;
	}

	/**
	 * Schedule a recurring action
	 *
	 * @param int    $timestamp When the first instance of the job will run.
	 * @param int    $interval_in_seconds How long to wait between runs.
	 * @param string $hook The hook to trigger.
	 * @param array  $args Arguments to pass when the hook triggers.
	 * @param string $group The group to assign this job to.
	 * @return string The action ID.
	 */
	public function schedule_recurring( $timestamp, $interval_in_seconds, $hook, $args = array(), $group = '' ) {
		// Code here to add a recurring job.
                return $action_id;
	}

	/**
	 * Schedule an action that recurs on a cron-like schedule.
	 *
	 * @param int    $timestamp The schedule will start on or after this time.
	 * @param string $cron_schedule A cron-link schedule string.
	 * @see http://en.wikipedia.org/wiki/Cron
	 *   *    *    *    *    *    *
	 *   ┬    ┬    ┬    ┬    ┬    ┬
	 *   |    |    |    |    |    |
	 *   |    |    |    |    |    + year [optional]
	 *   |    |    |    |    +----- day of week (0 - 7) (Sunday=0 or 7)
	 *   |    |    |    +---------- month (1 - 12)
	 *   |    |    +--------------- day of month (1 - 31)
	 *   |    +-------------------- hour (0 - 23)
	 *   +------------------------- min (0 - 59)
	 * @param string $hook The hook to trigger.
	 * @param array  $args Arguments to pass when the hook triggers.
	 * @param string $group The group to assign this job to.
	 * @return string The action ID
	 */
	public function schedule_cron( $timestamp, $cron_schedule, $hook, $args = array(), $group = '' ) {
		// Code here to add a job that executes based on a cron schedule
                return $action_id;
	}

	/**
	 * Dequeue all actions with a matching hook (and optionally matching args and group) so they are not run.
	 *
	 * Any recurring actions with a matching hook will also be cancelled, not just the next scheduled action.
	 *
	 * Technically, one action in a recurring or Cron action is scheduled at any one point in time. The next
	 * in the sequence is scheduled after the previous one is run, so only the next scheduled action needs to
	 * be cancelled/dequeued to stop the sequence.
	 *
	 * @param string $hook The hook that the job will trigger.
	 * @param array  $args Args that would have been passed to the job.
	 * @param string $group Group name.
	 */
	public function cancel( $hook, $args = array(), $group = '' ) {
		// Code here to remove a job from the queue.
	}

        /**
	 * Dequeue all actions with a matching hook (and optionally matching args and group) so no matching actions are ever run.
	 *
	 * @param string $hook The hook that the job will trigger.
	 * @param array  $args Args that would have been passed to the job.
	 * @param string $group The group the job is assigned to (if any).
	 */
	public function cancel_all( $hook, $args = array(), $group = '' ) {
                // Code here to cancel all running jobs for a certain action.
        }

	/**
	 * Get the date and time for the next scheduled occurence of an action with a given hook
	 * (an optionally that matches certain args and group), if any.
	 *
	 * @param string $hook Hook name.
	 * @param array  $args Arguments.
	 * @param string $group Group name.
	 * @return WC_DateTime|null The date and time for the next occurrence, or null if there is no pending, scheduled action for the given hook.
	 */
	public function get_next( $hook, $args = null, $group = '' ) {
                // Code here to get the next running job
                return WC_DateTime|null
	}

	/**
	 * Find scheduled actions
	 *
	 * @param array  $args Possible arguments, with their default values:
	 *        'hook' => '' - the name of the action that will be triggered
	 *        'args' => null - the args array that will be passed with the action
	 *        'date' => null - the scheduled date of the action. Expects a DateTime object, a unix timestamp, or a string that can parsed with strtotime(). Used in UTC timezone.
	 *        'date_compare' => '<=' - operator for testing "date". accepted values are '!=', '>', '>=', '<', '<=', '='
	 *        'modified' => null - the date the action was last updated. Expects a DateTime object, a unix timestamp, or a string that can parsed with strtotime(). Used in UTC timezone.
	 *        'modified_compare' => '<=' - operator for testing "modified". accepted values are '!=', '>', '>=', '<', '<=', '='
	 *        'group' => '' - the group the action belongs to
	 *        'status' => '' - ActionScheduler_Store::STATUS_COMPLETE or ActionScheduler_Store::STATUS_PENDING
	 *        'claimed' => null - TRUE to find claimed actions, FALSE to find unclaimed actions, a string to find a specific claim ID
	 *        'per_page' => 5 - Number of results to return
	 *        'offset' => 0
	 *        'orderby' => 'date' - accepted values are 'hook', 'group', 'modified', or 'date'
	 *        'order' => 'ASC'.
	 *
	 * @param string $return_format OBJECT, ARRAY_A, or ids.
	 * @return array
	 */
	public function search( $args = array(), $return_format = OBJECT ) {
		// Code here to find jobs based on arguments.
	}
}
```

### Making WooCommerce use your custom queue class
In order for WooCommerce to use your custom queue class we need to tell it to do so otherwise, it will just default to using the built-in WC_Action_Queue class which is based on the [Action Scheduler library](https://github.com/Prospress/action-scheduler). You would do this from your queue extension using code like this.

```
add_filter( 'woocommerce_queue_class', 'wc_please_use_my_queue' );
function wc_please_use_my_queue( $class ) {
    // Remember to include the class file before calling this.
    return 'WC_My_Custom_Queue`;
}
```