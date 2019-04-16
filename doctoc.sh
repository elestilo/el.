#!/usr/bin/env bash
# Generate "Table of Contents"
#
# Requirements:
# npm install -g doctoc
# Ack: https://beyondgrep.com/documentation/

command -v doctoc >/dev/null 2>&1 || { 
  echo >&2 "doctoc is required! Install with \"npm install -g doctoc\". Aborting...";
  exit 1;
}

command -v doctoc >/dev/null 2>&1 || { 
  echo >&2 "ack is required! Aborting...";
  exit 1;
}

ack -L 'DOCTOC SKIP' | xargs doctoc *.md --title '## Table of Contents' --github 
