#!/usr/bin/env bash
# Generate "Table of Contents"
#
# Requirements:
# npm install -g doctoc
# Ack: https://beyondgrep.com/documentation/

ack -L 'DOCTOC SKIP' | xargs doctoc *.md --title '## Table of Contents' --github 
