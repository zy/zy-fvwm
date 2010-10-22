# Common macro definitions:

m4_dnl NB SYSTEMNAME is visible to m4, $[HOSTNAME] is visible to fvwm:
m4_define(SYSTEMNAME,m4_esyscmd(hostname | awk -F. '{ORS=""; print $1}'))
m4_changequote({,})

m4_dnl usage: FOR({expression in '_ITERATOR'},{item1, item2, ...})
m4_dnl prints the expression (which cannot contain ',') for each item (which may not contain '_ITERATOR' or ',')
m4_dnl eg. FOR({==_ITERATOR== }, 1, 2, 3) print:
m4_dnl ==1== ==2== ==3== 
m4_define({FOR},{m4_pushdef({_ITERATOR},$2)$1{}m4_popdef({_ITERATOR})m4_ifelse($#,2,,{FOR($1, m4_shift(m4_shift($@)))})})

# usage is MENU_ITEM(flag)
m4_define({MENU_ITEM},{m4_ifdef($1,m4_dnl
+ "$1_menu_label{}m4_ifdef($1_mini,%$1_mini%)" $1_run
)m4_dnl
})

m4_define({APPSPANEL_ITEM},{
	m4_ifdef($1,
		*Appspanel(Title '$1_panel_label'{,}Icon $1_icon, Action `$1_run`),
	)
})

m4_define({APPLET_ITEM},{
	m4_ifdef($1,
		*FvwmButtons(Swallow(Respawn) "$1_style_name" `$1_run`, \
		m4_ifdef($1_button1,{Action(Mouse 1) '$1_button1', \
})m4_dnl
		m4_ifdef($1_button2,{Action(Mouse 2) '$1_button2', \
})m4_dnl
		m4_ifdef($1_button3,{Action(Mouse 3) '$1_button3', \
})m4_dnl
		)
		m4_define({NUMICONS},m4_decr(NUMICONS))
	)
})

m4_dnl usage: BUTTON(name)
m4_define({BUTTON},
	{m4_ifdef({$1}_onbar,
		{
	})
})

m4_define({APPSPANEL},{})
m4_define({ADD_TO_APPSPANEL},{m4_define({APPSPANEL},APPSPANEL {$1})})
m4_define({MAIN_MENU},{})
m4_define({ADD_TO_MAIN_MENU},{m4_define({MAIN_MENU},MAIN_MENU {$1})})
m4_define({APPLETS},{})
m4_define({ADD_TO_APPLETS},{m4_define({APPLETS},APPLETS {$1})})
m4_define({APPS_MENU},{})
m4_define({ADD_TO_APPS_MENU},{m4_define({APPS_MENU},APPS_MENU {$1})})
m4_define({INTERNET_MENU},{})
m4_define({ADD_TO_INTERNET_MENU},{m4_define({INTERNET_MENU},INTERNET_MENU {$1})})
m4_define({PROD_MENU},{})
m4_define({ADD_TO_PROD_MENU},{m4_define({PROD_MENU},PROD_MENU {$1})})
m4_define({CROSS_MENU},{})
m4_define({ADD_TO_CROSS_MENU},{m4_define({CROSS_MENU},CROSS_MENU {$1})})
m4_define({SYSTEM_MENU},{})
m4_define({ADD_TO_SYSTEM_MENU},{m4_define({SYSTEM_MENU},SYSTEM_MENU {$1})})
m4_define({MULTIMEDIA_MENU},{})
m4_define({ADD_TO_MULTIMEDIA_MENU},{m4_define({MULTIMEDIA_MENU},MULTIMEDIA_MENU {$1})})
m4_define({UTILITIES_MENU},{})
m4_define({ADD_TO_UTILITIES_MENU},{m4_define({UTILITIES_MENU},UTILITIES_MENU {$1})})
m4_define({XUTILITIES_MENU},{})
m4_define({ADD_TO_XUTILITIES_MENU},{m4_define({XUTILITIES_MENU},XUTILITIES_MENU {$1})})
m4_define({GAMES_MENU},{})
m4_define({ADD_TO_GAMES_MENU},{m4_define({GAMES_MENU},GAMES_MENU {$1})})
m4_define({OFFICE_MENU},{})
m4_define({ADD_TO_OFFICE_MENU},{m4_define({OFFICE_MENU},OFFICE_MENU {$1})})
m4_define({DEV_MENU},{})
m4_define({ADD_TO_DEV_MENU},{m4_define({DEV_MENU},DEV_MENU {$1})})
m4_define({_STYLE_LIST},{})
m4_define({_ADD_TO_STYLE_LIST},{m4_ifelse({$1},_flag,,{m4_define({_STYLE_LIST},_STYLE_LIST {$1})})})

m4_define({PROGNAME2MACRO},{tr '[a-z]' '[A-Z]'|tr -d '.:/-'})

# this macro defines the flag if the application appears to be runable - it gets the value of it's own name in lowercase (less . and -)!
# usage is DEFINE_IF_RUNABLE(application, flag)
m4_define({DEFINE_IF_RUNABLE},{m4_esyscmd(if type {$1} >/dev/null 2>&1; then echo -n {"m4_define({$2},`echo -n {$2}|tr '[A-Z]' '[a-z]'|tr -d '.:/-'`)_ADD_TO_STYLE_LIST($2)"}; else echo -n {"m4_undefine({$2})"}; fi)})

# usage is SIMPLE_PROGRAM(program)
m4_define({SIMPLE_PROGRAM},
	{m4_undefine({_FLAG})
	DEFINE_IF_RUNABLE({$1},{_FLAG})
	m4_ifdef({_FLAG},{m4_dnl
		m4_define({PROGRAM},{m4_esyscmd(echo -n {$1}|PROGNAME2MACRO)})m4_dnl
		m4_define(PROGRAM{}_menu_label,{$1})m4_dnl
		m4_define(PROGRAM{}_panel_label,{$1})m4_dnl
		m4_define(PROGRAM{}_mini,GETMINI($1.xpm,$1))m4_dnl
		m4_define(PROGRAM{}_run,{Exec exec $1})m4_dnl
		m4_define(PROGRAM{}_style_name,{$1})m4_dnl
		m4_define(PROGRAM,{$1})m4_dnl
		_ADD_TO_STYLE_LIST({PROGRAM})
		})m4_dnl
	}
)m4_dnl

m4_dnl efine({DEBUG},{m4_errprint({$1}
m4_dnl )})
m4_dnl efine({DEBUG},{Echo $1})

m4_ifdef({DEBUG},,{m4_define({DEBUG},{})})

m4_define({AS_ROOT},m4_esyscmd(if [ `id -u` -ne 0 ]; then echo -n sudo; fi))

m4_define({BORDERWIDTH},5)
m4_define({HANDLEWIDTH},5)

m4_define(GETMINI,{m4_esyscmd(./get_mini "IMAGEPATH" "$1" "$2")})