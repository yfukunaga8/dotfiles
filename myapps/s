#!/bin/bash

Host=$1
password=`awk "/#Password/ && inhost { print $3 } /^Host/ {inhost=0} /^Host $Host/ {inhost=1}" ~/.ssh/config | awk '{print $2}'`

if [[ -z "$password" ]]; then
  /usr/bin/ssh $*
else
  sshpass -p $password /usr/bin/ssh $*
fi

