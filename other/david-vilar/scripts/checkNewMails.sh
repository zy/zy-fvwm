#!/bin/bash

mailboxes="put your mailboxes here"

mailString=""
for m in $mailboxes; do
    accessTime=$(ls -l --time=atime --time-style=+%s $m | cut -d " " -f 6)
    modTime=$(ls -l --time-style=+%s $m | cut -d " " -f 6)
    if [ $modTime -gt $accessTime ]; then
	mailString="$mailString ${m/*\//}"
    fi
done

if [ "$mailString" != "" ]; then
    echo "Mail:$mailString"
else
    echo "Mail:"
fi
