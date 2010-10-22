#!/bin/sh
# $Id: fvwmGetBatteryStatus.sh,v 1.2 2005/06/08 12:59:26 vilar Exp $

acpiLine=`acpi -b | sed 's/^ *//'`

case $acpiLine in
(*discharging*)
  output=d
  ;;
(*charging*)
  output=c
  ;;
(*charged*)
  output=f
  ;;
esac

level=`echo $acpiLine | cut -d " " -f 4 | tr -d "%,"`
output=$output$level

echo $output
