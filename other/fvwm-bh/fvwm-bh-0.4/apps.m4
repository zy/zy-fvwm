m4_dnl What we know about applications:
m4_dnl #_menu_label is the menu label (can be longer)
m4_dnl #_panel_menu is the panel label (should be short)
m4_dnl #_style_name is the name for the Style
m4_dnl #_icon is the icon for the Style
m4_dnl #_mini is the mini-icon for the Style and for the menu
m4_dnl #_extras are any extra styles needed
m4_dnl #_run is how to run it (as an executable)
m4_dnl #_button[123] are executed in the main button bar - in response to mouse button 1/2/3

m4_dnl To add an app:
m4_dnl o create an entry here
m4_dnl o add an entry in menus.m4
m4_dnl o add an entry in buttons.m4
m4_dnl o customise your hostname/hostname.m4 file if necessary

m4_dnl apps should be assigned to one (or more) of the following categories for menus:
m4_dnl ADD_TO_APPS_MENU
m4_dnl ADD_TO_INTERNET_MENU
m4_dnl ADD_TO_MULTIMEDIA_MENU
m4_dnl ADD_TO_UTILITIES_MENU
m4_dnl ADD_TO_XUTILITIES_MENU
m4_dnl ADD_TO_GAMES_MENU
m4_dnl ADD_TO_OFFICE_MENU
m4_dnl ADD_TO_DEV_MENU

m4_dnl the rule for defining the various application flags (eg RXVT) is
m4_dnl define it if it is runnable (eg 'type rxvt' succeeds)
m4_dnl the name should be the same as the program except in upper case and with funny characters (-) removed
m4_dnl tha value should be the same as its name except in lower case

