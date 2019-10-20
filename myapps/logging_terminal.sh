#!/bin/sh
RAW_LOG_FILE_PATH=$HOME/work/logs/raw-terminal.log-$(date +%Y%m%d_%H%M)
LOG_FILE_PATH=$HOME/work/logs/terminal.log-$(date +%Y%m%d_%H%M)
script -f $RAW_LOG_FILE_PATH
cat $RAW_LOG_FILE_PATH | perl -pe 's/\e([^\[\]]|\[.*?[a-zA-Z]|\].*?\a)//g' | col -b > $LOG_FILE_PATH

