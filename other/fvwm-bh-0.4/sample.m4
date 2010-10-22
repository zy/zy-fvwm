m4_dnl Customisations specific to your host - edit this freely - just
m4_dnl watch those brackets and braces!
m4_dnl
m4_dnl In case you're really puzzled, this is written in the m4
m4_dnl language - do an "info m4" for details, but here are some hints:
m4_dnl
m4_dnl m4_dnl means a comment
m4_dnl
m4_dnl m4_define(a,b) defines a macro named 'a' to have the value 'b'
m4_dnl - a any 'a' in subsequent text is replaced by 'b'
m4_dnl
m4_dnl m4_divert(-1) sends output to the bit bucket
m4_dnl m4_divert(0) sends it to stdout again
m4_dnl
m4_dnl m4_ifdef(a,b) means only output 'b' is 'a' is defined
m4_dnl
m4_dnl The curly braces { and } are just used to quote macros
m4_dnl
m4_dnl fvwm macros defined in the other .m4 files are all capitalised eg ADD_TO_MAIN_MENU()

m4_divert(-1)
m4_dnl Customisations specific to your system

m4_define({NUMDESKS},2)
m4_define({APP_PANEL_ROWS}, 2)
m4_define({BUTTONBAR})
m4_define({BUTTON_PADDING},0)
m4_define({BUTTON_FRAMESIZE},2)
m4_dnl if the buttonbar doesn't size properly, you may need to over-ride the calculated values here:
m4_dnl m4_define({NUMICONS},21)
m4_dnl m4_define({ICONBOXSIZE},10)

m4_dnl Here's an example of adding a new application - in this case
m4_dnl it's just a different run-string for a standard application.
m4_dnl It also gets added to the Main Menu later on.
DEFINE_IF_RUNABLE(gjots,{PERSONALGJOTS})
m4_ifdef({PERSONALGJOTS},{
m4_define({PERSONALGJOTS_menu_label},Personal gjots)
m4_define({PERSONALGJOTS_panel_label},p-gjots)
m4_define({PERSONALGJOTS_mini},GETMINI(gjots.xpm,gjots))
m4_define({PERSONALGJOTS_run},{Exec exec gjots $HOME/general/personal.gjots.cpt})
ADD_TO_UTILITIES_MENU(personalgjots)
})

m4_dnl Just in case you need to override this - it's the
m4_dnl percent of the horizontal screen display that the maximise
m4_dnl function gives - just enough to not quite cover the buttonbar
m4_dnl at the right - calculated in keys.m4
m4_dnl define({MAX_X},96)

m4_dnl The list of remote hosts we want to log in to:
m4_define({XTERM_HOSTS},{rasam dux athlon})
m4_define({XTERM_HOSTS_icon},Network.xpm)

m4_dnl a number to start the list of Xnest display numbers: must not
m4_dnl conflict with your X or main display numbers (probably just 0
m4_dnl and maybe 1 if you use a second server)
m4_define({XNEST_BASE},10)
m4_define({XNEST_HOSTS},XTERM_HOSTS)

m4_dnl a number to start the list of X display numbers: must not
m4_dnl conflict with your Xnest or main display numbers (probably just
m4_dnl 0 and maybe 1 if you use a second server)
m4_define({X_BASE},2)
m4_define({X_HOSTS},XTERM_HOSTS)

m4_dnl This is a good way to override the run string in apps.m4 for a fast mouse:
m4_dnl efine({MOUSE_run},/usr/X11R6/bin/xset m 7 r rate 500 50)

m4_dnl Where I like things to go - or am I too tidy?
m4_ifdef({MOZILLAFIREBIRD},{m4_define({MOZILLAFIREBIRD_extras},{SkipMapping, StartsOnPage 0 1 1})})
m4_ifdef({MOZILLAFIREFOX},{m4_define({MOZILLAFIREFOX_extras},{SkipMapping, StartsOnPage 0 1 1})})
m4_ifdef({MOZILLAFIREFOXBIN},{m4_define({MOZILLAFIREFOXBIN_extras},{SkipMapping, StartsOnPage 0 1 1})})
m4_ifdef({NETSCAPE},{m4_define({NETSCAPE_extras},{SkipMapping, StartsOnPage 0 1 1})})
m4_ifdef({SYLPHEED},{m4_define({SYLPHEED_extras},{SkipMapping, StartsOnPage 0 0 0})})
m4_ifdef({OPERA},{m4_define({OPERA_extras},{StartsOnPage 0 1 1})})
m4_ifdef({MOZILLA},{m4_define({MOZILLA_extras},{SkipMapping, StartsOnPage 0 1 1})})
m4_ifdef({VMWARE},{m4_define({VMWARE_extras},{SkipMapping, StartsOnPageIncludesTransients, StartsOnPage 1 0 0})})
m4_ifdef({EMACS},{m4_define({EMACS_extras},{SkipMapping, StartsAnywhere})})