m4_dnl Note that the argument for GNOME_PROGRAM is the basename of the
m4_dnl /usr/share/applications/*.desktop file without the `.desktop'

m4_dnl ************ Configure items from here down:

DEFINE_IF_RUNABLE(rxvt,{RXVT})
m4_ifdef({RXVT},{
m4_define({RXVT_menu_label},Rxvt)
m4_define({RXVT_panel_label},Rxvt)
m4_define({RXVT_mini},GETMINI(NeXTterm4.xpm,rxvt))
m4_define({RXVT_style_name},rxvt*)
m4_define({RXVT_run},{RunFocusWarp `Exec exec rxvt -ls -tn rxvt -sk -title SYSTEMNAME` RXVT RXVT_style_name})
m4_define({RXVT_icon},LinuxMonitor.xpm)
m4_define({RXVT_extras},{SloppyFocus, WindowListSkip})
ADD_TO_UTILITIES_MENU(rxvt)
})

DEFINE_IF_RUNABLE({xterm},{XTERM})
m4_ifdef({XTERM},{
m4_define({XTERM_menu_label},Xterm)
m4_define({XTERM_panel_label},Xterm)
m4_define({XTERM_style_name},xterm)
m4_define({XTERM_icon},gnome-color-xterm.xpm)
m4_define({XTERM_mini},GETMINI(NeXTterm4.xpm,xterm))
m4_define({XTERM_extras},{SloppyFocus, WindowListSkip})
m4_define({XTERM_run},{Exec exec xterm -r -sk -title SYSTEMNAME})
ADD_TO_UTILITIES_MENU(xterm)
})

DEFINE_IF_RUNABLE({xscreensaver-command},{LOCK})
m4_ifdef({LOCK},{
m4_define({LOCK_menu_label},Lock)
m4_define({LOCK_panel_label},Lock)
m4_define({LOCK_mini},GETMINI(screensaver-locking.xpm,xscreensaver-command))
m4_define({LOCK_run},{Exec exec xscreensaver-command -lock})
})

DEFINE_IF_RUNABLE({emacs},{EMACS})
m4_ifdef({EMACS},{
m4_define({EMACS_menu_label},Emacs)
m4_define({EMACS_panel_label},Emacs)
m4_define({EMACS_style_name},emacs*)
m4_define({EMACS_icon},ColorGNU.xpm)
m4_define({EMACS_mini},GETMINI(ColorGNU.xpm,emacs))
m4_define({EMACS_geom},129x84+0+0)
m4_define({EMACS_run},{Exec exec emacs --geometry EMACS_geom})
ADD_TO_DEV_MENU(emacs)
})

DEFINE_IF_RUNABLE({standard_x_apps},{STANDARDS})
m4_ifdef({STANDARDS},{
m4_define({STANDARDS_menu_label},Standard apps)
m4_define({STANDARDS_panel_label},Std apps)
m4_define({STANDARDS_mini},GETMINI(x.xpm,standard_x_apps))
m4_define({STANDARDS_run},{Exec exec standard_x_apps EMACS_geom})
})

DEFINE_IF_RUNABLE({/opt/netscape/netscape},{NETSCAPE})
m4_ifdef({NETSCAPE},{
m4_define({NETSCAPE_menu_label},Netscape)
m4_define({NETSCAPE_panel_label},Netscape)
m4_define({NETSCAPE_style_name},netscape*)
m4_define({NETSCAPE_icon},Netscape.xpm)
m4_define({NETSCAPE_mini},GETMINI(netscape.xpm,netscape))
m4_define({NETSCAPE_run},{Exec exec netscape -geometry +0+0})
ADD_TO_INTERNET_MENU(netscape)
})

DEFINE_IF_RUNABLE({sylpheed},{SYLPHEED})
m4_ifdef({SYLPHEED},{
m4_define({SYLPHEED_menu_label},Sylpheed)
m4_define({SYLPHEED_panel_label},Sylpheed)
m4_define({SYLPHEED_style_name},*Sylpheed*)
m4_define({SYLPHEED_icon},sylpheed.xpm)
m4_define({SYLPHEED_mini},GETMINI(sylpheed.xpm,sylpheed))
m4_define({SYLPHEED_run},{Exec exec sylpheed -geometry +0+0})
ADD_TO_INTERNET_MENU(sylpheed)
})

DEFINE_IF_RUNABLE({opera},{OPERA})
m4_ifdef({OPERA},{
m4_define({OPERA_menu_label},Opera)
m4_define({OPERA_panel_label},Opera)
m4_define({OPERA_style_name},opera)
m4_define({OPERA_icon},opera_48x48.xpm)
m4_define({OPERA_mini},GETMINI(opera_16x16.xpm,opera))
m4_define({OPERA_run},{Exec exec opera})
ADD_TO_INTERNET_MENU(opera)
})

# not tested - too old?
DEFINE_IF_RUNABLE({mozilla},{MOZILLA})
m4_ifdef({MOZILLA},{
m4_define({MOZILLA_menu_label},Mozilla)
m4_define({MOZILLA_panel_label},Mozilla)
m4_define({MOZILLA_style_name},*Mozilla*)
m4_define({MOZILLA_icon},mozilla-icon.xpm)
m4_define({MOZILLA_mini},GETMINI(mozilla-icon.xpm,mozilla))
m4_define({MOZILLA_run},{Exec exec mozilla})
ADD_TO_INTERNET_MENU(mozilla)
})

# not tested, may need the _run part tweaking:
DEFINE_IF_RUNABLE({MozillaFirebird},{MOZILLAFIREBIRD})
m4_ifdef({MOZILLAFIREBIRD},{
m4_define({MOZILLAFIREBIRD_menu_label},Mozilla (Firebird))
m4_define({MOZILLAFIREBIRD_panel_label},Mozilla)
m4_define({MOZILLAFIREBIRD_style_name},*Mozilla*)
m4_define({MOZILLAFIREBIRD_icon},mozilla-icon.xpm)
m4_define({MOZILLAFIREBIRD_mini},GETMINI(mozilla-icon.xpm,mozillafirebird))
m4_define({MOZILLAFIREBIRD_run},{Exec exec MozillaFirebird})
ADD_TO_INTERNET_MENU(mozillafirebird)
})

DEFINE_IF_RUNABLE({dillo},{DILLO})
m4_ifdef({DILLO},{
m4_define({DILLO_menu_label},Dillo)
m4_define({DILLO_panel_label},Dillo)
m4_define({DILLO_style_name},Dillo)
m4_define({DILLO_icon},Dillo.xpm)
m4_define({DILLO_mini},GETMINI(dillo.xpm,dillo))
m4_define({DILLO_run},{Exec exec dillo})
ADD_TO_INTERNET_MENU(dillo)
})

DEFINE_IF_RUNABLE({ical},{ICAL})
m4_ifdef({ICAL},{
m4_define({ICAL_menu_label},Ical)
m4_define({ICAL_panel_label},Ical)
m4_define({ICAL_style_name},ical)
m4_define({ICAL_icon},ical.xpm)
m4_define({ICAL_mini},GETMINI(ical.xpm,ical))
m4_define({ICAL_run},{Exec exec ical})
ADD_TO_PROD_MENU(ical)
})

DEFINE_IF_RUNABLE({nedit},{NEDIT})
m4_ifdef({NEDIT},{
m4_define({NEDIT_menu_label},Nedit)
m4_define({NEDIT_panel_label},Nedit)
m4_define({NEDIT_style_name},nedit)
m4_define({NEDIT_icon},nedit.xpm)
m4_define({NEDIT_mini},GETMINI(nedit.xpm,nedit))
m4_define({NEDIT_run},{Exec exec nedit})
ADD_TO_DEV_MENU(nedit)
})

DEFINE_IF_RUNABLE({netbeans},{NETBEANS})
m4_ifdef({NETBEANS},{
m4_define({NETBEANS_menu_label},Netbeans)
m4_define({NETBEANS_panel_label},Netbeans)
m4_define({NETBEANS_mini},GETMINI(netbeans.xpm,netbeans))
m4_define({NETBEANS_run},{Exec exec /opt/netbeans/bin/runide.sh -jdkhome /usr/java/j2sdk1.4.0_02})
ADD_TO_DEV_MENU(netbeans)
})

DEFINE_IF_RUNABLE({gdcalc},{GDCALC})
m4_ifdef({GDCALC},{
m4_define({GDCALC_menu_label},Gdcalc)
m4_define({GDCALC_panel_label},Gdcalc)
m4_define({GDCALC_style_name},gdcalc)
m4_define({GDCALC_icon},HP-16C-48.xpm)
m4_define({GDCALC_mini},GETMINI(HP-16C-48.xpm,gdcalc))
m4_define({GDCALC_run},{Exec exec gdcalc 2>/dev/null})
ADD_TO_PROD_MENU(gdcalc)
})

DEFINE_IF_RUNABLE({gjots},{GJOTS})
m4_ifdef({GJOTS},{
m4_define({GJOTS_menu_label},Gjots)
m4_define({GJOTS_panel_label},Gjots)
m4_define({GJOTS_style_name},Gjots*)
m4_define({GJOTS_icon},gjots.xpm)
m4_define({GJOTS_mini},GETMINI(gjots.xpm,gjots))
m4_define({GJOTS_run},{Exec exec gjots})
ADD_TO_PROD_MENU(gjots)
})

DEFINE_IF_RUNABLE({haltp},{HALT})
m4_ifdef({HALT},{
m4_define({HALT_menu_label},Halt)
m4_define({HALT_panel_label},Halt)
m4_define({HALT_mini},GETMINI(mini-bomb.xpm,halt))
m4_define({HALT_run},Exec exec haltp)
ADD_TO_SYSTEM_MENU(halt)
})

DEFINE_IF_RUNABLE({LinNeighborhood},{LINNEIGH})
m4_ifdef({LINNEIGH},{
m4_define({LINNEIGH_menu_label},LinNeighbourhood)
m4_define({LINNEIGH_panel_label},LinNeigh)
m4_define({LINNEIGH_mini},GETMINI(LinNeighborhood.xpm,LinNeighborhood))
m4_define({LINNEIGH_run},Exec exec sh -c "PATH=$PATH:/usr/sbin LinNeighborhood")
m4_define({LINNEIGH_icon},LinNeighborhood.xpm)
ADD_TO_CROSS_MENU(linneigh)
})

DEFINE_IF_RUNABLE({xnest},{XNEST})
m4_ifdef({XNEST},{
m4_define({XNEST_menu_label},Xnest)
m4_define({XNEST_panel_label},Xnest)
m4_define({XNEST_mini},GETMINI(x.xpm,xnest))
m4_define({XNEST_run},Exec exec Xnest -broadcast)
m4_define({XNEST_icon},NeXTterm4.xpm)
ADD_TO_XUTILITIES_MENU(xnest)
})

DEFINE_IF_RUNABLE({xset},{MOUSE})
m4_ifdef({MOUSE},{
m4_define({MOUSE_menu_label},Reset mouse)
m4_define({MOUSE_panel_label},mouse)
m4_define({MOUSE_mini},GETMINI(mini.fvwm.xpm,mouse))
m4_define({MOUSE_run},Exec exec xset m)
ADD_TO_XUTILITIES_MENU(mouse)
})

DEFINE_IF_RUNABLE({gmplayer},{GMPLAYER})
m4_ifdef({GMPLAYER},{
m4_define({GMPLAYER_menu_label},Gmplayer - audio player)
m4_define({GMPLAYER_panel_label},Gmplayer)
m4_define({GMPLAYER_mini},GETMINI(mplayer.xpm,gmplayer))
m4_define({GMPLAYER_run},Exec exec gmplayer)
ADD_TO_MULTIMEDIA_MENU(gmplayer)
})

DEFINE_IF_RUNABLE({alsaplayer},{ALSAPLAYER})
m4_ifdef({ALSAPLAYER},{
m4_define({ALSAPLAYER_menu_label},Alsaplayer - audio player)
m4_define({ALSAPLAYER_panel_label},Alsaplayer)
m4_define({ALSAPLAYER_mini},GETMINI(alsaplayer.xpm,alsaplayer))
m4_define({ALSAPLAYER_run},Exec exec alsaplayer)
ADD_TO_MULTIMEDIA_MENU(alsaplayer)
})

DEFINE_IF_RUNABLE({xine},{XINE})
m4_ifdef({XINE},{
m4_define({XINE_menu_label},Xine - movie player)
m4_define({XINE_panel_label},Xine)
m4_define({XINE_mini},GETMINI(xine.xpm,xine))
m4_define({XINE_run},Exec exec xine)
ADD_TO_MULTIMEDIA_MENU(xine)
})

m4_define({SOURCENAVDIR},/opt/sourcenav)
m4_define(SOURCENAV,SOURCENAVDIR/bin/snavigator)
DEFINE_IF_RUNABLE(SOURCENAV,{SNAVIGATOR})
m4_ifdef({SNAVIGATOR},{
m4_define({SNAVIGATOR_menu_label},Source Navigator)
m4_define({SNAVIGATOR_panel_label},SNavigator)
m4_define({SNAVIGATOR_mini},GETMINI(SOURCENAVDIR/share/bitmaps/shadowman.xpm,sourcenav))
m4_define({SNAVIGATOR_run},Exec exec SOURCENAV)
m4_define({SNAVIGATOR_icon},SOURCENAVDIR/share/bitmaps/shadowman.xpm)
ADD_TO_DEV_MENU(snavigator)
})

m4_define({RP8},/opt/RealPlayer8/realplay)
DEFINE_IF_RUNABLE(RP8,{REALPLAYER8})
m4_ifdef({REALPLAYER8},{
m4_define({REALPLAYER8_menu_label},Realplayer8 - media player)
m4_define({REALPLAYER8_panel_label},Realplayer8)
m4_define({REALPLAYER8_mini},GETMINI(realplaymini.xpm,realplay8))
m4_define({REALPLAYER8_run},Exec exec RP8)
m4_define({REALPLAYER8_icon},realplay.xpm)
ADD_TO_MULTIMEDIA_MENU(realplayer8)
})

m4_define({RP9},/opt/RealPlayer9/realplay)
DEFINE_IF_RUNABLE(RP9,{REALPLAYER9})
m4_ifdef({REALPLAYER9},{
m4_define({REALPLAYER9_menu_label},Realplayer9 - media player)
m4_define({REALPLAYER9_panel_label},Realplayer9)
m4_define({REALPLAYER9_mini},GETMINI(realplaymini.xpm,realplay9))
m4_define({REALPLAYER9_run},Exec exec RP9)
m4_define({REALPLAYER9_icon},realplay.xpm)
ADD_TO_MULTIMEDIA_MENU(realplayer9)
})

DEFINE_IF_RUNABLE({gftp},{GFTP})
m4_ifdef({GFTP},{
m4_define({GFTP_menu_label},Gftp - ftp client)
m4_define({GFTP_panel_label},Gftp)
m4_define({GFTP_mini},GETMINI(ftp.xpm,gftp))
m4_define({GFTP_run},Exec exec gftp)
m4_define({GFTP_style_name},gftp)
m4_define({GFTP_icon},ftp.xpm)
ADD_TO_INTERNET_MENU(gftp)
})

DEFINE_IF_RUNABLE({tkmasqdial},{TKMASQ})
m4_ifdef({TKMASQ},{
m4_define({TKMASQ_menu_label},Dialler )
m4_define({TKMASQ_panel_label},Dialler )
m4_define({TKMASQ_mini},GETMINI(PhoneTT.xpm,tkmasqdial))
m4_define({TKMASQ_run},Exec exec tkmasqdial)
m4_define({TKMASQ_icon},PhoneTT.xpm)
ADD_TO_INTERNET_MENU(tkmasq)
})

DEFINE_IF_RUNABLE({wvdial},{WVDIAL})
m4_ifdef({WVDIAL},{
m4_define({WVDIAL_menu_label},Dialler)
m4_define({WVDIAL_panel_label},Dialler)
m4_define({WVDIAL_mini},GETMINI(PhoneTT.xpm,wvdial))
m4_define({WVDIAL_run},FvwmForm FvwmForm-Connector)
m4_define({WVDIAL_icon},PhoneTT.xpm)
ADD_TO_INTERNET_MENU(wvdial)
})

DEFINE_IF_RUNABLE({/opt/applix/applix},{APPLIX})
m4_ifdef({APPLIX},{
m4_define({APPLIX_menu_label},Applix)
m4_define({APPLIX_panel_label},Applix)
m4_define({APPLIX_mini},GETMINI(applix.xpm,applix))
m4_define({APPLIX_run},{Exec exec /opt/applix/applix})
m4_define({APPLIX_icon},applix.xpm)
ADD_TO_OFFICE_MENU(applix)
})

DEFINE_IF_RUNABLE({/opt/office52/program/soffice},{STAROFFICE})
m4_ifdef({STAROFFICE},{
m4_define({STAROFFICE_menu_label},StarOffice)
m4_define({STAROFFICE_panel_label},StarOffice)
m4_define({STAROFFICE_mini},GETMINI(so52.xpm,StarOffice52))
m4_define({STAROFFICE_run},{Exec exec soffice})
ADD_TO_OFFICE_MENU(staroffice)
})

DEFINE_IF_RUNABLE({soffice},{OPENOFFICE})
m4_ifdef({OPENOFFICE},{
m4_define({OPENOFFICE_menu_label},OpenOffice)
m4_define({OPENOFFICE_panel_label},OpenOffice)
m4_define({OPENOFFICE_mini},GETMINI(ooo_office.s.xpm,OpenOffice))
m4_define({OPENOFFICE_run},{Exec exec soffice})
m4_define({OPENOFFICE_style_name},soffice)
m4_define({OPENOFFICE_icon},ooo_office.l.xpm)
ADD_TO_OFFICE_MENU(openoffice)
})

DEFINE_IF_RUNABLE({xsane},{XSANE})
m4_ifdef({XSANE},{
m4_define({XSANE_menu_label},Xsane)
m4_define({XSANE_panel_label},Xsane)
m4_define({XSANE_mini},GETMINI(icons/xsane-16x16.xpm,xsane))
m4_define({XSANE_run},{Exec exec xsane})
ADD_TO_MULTIMEDIA_MENU(xsane)
})

DEFINE_IF_RUNABLE({xephem},{XEPHEM})
m4_ifdef({XEPHEM},{
m4_define({XEPHEM_menu_label},xephem)
m4_define({XEPHEM_panel_label},xephem)
m4_define({XEPHEM_mini},GETMINI(mini-XEphem.xpm,xephem))
m4_define({XEPHEM_run},{Exec exec xephem})
ADD_TO_APPS_MENU(xephem)
})

DEFINE_IF_RUNABLE({xtide},{XTIDE})
m4_ifdef({XTIDE},{
m4_define({XTIDE_menu_label},xtide)
m4_define({XTIDE_panel_label},xtide)
m4_define({XTIDE_mini},GETMINI(xtide.xpm,xtide))
m4_define({XTIDE_run},{Exec exec HFILE_PATH=/usr/local/share/xtide/harmonics.world xtide})
ADD_TO_APPS_MENU(xtide)
})

DEFINE_IF_RUNABLE({hwbrowser},{HWBROWSER})
m4_ifdef({HWBROWSER},{
m4_define({HWBROWSER_menu_label},hwbrowser)
m4_define({HWBROWSER_panel_label},hwbrowser)
m4_define({HWBROWSER_mini},GETMINI(hwbrowser.xpm,hwbrowser))
m4_define({HWBROWSER_run},{Exec exec hwbrowser})
ADD_TO_SYSTEM_MENU(hwbrowser})
})

DEFINE_IF_RUNABLE({gnome-cdw},{GNOMECD})
m4_ifdef({GNOMECD},{
m4_define({GNOMECD_menu_label},gnome-cdw)
m4_define({GNOMECD_panel_label},gnome-cdw)
m4_define({GNOMECD_mini},GETMINI(gnome-cdw.xpm,gnome-cdw))
m4_define({GNOMECD_run},{Exec exec gnome-cd})
ADD_TO_MULTIMEDIA_MENU(gnomecd)
})

DEFINE_IF_RUNABLE({gnome-cd-properties},{GNOMECD_PROPERTIES})
m4_ifdef({GNOMECD_PROPERTIES},{
m4_define({GNOMECD_PROPERTIES_menu_label},gnome-cd-properties)
m4_define({GNOMECD_PROPERTIES_panel_label},gnome-cd-properties)
m4_define({GNOMECD_PROPERTIES_mini},GETMINI(gnome-cd-properties.xpm,gnome-cd-properties))
m4_define({GNOMECD_PROPERTIES_run},{Exec exec gnome-cd-properties})
ADD_TO_MULTIMEDIA_MENU(gnomecd_properties})
})

DEFINE_IF_RUNABLE({gnome-character-map},{GNOME_CHARACTER_MAP})
m4_ifdef({GNOME_CHARACTER_MAP},{
m4_define({GNOME_CHARACTER_MAP_menu_label},gnome-character-map)
m4_define({GNOME_CHARACTER_MAP_panel_label},gnome-character-map)
m4_define({GNOME_CHARACTER_MAP_mini},GETMINI(gnome-character-map.xpm,gnome-character-map))
m4_define({GNOME_CHARACTER_MAP_run},{Exec exec gnome-character-map})
ADD_TO_UTILITIES_MENU(gnome_character_map)
})

DEFINE_IF_RUNABLE({gnome-sound-properties},{GNOME_SOUND_PROPERTIES})
m4_ifdef({GNOME_SOUND_PROPERTIES},{
m4_define({GNOME_SOUND_PROPERTIES_menu_label},gnome-sound-properties)
m4_define({GNOME_SOUND_PROPERTIES_panel_label},gnome-sound-properties)
m4_define({GNOME_SOUND_PROPERTIES_mini},GETMINI(gnome-sound-properties.xpm,gnome-sound-properties))
m4_define({GNOME_SOUND_PROPERTIES_run},{Exec exec gnome-sound-properties})
ADD_TO_MULTIMEDIA_MENU(gnome_sound_properties)
})

DEFINE_IF_RUNABLE({gnome-theme-properties},{GNOME_THEME_PROPERTIES})
m4_ifdef({GNOME_THEME_PROPERTIES},{
m4_define({GNOME_THEME_PROPERTIES_menu_label},gnome-theme-properties)
m4_define({GNOME_THEME_PROPERTIES_panel_label},gnome-theme-properties)
m4_define({GNOME_THEME_PROPERTIES_mini},GETMINI(gnome-theme-properties.xpm,gnome-theme-properties))
m4_define({GNOME_THEME_PROPERTIES_run},{Exec exec gnome-theme-properties})
ADD_TO_UTILITIES_MENU(gnome_theme_properties)
})

DEFINE_IF_RUNABLE({redhat-config-date},{REDHAT_CONFIG_DATE})
m4_ifdef({REDHAT_CONFIG_DATE},{
m4_define({REDHAT_CONFIG_DATE_menu_label},redhat-config-date)
m4_define({REDHAT_CONFIG_DATE_panel_label},redhat-config-date)
m4_define({REDHAT_CONFIG_DATE_mini},GETMINI(redhat-config-date.xpm,redhat-config-date))
m4_define({REDHAT_CONFIG_DATE_run},{Exec exec redhat-config-date})
ADD_TO_SYSTEM_MENU(redhat_config_date)
})

DEFINE_IF_RUNABLE({redhat-config-network},{REDHAT_CONFIG_NETWORK})
m4_ifdef({REDHAT_CONFIG_NETWORK},{
m4_define({REDHAT_CONFIG_NETWORK_menu_label},redhat-config-network)
m4_define({REDHAT_CONFIG_NETWORK_panel_label},redhat-config-network)
m4_define({REDHAT_CONFIG_NETWORK_mini},GETMINI(redhat-config-network.xpm,redhat-config-network))
m4_define({REDHAT_CONFIG_NETWORK_run},{Exec exec redhat-config-network})
ADD_TO_SYSTEM_MENU(redhat_config_network)
})

DEFINE_IF_RUNABLE({redhat-config-printer},{REDHAT_CONFIG_PRINTER})
m4_ifdef({REDHAT_CONFIG_PRINTER},{
m4_define({REDHAT_CONFIG_PRINTER_menu_label},redhat-config-printer)
m4_define({REDHAT_CONFIG_PRINTER_panel_label},redhat-config-printer)
m4_define({REDHAT_CONFIG_PRINTER_mini},GETMINI(redhat-config-printer.xpm,redhat-config-printer))
m4_define({REDHAT_CONFIG_PRINTER_run},{Exec exec redhat-config-printer})
ADD_TO_SYSTEM_MENU(redhat_config_printer)
})

DEFINE_IF_RUNABLE({redhat-config-services},{REDHAT_CONFIG_SERVICES})
m4_ifdef({REDHAT_CONFIG_SERVICES},{
m4_define({REDHAT_CONFIG_SERVICES_menu_label},redhat-config-services)
m4_define({REDHAT_CONFIG_SERVICES_panel_label},redhat-config-services)
m4_define({REDHAT_CONFIG_SERVICES_mini},GETMINI(redhat-config-services.xpm,redhat-config-services))
m4_define({REDHAT_CONFIG_SERVICES_run},{Exec exec redhat-config-services})
ADD_TO_SYSTEM_MENU(redhat_config_services)
})

DEFINE_IF_RUNABLE({redhat-config-users},{REDHAT_CONFIG_USERS})
m4_ifdef({REDHAT_CONFIG_USERS},{
m4_define({REDHAT_CONFIG_USERS_menu_label},redhat-config-users)
m4_define({REDHAT_CONFIG_USERS_panel_label},redhat-config-users)
m4_define({REDHAT_CONFIG_USERS_mini},GETMINI(redhat-config-users.xpm,redhat-config-users))
m4_define({REDHAT_CONFIG_USERS_run},{Exec exec redhat-config-users})
ADD_TO_SYSTEM_MENU(redhat_config_users)
})

DEFINE_IF_RUNABLE({redhat-config-xfree86},{REDHAT_CONFIG_XFREE86})
m4_ifdef({REDHAT_CONFIG_XFREE86},{
m4_define({REDHAT_CONFIG_XFREE86_menu_label},redhat-config-xfree86)
m4_define({REDHAT_CONFIG_XFREE86_panel_label},redhat-config-xfree86)
m4_define({REDHAT_CONFIG_XFREE86_mini},GETMINI(redhat-config-xfree86.xpm,redhat-config-xfree86))
m4_define({REDHAT_CONFIG_XFREE86_run},{Exec exec redhat-config-xfree86})
ADD_TO_XUTILITIES_MENU(redhat_config_xfree86)
})

DEFINE_IF_RUNABLE({redhat-control-network},{REDHAT_CONTROL_NETWORK})
m4_ifdef({REDHAT_CONTROL_NETWORK},{
m4_define({REDHAT_CONTROL_NETWORK_menu_label},redhat-control-network)
m4_define({REDHAT_CONTROL_NETWORK_panel_label},redhat-control-network)
m4_define({REDHAT_CONTROL_NETWORK_mini},GETMINI(redhat-control-network.xpm,redhat-control-network))
m4_define({REDHAT_CONTROL_NETWORK_run},{Exec exec redhat-control-network})
ADD_TO_SYSTEM_MENU(redhat_control_network)
})

DEFINE_IF_RUNABLE({redhat-logviewer},{REDHAT_LOGVIEWER})
m4_ifdef({REDHAT_LOGVIEWER},{
m4_define({REDHAT_LOGVIEWER_menu_label},redhat-logviewer)
m4_define({REDHAT_LOGVIEWER_panel_label},redhat-logviewer)
m4_define({REDHAT_LOGVIEWER_mini},GETMINI(redhat-logviewer.xpm,redhat-logviewer))
m4_define({REDHAT_LOGVIEWER_run},{Exec exec redhat-logviewer})
ADD_TO_SYSTEM_MENU(redhat_logviewer)
})

m4_dnl availability of xless is probably more problematic than that of the program itself
DEFINE_IF_RUNABLE({xless},{XLOG})
m4_ifdef({XLOG},{
m4_define({XLOG_menu_label},X log)
m4_define({XLOG_panel_label},X log)
m4_define({XLOG_mini},GETMINI(x.xpm,xxlog))
m4_define({XLOG_run},{Exec exec xless .xsession-errors})
ADD_TO_XUTILITIES_MENU(xlog)
})

DEFINE_IF_RUNABLE({xkill},{XKILL})
m4_ifdef({XKILL},{
m4_define({XKILL_menu_label},xkill)
m4_define({XKILL_panel_label},xkill)
m4_define({XKILL_mini},GETMINI(mini-bomb.xpm,xkill))
m4_define({XKILL_run},{Exec exec xkill})
ADD_TO_XUTILITIES_MENU(xkill)
})

DEFINE_IF_RUNABLE({xcalc},{XCALC})
m4_ifdef({XCALC},{
m4_define({XCALC_menu_label},xcalc)
m4_define({XCALC_panel_label},xcalc)
m4_define({XCALC_mini},GETMINI(x.xpm,xcalc))
m4_define({XCALC_style_name},xcalc)
m4_define({XCALC_icon},xcalc.xpm)
m4_define({XCALC_extras},{NoButton 2,RandomPlacement})
ADD_TO_PROD_MENU(xcalc)
})

DEFINE_IF_RUNABLE({Xdialog},{XCAL})
m4_ifdef({XCAL},{
m4_define({XCAL_menu_label},xcal)
m4_define({XCAL_panel_label},xcal)
m4_define({XCAL_mini},GETMINI(x.xpm,xcal))
m4_define({XCAL_run},{Exec exec Xdialog --stdout --title "CALENDAR" --calendar "Please choose a date..." 0 0 0 0 0})
ADD_TO_PROD_MENU(xcal)
})

DEFINE_IF_RUNABLE({xpdf},{XPDF})
m4_ifdef({XPDF},{
m4_define({XPDF_menu_label},xpdf)
m4_define({XPDF_panel_label},xpdf)
m4_define({XPDF_mini},GETMINI(mini.pdf.xpm,xpdf))
m4_define({XPDF_run},{Exec exec xpdf})
m4_define({XPDF_style_name},xpdf)
m4_define({XPDF_icon},pdf.xpm)
m4_dnl following is so that xpdf showing a man page of FvwmButtons does not get FvwmButtons attributes!
m4_define({XPDF_extras},{Title, Handles, BorderWidth BORDERWIDTH, SloppyFocus, StaysPut, !WindowListSkip})
ADD_TO_OFFICE_MENU(xpdf)
})

DEFINE_IF_RUNABLE({sunclock},{SUNCLOCK})
m4_ifdef({SUNCLOCK},{
m4_define({SUNCLOCK_menu_label},sunclock)
m4_define({SUNCLOCK_panel_label},sunclock)
m4_define({SUNCLOCK_mini},GETMINI(x.xpm,sunclock))
m4_define({SUNCLOCK_run},{Exec exec sunclock -clockgeom 800x460 -clockimage /usr/share/sunclock/earthmaps/large/sunclock_huge_earthmap.jpg})
m4_define({SUNCLOCK_icon},sunclock.xpm)
ADD_TO_UTILITIES_MENU(sunclock)
})

DEFINE_IF_RUNABLE({xman},{XMAN})
m4_ifdef({XMAN},{
m4_define({XMAN_menu_label},Xman)
m4_define({XMAN_panel_label},Xman)
m4_define({XMAN_mini},GETMINI(x.xpm,xman))
m4_define({XMAN_run},{Exec exec xman})
m4_define({XMAN_style_name},xman)
m4_define({XMAN_icon},xman.xpm)
m4_define({XMAN_extras},{RandomPlacement})
ADD_TO_XUTILITIES_MENU(xman)
})

DEFINE_IF_RUNABLE({xmag},{XMAG})
m4_ifdef({XMAG},{
m4_define({XMAG_menu_label},Xmag)
m4_define({XMAG_panel_label},Xmag)
m4_define({XMAG_mini},GETMINI(x.xpm,xmag))
m4_define({XMAG_run},{Exec exec xmag })
m4_define({XMAG_style_name},xmag)
m4_define({XMAG_icon},mag_glass.xpm)
m4_define({XMAG_extras},{RandomPlacement})
ADD_TO_XUTILITIES_MENU(xman)
})

DEFINE_IF_RUNABLE({xfm},{XFM})
m4_ifdef({XFM},{
m4_define({XFM_menu_label},Xfm)
m4_define({XFM_panel_label},Xfm)
m4_define({XFM_mini},GETMINI(x.xpm,xfm))
m4_define({XFM_run},{Exec exec xfm})
ADD_TO_UTILITIES_MENU(xfm)
})

DEFINE_IF_RUNABLE(xpaint,{XPAINT})
m4_ifdef({XPAINT},{
m4_define({XPAINT_menu_label},Xpaint)
m4_define({XPAINT_panel_label},Xpaint)
m4_define({XPAINT_mini},GETMINI(x.xpm,xpaint))
m4_define({XPAINT_run},{Exec exec xpaint})
ADD_TO_MULTIMEDIA_MENU(xpaint)
})

DEFINE_IF_RUNABLE({xload},{XLOAD})
m4_ifdef({XLOAD},{
m4_define({XLOAD_menu_label},X load)
m4_define({XLOAD_panel_label},X load)
m4_define({XLOAD_mini},GETMINI(x.xpm,xload))
m4_define({XLOAD_run},{Exec exec xload})
ADD_TO_SYSTEM_MENU(xload)
})

DEFINE_IF_RUNABLE({xfontsel},{XFONTSEL})
m4_ifdef({XFONTSEL},{
m4_define({XFONTSEL_menu_label},X font selector)
m4_define({XFONTSEL_panel_label},xfontsel)
m4_define({XFONTSEL_mini},GETMINI(x.xpm,xfontsel))
m4_define({XFONTSEL_run},{Exec exec xfontsel})
ADD_TO_XUTILITIES_MENU(xfontsel)
})

DEFINE_IF_RUNABLE({xclipboard},{XCLIP})
m4_ifdef({XCLIP},{
m4_define({XCLIP_menu_label},X clipboard)
m4_define({XCLIP_panel_label},xclipboard)
m4_define({XCLIP_mini},GETMINI(x.xpm,xclipboard))
m4_define({XCLIP_run},{Exec exec xclipboard})
ADD_TO_XUTILITIES_MENU(xclip)
})

m4_dnl OK ^

DEFINE_IF_RUNABLE({xev},{XEV})
m4_ifdef({XEV},{
m4_define({XEV_menu_label},X events)
m4_define({XEV_panel_label},xev)
m4_define({XEV_mini},GETMINI(x.xpm,xev))
m4_define({XEV_run},{Exec exec xev})
ADD_TO_XUTILITIES_MENU(xev)
})

DEFINE_IF_RUNABLE({xcutsel},{XCUTSEL})
m4_ifdef({XCUTSEL},{
m4_define({XCUTSEL_menu_label},X cut<>selection)
m4_define({XCUTSEL_panel_label},xcutsel)
m4_define({XCUTSEL_mini},GETMINI(x.xpm,xcutsel))
m4_define({XCUTSEL_run},{Exec exec xcutsel})
ADD_TO_XUTILITIES_MENU(xcutsel)
})

DEFINE_IF_RUNABLE({xcmap},{XCMAP})
m4_ifdef({XCMAP},{
m4_define({XCMAP_menu_label},X colourmap)
m4_define({XCMAP_panel_label},xcmap)
m4_define({XCMAP_mini},GETMINI(x.xpm,xcmap))
m4_define({XCMAP_run},{Exec exec xcmap})
ADD_TO_XUTILITIES_MENU(xcmap)
})

DEFINE_IF_RUNABLE({xvidtune},{XVIDTUNE})
m4_ifdef({XVIDTUNE},{
m4_define({XVIDTUNE_menu_label},xvidtune)
m4_define({XVIDTUNE_panel_label},xvidtune)
m4_define({XVIDTUNE_mini},GETMINI(x.xpm,xvidtune))
m4_define({XVIDTUNE_run},{Exec exec xvidtune})
ADD_TO_XUTILITIES_MENU(xvidtune)
})

SIMPLE_PROGRAM(xeyes)
ADD_TO_XUTILITIES_MENU(xeyes)

SIMPLE_PROGRAM(efax-gtk)
ADD_TO_OFFICE_MENU(efaxgtk)

DEFINE_IF_RUNABLE({xconsole},{XCONSOLE})
m4_ifdef({XCONSOLE},{
m4_define({XCONSOLE_menu_label},X console msgs)
m4_define({XCONSOLE_panel_label},xconsole)
m4_define({XCONSOLE_mini},GETMINI(x.xpm,xconsole))
m4_define({XCONSOLE_run},{Exec exec xconsole})
ADD_TO_XUTILITIES_MENU(xconsole)
})

m4_dnl availability of xless is probably more problematic than that of the program itself
DEFINE_IF_RUNABLE({xless},{XDPYINFO})
m4_ifdef({XDPYINFO},{
m4_define({XDPYINFO_menu_label},xdpyinfo)
m4_define({XDPYINFO_panel_label},xdpyinfo)
m4_define({XDPYINFO_mini},GETMINI(x.xpm,xdpyinfo))
m4_define({XDPYINFO_run},{Exec exec xdpyinfo |xless})
ADD_TO_XUTILITIES_MENU(xdpyinfo)
})

m4_dnl availability of xless is probably more problematic than that of the program itself
DEFINE_IF_RUNABLE({xless},{XWININFO})
m4_ifdef({XWININFO},{
m4_define({XWININFO_menu_label},X window info)
m4_define({XWININFO_panel_label},xwininfo)
m4_define({XWININFO_mini},GETMINI(x.xpm,xwininfo))
m4_define({XWININFO_run},{Exec exec xwininfo |xless})
ADD_TO_XUTILITIES_MENU(xwininfo)
})

m4_dnl availability of xless is probably more problematic than that of the program itself
DEFINE_IF_RUNABLE({xless},{XPROP})
m4_ifdef({XPROP},{
m4_define({XPROP_menu_label},X window properties)
m4_define({XPROP_panel_label},xprop)
m4_define({XPROP_mini},GETMINI(x.xpm,xprop))
m4_define({XPROP_run},{Exec exec xprop |xless})
ADD_TO_XUTILITIES_MENU(xprop)
})

DEFINE_IF_RUNABLE({editres},{EDITRES})
m4_ifdef({EDITRES},{
m4_define({EDITRES_menu_label},Editres)
m4_define({EDITRES_panel_label},Editres)
m4_define({EDITRES_mini},GETMINI(x.xpm,editres))
m4_define({EDITRES_run},{Exec exec editres})
ADD_TO_XUTILITIES_MENU(editres)
})

DEFINE_IF_RUNABLE({xpat2},{PATIENCE})
m4_ifdef({PATIENCE},{
m4_define({PATIENCE_menu_label},Patience (Klondike))
m4_define({PATIENCE_panel_label},Patience)
m4_define({PATIENCE_mini},GETMINI(x.xpm,xpat2))
m4_define({PATIENCE_run},{Exec exec LANG='' xpat2 -rules Klondike -flips 99 -turn 3})
m4_define({PATIENCE_style_name},xpat2)
ADD_TO_GAMES_MENU(patience)
})

DEFINE_IF_RUNABLE({xosview},{XOSVIEW})
m4_ifdef({XOSVIEW},{
m4_define({XOSVIEW_menu_label},xosview)
m4_define({XOSVIEW_panel_label},xosview)
m4_define({XOSVIEW_mini},GETMINI(x.xpm,xosview))
m4_define({XOSVIEW_run},{Exec exec AS_ROOT xosview -net})
ADD_TO_SYSTEM_MENU(xosview)
})

DEFINE_IF_RUNABLE({xcpustate},{XCPUSTATE})
m4_ifdef({XCPUSTATE},{
m4_define({XCPUSTATE_menu_label},xcpustate)
m4_define({XCPUSTATE_panel_label},xcpustate)
m4_define({XCPUSTATE_run},{Exec exec xcpustate -interval 1 -bg "#a4978e" -fg black}})
m4_define({XCPUSTATE_style_name},xcpustate)
m4_define({XCPUSTATE_icon},xcpustate.xpm)
ADD_TO_SYSTEM_MENU(xcpustate)
})

DEFINE_IF_RUNABLE({timetool},{TIMETOOL})
m4_ifdef({TIMETOOL},{
m4_define({TIMETOOL_run},{Exec exec AS_ROOT timetool})
ADD_TO_SYSTEM_MENU(timetool)
})

DEFINE_IF_RUNABLE({time-admin},{TIMEADMIN})
m4_ifdef({TIMEADMIN},{
m4_define({TIMEADMIN_run},{Exec exec AS_ROOT time-admin})
m4_define({TIMEADMIN_menu_label},Set time (time-admin))
m4_define({TIMEADMIN_panel_label},time-admin)
ADD_TO_SYSTEM_MENU(timeadmin)
})

DEFINE_IF_RUNABLE({vncviewer},{VNCVIEWER})
m4_ifdef({VNCVIEWER},{
m4_define({VNCVIEWER_menu_label},vncviewer)
m4_define({VNCVIEWER_panel_label},vncviewer)
m4_define({VNCVIEWER_mini},GETMINI(x.xpm,vncviewer))
m4_define({VNCVIEWER_run},{Exec exec vncviewer -passwd .vnc/passwd})
m4_define({VNCVIEWER_style_name},vncviewer)
ADD_TO_UTILITIES_MENU(vncviewer)
})

DEFINE_IF_RUNABLE({xgammon},{BACKGAMMON})
m4_ifdef({BACKGAMMON},{
m4_define({BACKGAMMON_menu_label},Backgammon)
m4_define({BACKGAMMON_panel_label},Backgammon)
m4_define({BACKGAMMON_mini},GETMINI(x.xpm,xgammon}))
m4_define({BACKGAMMON_run},{Exec exec xgammon})
m4_define({BACKGAMMON_style_name},xgammon)
ADD_TO_GAMES_MENU(backgammon)
})

DEFINE_IF_RUNABLE({xboard},{CHESS})
m4_ifdef({CHESS},{
m4_define({CHESS_menu_label},Chess)
m4_define({CHESS_panel_label},Chess)
m4_define({CHESS_mini},GETMINI(x.xpm,xboard}))
m4_define({CHESS_run},{Exec exec xboard})
m4_define({CHESS_style_name},xboard)
ADD_TO_GAMES_MENU(xboard)
})

DEFINE_IF_RUNABLE({gkrellm2},{GKRELLM2})
m4_ifdef({GKRELLM2},{
m4_define({GKRELLM2_menu_label},gkrellm2)
m4_define({GKRELLM2_panel_label},gkrellm2)
m4_define({GKRELLM2_mini},GETMINI(x.xpm,gkrellm2))
m4_define({GKRELLM2_run},{Exec exec gkrellm2})
m4_define({GKRELLM2_style_name},Gkrellm2)
m4_define({GKRELLM2_extras},{Sticky})
ADD_TO_UTILITIES_MENU(gkrellm2)
})

SIMPLE_PROGRAM(chromium)
m4_ifdef({CHROMIUM},{
ADD_TO_GAMES_MENU(chromium)
})

SIMPLE_PROGRAM(tuxracer)
m4_ifdef({TUXRACER},{
ADD_TO_GAMES_MENU(tuxracer)
})

SIMPLE_PROGRAM(grect)
m4_ifdef({GRECT},{
ADD_TO_GAMES_MENU(grect)
})

DEFINE_IF_RUNABLE({gtop},{GTOP})
m4_ifdef({GTOP},{
m4_define({GTOP_menu_label},gtop)
m4_define({GTOP_panel_label},gtop)
m4_define({GTOP_mini},GETMINI(gnome-gtop.png,gtop))
m4_define({GTOP_run},{Exec exec gtop})
m4_define({GTOP_icon},gtop)
m4_define({GTOP_style_name},gtop)
m4_define({GTOP_extras},)
ADD_TO_SYSTEM_MENU(gtop)
})

SIMPLE_PROGRAM(xrlogin)
m4_ifdef({XRLOGIN},{
ADD_TO_UTILITIES_MENU(xrlogin)
})

SIMPLE_PROGRAM(usbview)
m4_ifdef({USBVIEW},{
ADD_TO_SYSTEM_MENU(usbview)
})

SIMPLE_PROGRAM(gthumb)
m4_ifdef({GTHUMB},{
ADD_TO_MULTIMEDIA_MENU(gthumb)
})

SIMPLE_PROGRAM(rox)
m4_ifdef({ROX},{
ADD_TO_UTILITIES_MENU(rox)
})

SIMPLE_PROGRAM(xnc)
m4_ifdef({XNC},{
ADD_TO_UTILITIES_MENU(xnc)
})

DEFINE_IF_RUNABLE({xfe},{XFE})
m4_ifdef({XFE},{
m4_define({XFE_menu_label},xfe)
m4_define({XFE_panel_label},xfe)
m4_define({XFE_mini},GETMINI(xfe.png,xfe))
m4_define({XFE_run},{Exec exec xfe})
m4_define({XFE_icon},xfe)
m4_define({XFE_style_name},xfe)
m4_define({XFE_extras},)
ADD_TO_UTILITIES_MENU(xfe)
})

SIMPLE_PROGRAM(smb4k)
m4_ifdef({SMB4K},{
ADD_TO_CROSS_MENU(smb4k)
})

SIMPLE_PROGRAM(gv)
m4_ifdef({GV},{ADD_TO_OFFICE_MENU(gv)})

SIMPLE_PROGRAM(xpp)
m4_ifdef({XPP},{ADD_TO_UTILITIES_MENU(xpp)})

m4_dnl WM applets - no need to put on menus:

# Over-ridden by settings from fvwm-gnome2:
m4_dnl Note: the WMxmms shipped with xmms seems to not work here - you need wmxmms
DEFINE_IF_RUNABLE({wmxmms},{WMXMMS})
m4_ifdef({WMXMMS},{
m4_define({WMXMMS_menu_label},wmxmms)
m4_define({WMXMMS_panel_label},wmxmms)
m4_define({WMXMMS_run},{Exec exec wmxmms --single})
m4_define({WMXMMS_icon},wmxmms)
m4_define({WMXMMS_style_name},wmxmms)
})

DEFINE_IF_RUNABLE({wmsmixer},{WMSMIXER})
m4_ifdef({WMSMIXER},{
m4_define({WMSMIXER_menu_label},wmsmixer)
m4_define({WMSMIXER_panel_label},wmsmixer)
m4_define({WMSMIXER_run},{Exec exec wmsmixer -s})
m4_define({WMSMIXER_icon},wmsmixer)
m4_define({WMSMIXER_style_name},wmsmixer)
})

DEFINE_IF_RUNABLE({rclock},{RCLOCK})
m4_ifdef({RCLOCK},{
m4_define({RCLOCK_menu_label},rclock)
m4_define({RCLOCK_panel_label},rclock)
m4_define({RCLOCK_mini},GETMINI(x.xpm,rclock))
m4_define({RCLOCK_run},{Exec exec rclock -bg grey75 -update 1})
m4_define({RCLOCK_icon},rclock)
m4_define({RCLOCK_style_name},rclock)
m4_ifdef({XCAL},m4_define({RCLOCK_button1},{XCAL_run}))
m4_ifdef({TIMEADMIN},m4_define({RCLOCK_button3},{TIMEADMIN_run}))
})

DEFINE_IF_RUNABLE({xclock},{XCLOCK})
m4_ifdef({XCLOCK},{
m4_define({XCLOCK_menu_label},xclock)
m4_define({XCLOCK_panel_label},xclock)
m4_define({XCLOCK_mini},GETMINI(x.xpm,xclock))
m4_define({XCLOCK_run},{Exec exec xclock -bg grey75 -update 1})
m4_define({XCLOCK_icon},xclock)
m4_define({XCLOCK_style_name},xclock)
m4_ifdef({TIMETOOL},m4_define({XCLOCK_button1},{TIMETOOL_run}))
})

m4_dnl OK ^

DEFINE_IF_RUNABLE({ascpu},{ASCPU})
m4_ifdef({ASCPU},{
m4_define({ASCPU_menu_label},ascpu)
m4_define({ASCPU_panel_label},ascpu)
m4_define({ASCPU_run},{Exec exec ascpu})
m4_define({ASCPU_style_name},ascpu)
m4_ifdef({XOSVIEW},m4_define({ASCPU_button1},{XOSVIEW_run}))
m4_ifdef({XCPUSTATE},m4_define({ASCPU_button2},{XCPUSTATE_run}))
m4_ifdef({GTOP},m4_define({ASCPU_button3},{GTOP_run}))
})

m4_dnl this depends on TKMASQ or WVDIAL so define them first
DEFINE_IF_RUNABLE({wmpload},{WMPLOAD})
m4_ifdef({WMPLOAD},{
m4_define({WMPLOAD_menu_label},wmpload)
m4_define({WMPLOAD_panel_label},wmpload)
m4_define({WMPLOAD_run},{Exec exec wmpload})
m4_define({WMPLOAD_icon},wmpload)
m4_define({WMPLOAD_style_name},wmpload)
m4_ifdef({TKMASQ},{m4_define({WMPLOAD_button1},{TKMASQ_run})}),
	m4_ifdef({WVDIAL},{m4_define({WMPLOAD_button1},{WVDIAL_run})}))
})

SIMPLE_PROGRAM(wmwave)
SIMPLE_PROGRAM(wmifinfo)
SIMPLE_PROGRAM(wmnd)
SIMPLE_PROGRAM(wmcms)
SIMPLE_PROGRAM(allin1)
SIMPLE_PROGRAM(wmsensormon)

DEFINE_IF_RUNABLE({asmem},{ASMEM})
m4_ifdef({ASMEM},{
m4_define({ASMEM_menu_label},asmem)
m4_define({ASMEM_panel_label},asmem)
m4_define({ASMEM_run},{Exec exec asmem})
m4_define({ASMEM_style_name},asmem)
})

DEFINE_IF_RUNABLE({wmfire},{WMFIRE})
m4_ifdef({WMFIRE},{
m4_define({WMFIRE_menu_label},wmfire)
m4_define({WMFIRE_panel_label},wmfire)
m4_define({WMFIRE_run},{Exec exec wmfire -s 0})
m4_define({WMFIRE_style_name},wmfire)
m4_ifdef({GTOP},m4_define({WMFIRE_button1},{GTOP_run}))
})

DEFINE_IF_RUNABLE({gpa},{GPA})
m4_ifdef({GPA},{
m4_define({GPA_menu_label},Gnu Privacy Assistant)
m4_define({GPA_panel_label},gpa)
m4_define({GPA_mini},GETMINI(x.xpm,gpa))
m4_define({GPA_run},{Exec exec gpa})
m4_define({GPA_style_name},gpa)
ADD_TO_UTILITIES_MENU(gpa)
})

DEFINE_IF_RUNABLE({gtoaster},{GTOASTER})
m4_ifdef({GTOASTER},{
m4_define({GTOASTER_menu_label},gtoaster)
m4_define({GTOASTER_panel_label},gtoaster)
m4_define({GTOASTER_mini},GETMINI(x.xpm,gtoaster))
m4_define({GTOASTER_run},{Exec exec gtoaster})
m4_define({GTOASTER_icon},gtoaster.png)
m4_define({GTOASTER_style_name},gtoaster)
ADD_TO_UTILITIES_MENU(gtoaster)
})

DEFINE_IF_RUNABLE({eroaster},{EROASTER})
m4_ifdef({EROASTER},{
m4_define({EROASTER_menu_label},eroaster)
m4_define({EROASTER_panel_label},eroaster)
m4_define({EROASTER_mini},GETMINI(x.xpm,eroaster))
m4_define({EROASTER_run},{Exec exec eroaster})
m4_define({EROASTER_icon},eroaster.xpm)
m4_define({EROASTER_style_name},eroaster)
ADD_TO_UTILITIES_MENU(eroaster)
})

DEFINE_IF_RUNABLE({gnomba},{GNOMBA})
m4_ifdef({GNOMBA},{
m4_define({GNOMBA_menu_label},Gnome Samba browser)
m4_define({GNOMBA_panel_label},gnomba)
m4_define({GNOMBA_mini},GETMINI(x.xpm,gnomba))
m4_define({GNOMBA_run},{Exec exec gnomba})
m4_define({GNOMBA_icon},gnome-gnomba.png)
m4_define({GNOMBA_style_name},gnomba)
ADD_TO_CROSS_MENU(gnomba)
})

DEFINE_IF_RUNABLE({tkcvs},{TKCVS})
m4_ifdef({TKCVS},{
m4_define({TKCVS_menu_label},tkcvs)
m4_define({TKCVS_panel_label},tkcvs)
m4_define({TKCVS_mini},GETMINI(x.xpm,tkcvs))
m4_define({TKCVS_run},{Exec exec tkcvs})
m4_define({TKCVS_style_name},tkcvs)
ADD_TO_DEV_MENU(tkcvs)
})

DEFINE_IF_RUNABLE({tkwget},{TKWGET})
m4_ifdef({TKWGET},{
m4_define({TKWGET_menu_label},tkwget)
m4_define({TKWGET_panel_label},tkwget)
m4_define({TKWGET_mini},GETMINI(x.xpm,tkwget))
m4_define({TKWGET_run},{Exec exec tkwget})
m4_define({TKWGET_style_name},tkwget)
ADD_TO_INTERNET_MENU(tkwget)
})

DEFINE_IF_RUNABLE({wine},{WINE})

m4_ifdef({WINE},{
m4_define({NOTES_EXE},{~/.wine/fake_windows/Program\ Files/lotus/notes/notes.exe})
DEFINE_IF_RUNABLE(NOTES_EXE,{NOTES})
m4_ifdef({NOTES},
m4_define({NOTES_menu_label},Lotus Notes)
m4_define({NOTES_panel_label},notes)
m4_define({NOTES_mini},GETMINI(x.xpm,notes))
m4_define({NOTES_run},{Exec exec wine NOTES_EXE})
ADD_TO_OFFICE_MENU(notes)
)})

m4_ifdef({WINE},{
m4_define({WINWORD_EXE},{~/.wine/fake_windows/Program\ Files/Microsoft\ Office/Office/WINWORD.EXE})
DEFINE_IF_RUNABLE(WINWORD_EXE,{WORD})
m4_ifdef({WORD},
m4_define({WORD_menu_label},winword)
m4_define({WORD_panel_label},winword)
m4_define({WORD_mini},GETMINI(x.xpm,word))
m4_define({WORD_run},{Exec exec wine WINWORD_EXE})
ADD_TO_OFFICE_MENU(word)
)})

m4_ifdef({WINE},{
m4_define({PWRPNT_EXE},{~/.wine/fake_windows/Program\ Files/Microsoft\ Office/Office/POWERPNT.EXE})
DEFINE_IF_RUNABLE(PWRPNT_EXE,{PWRPNT})
m4_ifdef({PWRPNT},
m4_define({PWRPNT_menu_label},Powerpoint)
m4_define({PWRPNT_panel_label},Powerpoint)
m4_define({PWRPNT_mini},GETMINI(x.xpm,powerpoint))
m4_define({PWRPNT_run},{Exec exec wine PWRPNT_EXE})
ADD_TO_OFFICE_MENU(pwrpnt)
)})

m4_dnl OK ^

m4_ifdef({WINE},{
m4_define({XL_EXE},{~/.wine/fake_windows/Program\ Files/Microsoft\ Office/Office/EXCEL.EXE})
DEFINE_IF_RUNABLE(XL_EXE,{XL})
m4_ifdef({XL},
m4_define({XL_menu_label},Excel)
m4_define({XL_panel_label},Excel)
m4_define({XL_mini},GETMINI(x.xpm,excel))
m4_define({XL_run},{Exec exec wine XL_EXE})
ADD_TO_OFFICE_MENU(xl)
)})

m4_define({AZUREUS_PATH},/opt/azureus)
DEFINE_IF_RUNABLE(AZUREUS_PATH/azureus,{AZUREUS})
m4_ifdef({AZUREUS},{
m4_define({AZUREUS_menu_label},Azureus BitTorrent Client)
m4_define({AZUREUS_panel_label},azureus)
m4_define({AZUREUS_mini},GETMINI(AZUREUS_PATH/Azureus.torrent.png,azureus))
m4_define({AZUREUS_run},{Exec exec AZUREUS_PATH/azureus})
m4_define({AZUREUS_style_name},azureus)
ADD_TO_INTERNET_MENU(azureus)
})

# Import info from the Gnome2 .desktop files:
m4_esyscmd(./fvwm-gnome2 SYSTEMNAME)

# Over-ride settings from fvwm-gnome2:
m4_ifdef({PORTHOLE},{m4_define({PORTHOLE_run},{Exec exec AS_ROOT porthole})})

# They just can't seem to make up their minds:
m4_ifdef({MOZILLAFIREFOX},{
	m4_define({MOZILLAFIREFOX_style_name},Firefox*)
	m4_define({FIREFOXPROFILE},firefoxprofile)
	m4_define({FIREFOXPROFILE_run},{Exec exec firefox -profilemanager})
})

m4_ifdef({MOZILLAFIREFOXBIN},{
	m4_define({MOZILLAFIREFOXBIN_style_name},Firefox*)
	m4_define({FIREFOXPROFILE},firefoxprofile)
	m4_define({FIREFOXPROFILE_run},{Exec exec firefoxbin -profilemanager})
})

m4_ifdef({FIREFOX},{
	m4_define({FIREFOX_style_name},Firefox*)
	m4_define({FIREFOXPROFILE},firefoxprofile)
	m4_define({FIREFOXPROFILE_run},{Exec exec firefoxbin -profilemanager})
})

m4_ifdef({FIREFOXPROFILE},{
	m4_define({FIREFOXPROFILE_menu_label},firefox profiles)
	m4_define({FIREFOXPROFILE_panel_label},firefox profiles)
	m4_define({FIREFOXPROFILE_mini},GETMINI(mozicon16.xpm,firefox_profile))
})

m4_dnl OK v

# Categorise gnome2 apps into the fvwm menus: add new apps in here as they are installed by gnome
m4_ifdef({ABIWORD},{ADD_TO_OFFICE_MENU(abiword)})								
m4_ifdef({AUDACITY},{ADD_TO_MULTIMEDIA_MENU(audacity)})						
m4_ifdef({BLACKJACK},{ADD_TO_GAMES_MENU(blackjack)})							
m4_ifdef({DEVHELP},{ADD_TO_DEV_MENU(devhelp)})							
m4_ifdef({EOG},{ADD_TO_MULTIMEDIA_MENU(eog)})							
m4_ifdef({FILEROLLER},{ADD_TO_UTILITIES_MENU(fileroller)})							
m4_ifdef({FREECELL},{ADD_TO_GAMES_MENU(freecell)})
m4_ifdef({GAIM},{ADD_TO_INTERNET_MENU(gaim)})									
m4_ifdef({GATAXX},{ADD_TO_GAMES_MENU(gataxx)})								
m4_ifdef({GCALCTOOL},{ADD_TO_PROD_MENU(gcalctool)})
m4_ifdef({GCDMASTER},{ADD_TO_MULTIMEDIA_MENU(gcdmaster)})						
m4_ifdef({GCONFEDITOR},{ADD_TO_SYSTEM_MENU(gconfeditor)})
m4_ifdef({GEDIT},{ADD_TO_DEV_MENU(gedit)})							
m4_ifdef({GFLOPPY},{ADD_TO_UTILITIES_MENU(gfloppy)})
m4_ifdef({GGV},{ADD_TO_OFFICE_MENU(ggv)})							
m4_ifdef({GIMP},{ADD_TO_MULTIMEDIA_MENU(gimp)})								
m4_ifdef({GIMP20},{ADD_TO_MULTIMEDIA_MENU(gimp20)})								
m4_ifdef({GJOTS2},{ADD_TO_PROD_MENU(gjots2)})							
m4_ifdef({GLADE2},{ADD_TO_DEV_MENU(glade2)})							
m4_ifdef({GLINES},{ADD_TO_GAMES_MENU(glines)})								
m4_ifdef({GNIBBLES},{ADD_TO_GAMES_MENU(gnibbles)})							
m4_ifdef({GNOBOTS2},{ADD_TO_GAMES_MENU(gnobots2)})							
m4_ifdef({GNOMECC},{ADD_TO_SYSTEM_MENU(gnomecc)})								
m4_ifdef({GNOMECD},{ADD_TO_MULTIMEDIA_MENU(gnomecd)})							
m4_ifdef({GNOMEDICTIONARY},{ADD_TO_OFFICE_MENU(gnomedictionary)})				
m4_ifdef({GNOMESEARCHTOOL},{ADD_TO_UTILITIES_MENU(gnomesearchtool)})			
m4_ifdef({GNOMESOUNDRECORDER},{ADD_TO_MULTIMEDIA_MENU(gnomesoundrecorder)})	
m4_ifdef({GNOMESTONES},{ADD_TO_GAMES_MENU(gnomestones)})						
m4_ifdef({GNOMESYSTEMLOG},{ADD_TO_SYSTEM_MENU(gnomesystemlog)})				
m4_ifdef({GNOMESYSTEMMONITOR},{ADD_TO_SYSTEM_MENU(gnomesystemmonitor)})		
m4_ifdef({GNOMETRIS},{ADD_TO_GAMES_MENU(gnometris)})							
m4_ifdef({GNOMEVOLUMECONTROL},{ADD_TO_MULTIMEDIA_MENU(gnomevolumecontrol)})	
m4_ifdef({GNOMERADIO},{ADD_TO_MULTIMEDIA_MENU(gnomeradio)})	
m4_ifdef({GNOMEterminal},{ADD_TO_UTILITY_MENU(gnometerminal)})
m4_ifdef({GNOMINE},{ADD_TO_GAMES_MENU(gnomine)})								
m4_ifdef({GNOTRAVEX},{ADD_TO_GAMES_MENU(gnotravex)})							
m4_ifdef({GNOTSKI},{ADD_TO_GAMES_MENU(gnotski)})								
m4_ifdef({GNUMERIC},{ADD_TO_OFFICE_MENU(gnumeric)})							
m4_ifdef({GPDF},{ADD_TO_OFFICE_MENU(gpdf)})
m4_ifdef({GRAMPS},{ADD_TO_APPS_MENU(gramps)})									
m4_ifdef({GRIP},{ADD_TO_MULTIMEDIA_MENU(grip)})								
m4_ifdef({GSTREAMERPROPERTIES},{ADD_TO_MULTIMEDIA_MENU(gstreamerproperties)})	
m4_ifdef({GTALI},{ADD_TO_GAMES_MENU(gtali)})									
m4_ifdef({GUCHARMAP},{ADD_TO_UTILITIES_MENU(gucharmap)})
m4_ifdef({IAGNO},{ADD_TO_GAMES_MENU(iagno)})									
m4_ifdef({MAHJONGG},{ADD_TO_GAMES_MENU(mahjongg)})
m4_ifdef({MELD},{ADD_TO_DEV_MENU(meld)})
m4_ifdef({MOZILLAFIREFOX},{ADD_TO_INTERNET_MENU(mozillafirefox)})
m4_ifdef({MOZILLAFIREFOXBIN},{ADD_TO_INTERNET_MENU(mozillafirefox-bin)})
m4_ifdef({FIREFOX},{ADD_TO_INTERNET_MENU(firefox)})
m4_ifdef({FIREFOXPROFILE},{ADD_TO_INTERNET_MENU(firefoxprofile)})
m4_ifdef({NAUTILUS},{ADD_TO_UTILITIES_MENU(nautilus)})
m4_ifdef({NAUTILUS},{m4_define({NAUTILUS_run},{Exec exec nautilus --no-desktop --browser})})
m4_ifdef({PORTHOLE},{ADD_TO_SYSTEM_MENU(porthole)})
m4_ifdef({RECLEVEL},{ADD_TO_MULTIMEDIA_MENU(reclevel)})
m4_ifdef({SAMEGNOME},{ADD_TO_GAMES_MENU(samegnome)})							
m4_ifdef({SCREENSAVERPROPERTIES},{ADD_TO_XUTILITIES_MENU(screensaverproperties)})
m4_ifdef({SOL},{ADD_TO_GAMES_MENU(sol)})
m4_ifdef({VMWARE},{ADD_TO_CROSS_MENU(vmware)})								
m4_ifdef({VUMETER}},{ADD_TO_MULTIMEDIA_MENU(vmweter)})						
m4_ifdef({XCDROAST},{ADD_TO_MULTIMEDIA_MENU(xcdroast)})
m4_ifdef({XGALAGA},{ADD_TO_GAMES_MENU(xgalaga)})
m4_ifdef({XMMS},{ADD_TO_MULTIMEDIA_MENU(xmms)})
m4_ifdef({YELP},{ADD_TO_UTILITIES_MENU(yelp)})
m4_ifdef({KINO},{ADD_TO_MULTIMEDIA_MENU(kino)})

m4_ifdef({GDMFLEXISERVER},{
m4_define({GDMFLEXISERVER_menu_label},Extra X Session (gdmflexiserver))
m4_define({GDMFLEXISERVER_run},{Exec exec AS_ROOT gdmflexiserver})
ADD_TO_SYSTEM_MENU(gdmflexiserver)
})

m4_ifdef({GDMSETUP},{
m4_define({GDMSETUP_run},{Exec exec AS_ROOT gdmsetup})
ADD_TO_SYSTEM_MENU(gdmsetup)
})

# TEMPLATE (but consider using SIMPLE_PROGRAM!):
DEFINE_IF_RUNABLE({program},{PROGRAM})
m4_ifdef({PROGRAM},{
m4_define({PROGRAM_menu_label},program)
m4_define({PROGRAM_panel_label},program)
m4_define({PROGRAM_mini},GETMINI(program.xpm,program))
m4_define({PROGRAM_run},{Exec exec program})
m4_define({PROGRAM_icon},program)
m4_define({PROGRAM_style_name},program)
m4_define({PROGRAM_extras},)
ADD_TO_APPS_MENU(program)
})

