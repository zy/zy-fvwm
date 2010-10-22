#!/usr/bin/awk -f
# $Id: getquota.awk,v 1.2 2005/06/08 12:59:27 vilar Exp $

BEGIN {
   kB2GB = 1000000;
}

/homes/ {
   if (homequota)
      next;
   getline;
   homequota = $1/kB2GB;
   homelimit = $2/kB2GB;
}

/work/ {
  if (workquota)
      next;
   getline;
   workquota = $1/kB2GB;
   worklimit = $2/kB2GB;
}

END {
  printf("%.1f %d %.1f %d", homequota, homelimit, workquota,  worklimit)
}
