#!/bin/bash

# extract the last 10 notes from the notefile $1

sed -ne 's#^\*\* \(TODO \)\?\(.*\)#+ "\2'$2'" OpenFile "'"$1"'"#p' $1 | tail -n 10