m4_dnl Define items for the root menu (they will be automatically
m4_dnl removed from the apps/etc menu): You can add items here but
m4_dnl you'll also need to add them in menus.m4 (and possibly in
m4_dnl apps.m4)
ADD_TO_MAIN_MENU(rxvt)
ADD_TO_MAIN_MENU(rox)
ADD_TO_MAIN_MENU(lock)
ADD_TO_MAIN_MENU(standards)
m4_dnl ADD_TO_MAIN_MENU(netscape)
m4_dnl ADD_TO_MAIN_MENU(sylpheed)
m4_dnl ADD_TO_MAIN_MENU(opera)
m4_dnl ADD_TO_MAIN_MENU(mozilla)
m4_dnl ADD_TO_MAIN_MENU(mozillafirebird)
m4_dnl ADD_TO_MAIN_MENU(mozillafirefox)
m4_dnl ADD_TO_MAIN_MENU(dillo)
ADD_TO_MAIN_MENU(ical)
m4_dnl ADD_TO_MAIN_MENU(abiword)
m4_dnl ADD_TO_MAIN_MENU(emacs)
m4_dnl ADD_TO_MAIN_MENU(nedit)
m4_dnl ADD_TO_MAIN_MENU(netbeans)
m4_dnl ADD_TO_MAIN_MENU(dialler)
m4_dnl ADD_TO_MAIN_MENU(vmware)
ADD_TO_MAIN_MENU(word)
ADD_TO_MAIN_MENU(gdcalc)
ADD_TO_MAIN_MENU(gjots)
ADD_TO_MAIN_MENU(personalgjots)
m4_dnl ADD_TO_MAIN_MENU(gnumeric)

m4_dnl Define items to go on the button bar: You can add items here
m4_dnl but you'll also need to add them in buttons.m4 (and possibly in
m4_dnl apps.m4)
ADD_TO_APPSPANEL(gftp)
ADD_TO_APPSPANEL(openoffice)
ADD_TO_APPSPANEL(gdcalc)
ADD_TO_APPSPANEL(gnumeric)
ADD_TO_APPSPANEL(gimp)
ADD_TO_APPSPANEL(abiword2)
ADD_TO_APPSPANEL(linneigh)
ADD_TO_APPSPANEL(smb4k)
ADD_TO_APPSPANEL(netscape)
ADD_TO_APPSPANEL(sylpheed)
ADD_TO_APPSPANEL(opera)
ADD_TO_APPSPANEL(mozillafirefox)
ADD_TO_APPSPANEL(vmware)
ADD_TO_APPSPANEL(ical)
ADD_TO_APPSPANEL(emacs)

m4_dnl These are docking apps:
ADD_TO_APPLETS({ascpu})
ADD_TO_APPLETS({asmem})
ADD_TO_APPLETS({wmpload})
ADD_TO_APPLETS({wmxmms})
ADD_TO_APPLETS({rclock})
ADD_TO_APPLETS({wmfire})

m4_dnl ================== CUSTOMISE THE MENUS ==================

m4_dnl There are up to 3 custom menus hanging off the main menu. We'll only define one here but you can add 2 others:
m4_define({MY_MAIN_MENU1})
m4_define({MY_MAIN_MENU1_title},Custom Apps)
m4_define({MY_MAIN_MENU1_name},local_apps_menu)
m4_define({MY_MAIN_MENU1_mini},GETMINIT(x.xpm,MY_MAIN_MENU1))

DestroyMenu MY_MAIN_MENU1_name
AddToMenu MY_MAIN_MENU1_name
+ "MY_MAIN_MENU1_title" Title
+ "To put items here, edit .fvwm/`hostname`/`hostname`.m4"	Exec exec xeyes

m4_dnl ================== END OF CUSTOM MENUS ==================

m4_dnl Root window backgrounds:

m4_dnl You can choose to have a background for desk 0 and a different
m4_dnl one for desk 1 & 2 - in which case define BG_DESK_0, 1 and 2.
m4_dnl Or you can have a different background for each page, in which
m4_dnl case define BG_DESK_0_PAGE_00 etc instead.

m4_dnl xsetbg is part of the xli package

m4_define({BG_DESK_0},{Colorset 6})
m4_define({BG_DESK_1_PAGE_00},{-solid midnightblue})
m4_define({BG_DESK_1_PAGE_10},{Exec xsetbg $[HOME]/.fvwm/SYSTEMNAME/desk1page10.jpg})
m4_define({BG_DESK_1_PAGE_20},{-solid steelblue})
m4_define({BG_DESK_1_PAGE_01},{Exec xsetbg $[HOME]/.fvwm/SYSTEMNAME/desk1page01.jpg})
m4_define({BG_DESK_1_PAGE_11},{-solid steelblue})
m4_define({BG_DESK_1_PAGE_21},{-solid midnightblue})

m4_dnl You can choose one of these for the "base" decor:

m4_define({THEME},basic)
m4_dnl define({THEME},mockmack)
m4_dnl define({THEME},metal)
m4_define({FONTFAMILY},TIMES)m4_dnl LUCIDA HELVETICA TIMES BOOKMAN CHARTER TIMES
m4_define({FONTBASE},80)m4_dnl TIMES seems to need 80, the others 70

m4_dnl Local Variables: 
m4_dnl fill-column: 70 
m4_dnl eval:(setq compile-command "cd ..; make") 
m4_dnl End: 