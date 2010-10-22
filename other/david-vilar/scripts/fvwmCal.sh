#!/bin/bash

month=`date +%m`
year=`date +%Y`

function addToMonth() {
    month=$((month + $1))
    if [ $month = 0 ]; then
	year=$((year - 1))
	month=12
    elif [ $month = 13 ]; then
    	year=$((year + 1))
	month=1
    fi
}

quit=false
while ! $quit; do
    clear
    cal -m $month $year | awk 'NF > 0'
    read -n 1 -s action
    case $action in
    (n|N)
    	addToMonth 1
	;;
    (p|P)
    	addToMonth -1
	;;
    (q|Q)
    	quit=true
	;;
    esac
done
