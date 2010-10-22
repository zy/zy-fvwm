#!/bin/sh
ps -A | awk '{ print "AddToMenu Processes \""$1"   "$4"\" Popup "$1""}'
ps -A | awk '{ print "AddToMenu "$1" DynamicPopupAction Function GetProcInfo "$1""}'

# ps -ef | awk '{ print "AddToMenu MenuProcess \""$2"   "$8"\" Exec kill -9 "$2 }'
