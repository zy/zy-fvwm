#!/bin/sh
#echo '$Id$'
#set -x

echo
echo "`date` $0: start"

cd $HOME
. lib/locale.sh
. .path

if [ "$SHELL" = /bin/sh ] ; then
	if SHELL=`which bash` ; then
		echo "$0: starting bash"
		exec $SHELL $0
		echo "failed"
	fi
	SHELL=/bin/sh
fi

. .env

XVENDOR=$(xdpyinfo | grep '^vendor string' | sed -e 's/.*: *//')

#set up X server
xhost - >/dev/null
xkbd load
xrdb .Xdefaults
xset b 0 0  # xset b off does not work
xset r rate 400 30

if [[ "$XVENDOR" != *VNC* ]] ; then
	dpmsoff init
	xscreensaver -nosplash &
	xsetroot -solid navy &
	#xroot &
	#xclock -g x13+0+0 -strftime '%e.%m. %T' & # 110x13
	[ -e .plan.dir/dayplan ] && type -p pland > /dev/null && pland -k &
	[ -f .aumixrc-default ] && aumix -f .aumixrc-default -L
	#type -p esd > /dev/null && esd -nobeeps -as 2 &
	workrave &
	xplanet -lat 51.191253 -lon 6.422786 &

	[ -x /usr/bin/gpg-agent ] && [ -z "$GPG_AGENT_INFO" ] && eval `gpg-agent --daemon`
	[ -z "$SSH_AUTH_SOCK" ] && eval `ssh-agent`
	[ "`echo .ssh/*.pub`" != ".ssh/*.pub" ] && [ "$SSH_AUTH_SOCK" ] && ssh-add < /dev/null # there are keys
	[ -f ~/.xsession-local ] && . ~/.xsession-local
else
	xsetroot -solid limegreen
fi

# ugly hack to make SHLVL=1 in xterms spawned by fvwm
SHLVL=-1

while ! wmii ; do sleep 5 ; done

#[[ "$XVENDOR" != *VNC* ]] && export console=yes
#xterm +ut -vb -C -geometry 62x5+120-0 -T console

# vim:ts=4:sw=4:
