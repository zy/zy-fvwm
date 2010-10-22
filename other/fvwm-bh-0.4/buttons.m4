################## FvwmButtons button-bar ################################
# This create the bar on the right side of the screen containing
# various monitors ("applets" in gnome-speak) as well as the pager and
# a tidy container for icons. 
#
# Most buttons are clickable and do appropriate things eg. the
# internet connector pops up if the network icon is clicked with the
# left button.
#
# If you are adding an application, you probably want the AppsPanel definition 
# at the end of this file

m4_ifdef({BUTTON_PADDING},,{m4_define({BUTTON_PADDING},0)})
m4_ifdef({BUTTON_FRAMESIZE},,{m4_define({BUTTON_FRAMESIZE},2)})
m4_dnl 64 is the size of a WM docking app:
m4_define({BUTTONSIZE},m4_eval(64 + BUTTON_PADDING * 2 + BUTTON_FRAMESIZE * 2))

m4_dnl This may not be precise ... you may need to adjust this:
m4_changequote(`,')
m4_define(`YGEOM',m4_esyscmd(xdpyinfo|grep '^  dimensions:'|awk '{print $2}'|sed -e "s/.*x//" |tr -d '\012'))
m4_changequote({,})
m4_ifdef({NUMICONS},,{m4_define({NUMICONS},m4_eval(YGEOM / BUTTONSIZE))})

*FvwmButtons: BoxSize smart
m4_define({BUTTONBARWIDTH},{m4_eval(BUTTONSIZE + 2 * BUTTONBARBORDER)})
EwmhBaseStruts 0 BUTTONBARWIDTH 0 0

*FvwmButtons: Geometry BUTTONBARWIDTH{}x{}YGEOM-1+0
*FvwmButtons: ButtonGeometry BUTTONSIZE{}x{}BUTTONSIZE{}-0+0
*FvwmButtons: Columns 1
*FvwmButtons: Font SMALLFONT
*FvwmButtons: Colorset 0
*FvwmButtons: Frame BUTTON_FRAMESIZE
*FvwmButtons: Padding BUTTON_PADDING BUTTON_PADDING # Must be specified otherwise swallowed windows get none and it looks funny

# 'Applets':
m4_esyscmd(for i in APPLETS; do u=`echo $i | tr '[a-z]' '[A-Z]'|tr -d .-`; echo "{APPLET_ITEM}({{{$u}}}){m4_dnl}"; done)m4_dnl

# Panels:
*FvwmButtons(Icon DivisionBell.xpm,\
	Panel(left, steps 0 position button right) \
	Appspanel "Module FvwmButtons -transientpanel Appspanel")
m4_define({NUMICONS},m4_decr(NUMICONS))

m4_ifdef({XRLOGIN},
	{m4_ifdef({XTERM_HOSTS},
		{*FvwmButtons(Icon XTERM_HOSTS_icon,\
			Panel(left, steps 0, position button right) \
			XtermPanel "Module FvwmButtons -transientpanel XtermPanel")
		m4_define({NUMICONS},m4_decr(NUMICONS))
		})
})

m4_ifdef({XNEST},
	{m4_ifdef({XNEST_HOSTS},
		{*FvwmButtons(Icon XNEST_icon,\
			Panel(left, steps 0, position button right) \
			XnestPanel "Module FvwmButtons -transientpanel XnestPanel")
		m4_define({NUMICONS},m4_decr(NUMICONS))
	})
})

m4_ifdef({VNCVIEWER},
	{m4_ifdef({VNC_HOSTS},
		{*FvwmButtons(Icon VNCVIEWER_icon,\
			Panel(left, steps 0, position button right) \
			VncPanel "Module FvwmButtons -transientpanel VncPanel")
		m4_define({NUMICONS},m4_decr(NUMICONS))
	})
})

m4_ifdef(X_HOSTS,
	{*FvwmButtons(Icon X_icon,\
		Panel(left, steps 0, position button right) \
		XPanel "Module FvwmButtons -transientpanel XPanel")
	m4_define({NUMICONS},m4_decr(NUMICONS))
})

m4_ifdef({RXVT},
	{*FvwmButtons(Icon RXVT_icon, Action RXVT_run)
	m4_define({NUMICONS},m4_decr(NUMICONS))
},
	{m4_ifdef({XTERM},
		{*FvwmButtons(Icon XTERM_icon, Action `XTERM_run`)
		m4_define({NUMICONS},m4_decr(NUMICONS))
	})
})

m4_ifdef({NUMDESKS},,{m4_define({NUMDESKS},1)})m4_dnl
m4_define({LASTDESK},{m4_eval(NUMDESKS-1)})m4_dnl
*FvwmButtons(Frame 0 -geometry 1x{}NUMDESKS Swallow(UseOld) "FvwmPager" "Module FvwmPager 0 LASTDESK")

m4_ifdef({USE_ICONBOX},{
m4_ifdef({ICONBOXSIZE},,{m4_define({ICONBOXSIZE},{m4_eval(NUMICONS-NUMDESKS)})})
*FvwmButtons(Frame 0 -geometry 1x{}ICONBOXSIZE Swallow(UseOld) "FvwmIconBox" "Module FvwmIconBox")
})

m4_ifdef({VNCVIEWER},m4_ifdef({VNC_HOSTS},{
*VncPanel: Rows 1
*VncPanel: Colorset 0
*VncPanel: Font SMALLFONT
m4_esyscmd(sh -c 'for HOST in VNC_HOSTS; do echo "*VncPanel(Title $HOST, Icon VNC_icon, Action \`VNCVIEWER_run $HOST\`)"; done')
}))

m4_ifdef({XRLOGIN},m4_ifdef({XTERM_HOSTS},{
DEBUG(*XtermPanel)
*XtermPanel: Rows 1
*XtermPanel: Colorset 0
*XtermPanel: Font SMALLFONT
m4_esyscmd(sh -c 'for HOST in XTERM_HOSTS; do echo "*XtermPanel(Title $HOST, Icon XTERM_icon, Action \`XRLOGIN_run $HOST\`)"; done')
}))

m4_ifdef({XNEST_BASE},,m4_define({XNEST_BASE},10))
m4_ifdef({XNEST},m4_ifdef({XNEST_HOSTS},{
DEBUG(*XnestPanel)
*XnestPanel: Rows 1
*XnestPanel: Colorset 0
*XnestPanel: Font SMALLFONT
m4_esyscmd(sh -c 'base=XNEST_BASE; for HOST in XNEST_HOSTS; do base=`expr $base + 1`; echo "*XtermPanel(Title $HOST, Icon XNEST_icon, Action \`Xnest :$base -geometry XNEST_GEOM -query $HOST\`)"; done')
}))

m4_ifdef({X_BASE},,m4_define({X_BASE},10))
m4_ifdef({X},m4_ifdef({X_HOSTS},{
DEBUG(*XPanel)
*XPanel: Rows 1
*XPanel: Colorset 0
*XPanel: Font SMALLFONT
m4_esyscmd(sh -c 'base=X_BASE; for HOST in X_HOSTS; do base=`expr $base + 1`; echo "*XtermPanel(Title $HOST, Icon X_icon, Action \`Exec X :$base -query $HOST\`)"; done')
}))

m4_dnl These are the items which can appear in the apps panel - add to
m4_dnl it, just make sure there is an entry in apps.m4 and you'll need
m4_dnl to define PROG_onbar in your .fvwm/`hostname`/`hostname`.m4 file
DEBUG(Appspanel)
DestroyModuleConfig Appspanel*
*Appspanel: Rows APP_PANEL_ROWS
*Appspanel: Colorset 0
*Appspanel: Font SMALLFONT

# {APPSPANEL}=APPSPANEL
m4_esyscmd(for i in APPSPANEL; do u=`echo $i | PROGNAME2MACRO`; echo "{APPSPANEL_ITEM}({{{$u}}})"; done)
