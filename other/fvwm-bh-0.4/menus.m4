m4_dnl These are the items which can appear in the main main - add to
m4_dnl it, just make sure there is an appropriate entry in apps.m4

DestroyMenu RootMenu	
AddToMenu RootMenu	
+ "Root Menu"	Title
m4_esyscmd(for i in MAIN_MENU; do u=`echo $i | PROGNAME2MACRO`; echo "{MENU_ITEM}({{{$u}}}){m4_dnl}"; done)m4_dnl
m4_ifdef({MY_MAIN_MENU1},{+ "MY_MAIN_MENU1_title{}m4_ifdef({MY_MAIN_MENU1_mini},{%MY_MAIN_MENU1_mini%})" Popup MY_MAIN_MENU1_name}) m4_dnl
m4_ifdef({MY_MAIN_MENU2},{+ "MY_MAIN_MENU2_title{}m4_ifdef({MY_MAIN_MENU2_mini},{%MY_MAIN_MENU2_mini%})" Popup MY_MAIN_MENU2_name}) m4_dnl
m4_ifdef({MY_MAIN_MENU3},{+ "MY_MAIN_MENU3_title{}m4_ifdef({MY_MAIN_MENU3_mini},{%MY_MAIN_MENU3_mini%})" Popup MY_MAIN_MENU3_name}) m4_dnl
+ "" Nop
MENU_ITEM({{HALT}})m4_dnl
+ "" Nop
+ "Development%GETMINI(utilities_package.xpm,DevMenu)%" Popup DevMenu
+ "Office%GETMINI(utilities_package.xpm,OfficeMenu)%" 		Popup OfficeMenu
+ "Apps%GETMINI(utilities_package.xpm,AppsMenu)%" 		Popup AppsMenu
+ "Internet%GETMINI(utilities_package.xpm,InternetMenu)%" 	Popup InternetMenu
+ "Multimedia%GETMINI(mini-SoundMixer.xpm,MultimediaMenu)%"			Popup MultimediaMenu
+ "X Utilities%GETMINI(x.xpm,XUtilitiesMenu)%"     			Popup XUtilitiesMenu
+ "Utilities%GETMINI(x.xpm,UtilitiesMenu)%"  					Popup UtilitiesMenu
+ "Productivity%GETMINI(x.xpm,ProdMenu)%"				Popup ProdMenu
+ "Cross Platform%GETMINI(x.xpm,CrossMenu)%"  			Popup CrossMenu
+ "System Utilities%GETMINI(x.xpm,SystemMenu)%"  			Popup SystemMenu
+ "Games%GETMINI(games_package.xpm,GamesMenu)%"			Popup GamesMenu
+ "Fvwm%GETMINI(mini.fvwm.xpm,FvwmMenu)%"						Popup FvwmMenu
m4_dnl + "Gnome Menu%GETMINI(gnome-logo-icon.xpm,FvwmGtk)%"	SendToModule FvwmGtk gnome-all

DEBUG(Fvwm)
DestroyMenu FvwmMenu 
AddToMenu FvwmMenu 
+ "Fvwm" Title
MENU_ITEM({{MOUSE}})
+ "fvwm2 version%GETMINI(mini.fvwm.xpm,fvwm2-version)%"			Exec exec fvwm2 -version 2>&1  |xless
+ "Fvwm Decors%GETMINI(mini.fvwm.xpm,My-Decors)%"  			Popup My-Decors
+ "Restart Fvwm2%GETMINI(mini.fvwm.xpm,Restart)%"			Restart
+ "Fvwm Modules%GETMINI(mini.fvwm.xpm,Module-Popup)%"	        	Popup Module-Popup
+ "Fvwm Window Ops%GETMINI(mini.fvwm.xpm,Window-Ops2)%"        	Popup Window-Ops2
+ "Fvwm Simple Config Ops%GETMINI(mini.fvwm.xpm,Misc-Ops)%" 	Popup Misc-Ops
+ ""										Nop
+ "Refresh Screen%GETMINI(mini.fvwm.xpm,Refresh)%"   		Refresh
+ "Recapture Screen%GETMINI(mini.fvwm.xpm,Recapture)%" 		Recapture
+ ""										Nop
+ "Exit Fvwm%GETMINI(mini.fvwm.xpm,Quit-Verify)%"				Popup Quit-Verify

DEBUG(MultimediaMenu)
DestroyMenu MultimediaMenu 
AddToMenu MultimediaMenu 
+ "Multimedia" Title
m4_esyscmd(for i in MULTIMEDIA_MENU; do u=`echo $i | PROGNAME2MACRO`; echo "{MENU_ITEM}({{{$u}}}){m4_dnl}"; done)m4_dnl

DEBUG(AppsMenu)
DestroyMenu AppsMenu 
AddToMenu AppsMenu 
+ "Apps" Title
m4_esyscmd(for i in APPS_MENU; do u=`echo $i | PROGNAME2MACRO`; echo "{MENU_ITEM}({{{$u}}}){m4_dnl}"; done)m4_dnl

DEBUG(UtilitiesMenu)
DestroyMenu UtilitiesMenu 
AddToMenu UtilitiesMenu
+ "Utilities" Title
m4_esyscmd(for i in UTILITIES_MENU; do u=`echo $i | PROGNAME2MACRO`; echo "{MENU_ITEM}({{{$u}}}){m4_dnl}"; done)m4_dnl

DEBUG(XutilitiesMenu)
DestroyMenu XutilitiesMenu
AddToMenu XutilitiesMenu
+ "X Utilities" Title
m4_esyscmd(for i in XUTILITIES_MENU; do u=`echo $i | PROGNAME2MACRO`; echo "{MENU_ITEM}({{{$u}}}){m4_dnl}"; done)m4_dnl

DEBUG(GamesMenu)
DestroyMenu GamesMenu 
AddToMenu GamesMenu 
+ "Games" Title
m4_esyscmd(for i in GAMES_MENU; do u=`echo $i | tr '[a-z]' '[A-Z]|tr -d .-'`; echo "{MENU_ITEM}({{{$u}}}){m4_dnl}"; done)m4_dnl

DEBUG(OfficeMenu)
DestroyMenu OfficeMenu
AddToMenu OfficeMenu
+ "Office" Title
m4_esyscmd(for i in OFFICE_MENU; do u=`echo $i | PROGNAME2MACRO`; echo "{MENU_ITEM}({{{$u}}}){m4_dnl}"; done)m4_dnl

DEBUG(DevMenu)
DestroyMenu DevMenu 
AddToMenu DevMenu
+ "Dev" Title
m4_esyscmd(for i in DEV_MENU; do u=`echo $i | PROGNAME2MACRO`; echo "{MENU_ITEM}({{{$u}}}){m4_dnl}"; done)m4_dnl

DEBUG(InternetMenu)
DestroyMenu InternetMenu 
AddToMenu InternetMenu 
+ "Internet" Title
m4_esyscmd(for i in INTERNET_MENU; do u=`echo $i | PROGNAME2MACRO`; echo "{MENU_ITEM}({{{$u}}}){m4_dnl}"; done)m4_dnl

DEBUG(ProdMenu)
DestroyMenu ProdMenu 
AddToMenu ProdMenu 
+ "Productivity" Title
m4_esyscmd(for i in PROD_MENU; do u=`echo $i | PROGNAME2MACRO`; echo "{MENU_ITEM}({{{$u}}}){m4_dnl}"; done)m4_dnl

DEBUG(Cross)
DestroyMenu CrossMenu 
AddToMenu CrossMenu 
+ "Cross Platform" Title
m4_esyscmd(for i in CROSS_MENU; do u=`echo $i | PROGNAME2MACRO`; echo "{MENU_ITEM}({{{$u}}}){m4_dnl}"; done)m4_dnl

DEBUG(System)
DestroyMenu SystemMenu 
AddToMenu SystemMenu 
+ "System" Title
m4_esyscmd(for i in SYSTEM_MENU; do u=`echo $i | PROGNAME2MACRO`; echo "{MENU_ITEM}({{{$u}}}){m4_dnl}"; done)m4_dnl

DEBUG(Misc-Ops)
DestroyMenu Misc-Ops 
AddToMenu Misc-Ops 
+ "Misc Config Opts" Title
+ "Sloppy Focus"        				ChangeDefaultFocus SloppyFocus
+ "Click To Focus"      				ChangeDefaultFocus ClickToFocus
+ "Focus Follows Mouse" 				ChangeDefaultFocus FocusFollowsMouse
+ "" Nop
+ "Colormap Follows Mouse" 				ColormapFocus FollowsMouse
+ "Colormap Follows Focus" 				ColormapFocus FollowsFocus
+ "" Nop	     
+ "Full Paging ON"         				EdgeScroll 100 100
+ "All Paging OFF"         				EdgeScroll 0 0
+ "Horizontal Paging Only" 				EdgeScroll 100 0
+ "Vertical Paging Only"   				EdgeScroll 0 100
+ "Partial Paging"         				EdgeScroll 50 50
+ "Full Paging && Edge Wrap" 			EdgeScroll 100000 100000

DEBUG(Window-Ops)
DestroyMenu Window-Ops 
AddToMenu Window-Ops 
+ "Window Ops" Title		
+ "Move%GETMINI(mini.move1.xpm,Move)%"				Move
+ "Resize%GETMINI(mini.resize2.xpm,Resize)%"			Resize
+ "Raise%GETMINI(mini.raise2.xpm,Raise)%"				Raise
+ "Lower%GETMINI(mini.lower2.xpm,Lower)%"				Lower 
+ "(De)Iconify%GETMINI(mini.iconify1.xpm,Iconify)%"		Iconify
+ "(De)Shade%GETMINI(mini.shade1.xpm,WindowShade)%" 			WindowShade
+ "(Un)Stick%GETMINI(mini.stick1.xpm,Stick)%"			Stick		
+ "(Un)Maximize%GETMINI(mini.maximize1.xpm,Maximize-Func)%"	Maximize-Func
+ "Move to ... %GETMINI(mini.move1.xpm,Move-window)%"  		Popup Move-window
+ "" Nop
+ "Delete%GETMINI(mini.delete.xpm,Delete)%"				Delete
+ "Close%GETMINI(mini.winXX-close.xpm,Close)%"			Close
+ "Destroy%GETMINI(mini.destroy.xpm,Destroy)%"			Destroy
+ "" Nop
+ "Refresh Window%GETMINI(mini.refresh.xpm,RefreshWindow)%" 	RefreshWindow

DEBUG(Window-Ops2)
DestroyMenu Window-Ops2 
AddToMenu Window-Ops2 
+ "Window Ops" Title	
+ "&Move%GETMINI(mini.move1.xpm,Move)%" 				Move
+ "&Resize%GETMINI(mini.resize2.xpm,i)%"			Resize
+ "R&aise%GETMINI(mini.raise2.xpm,Raise)%"				Raise   	
+ "&Lower%GETMINI(mini.lower2.xpm,Lower)%"				Lower   	
+ "(De)&Iconify%GETMINI(mini.iconify1.xpm,Iconify)%"		Iconify 	
+ "(Un)&Stick%GETMINI(mini.stick1.xpm,Stick)%"			Stick		
+ "(Un)Ma&ximize%GETMINI(mini.maximize1.xpm,Maximize-Func)%"	Maximize-Func
+ "(De)S&hade%GETMINI(mini.shade1.xpm,WindowShade)%" 		WindowShade
+ "Move to ...%GETMINI(mini.move1.xpm,Move-window)%" 		Popup Move-window
+ "" Nop     	
+ "&Delete%GETMINI(mini.delete.xpm,Delete)%"			Delete	
+ "&Close%GETMINI(mini.winXX-close.xpm,Close)%"		Close
+ "Destroy%GETMINI(mini.destroy.xpm,Destroy)%"			Destroy 	
+ "" Nop
+ "Refresh &Window%GETMINI(mini.refresh.xpm,RefreshWindow)%" 	RefreshWindow
+ "Window Info%mini.x.xpm"				FvwmIdent-Func
+ "Capture window%GETMINI(mini.doc1.xpm,FvwmForm-Print)%"		FvwmForm FvwmForm-Print

DEBUG(Module-Popup)
DestroyMenu Module-Popup 
AddToMenu Module-Popup 
+ "FvwmModules" Title
+ "Identify%GETMINI(mini.fvwm.xpm,FvwmIdent)%"				Module	FvwmIdent
+ "Talk to fvwm2%GETMINI(mini.fvwm.xpm,FvwmTalk)%"  		Module	FvwmTalk
+ "" Nop
+ "Button-Bar%GETMINI(mini.fvwm.xpm,FvwmButtons)%"			Module	FvwmButtons
+ "Wharf%GETMINI(mini.fvwm.xpm,FvwmWharf)%"				Module	FvwmWharf
+ "Pager%GETMINI(mini.fvwm.xpm,FvwmPager)%"				Module  FvwmPager 0 0
+ "Pager (2 desks)%GETMINI(mini.fvwm.xpm,FvwmPager)%" 		Module  FvwmPager 0 1
+ "WinList%GETMINI(mini.fvwm.xpm,FvwmWinList)%"				Module  FvwmWinList
+ "" Nop
+ "Banner%GETMINI(mini.fvwm.xpm,FvwmBanner)%"				Module	FvwmBanner
+ "ScrollBar%GETMINI(mini.fvwm.xpm,FvwmScroll)%"     		Module  FvwmScroll 50 50
+ "Background%GETMINI(mini.fvwm.xpm,FvwmBacker)%"			Module  FvwmBacker
+ "AutoRaise%GETMINI(mini.fvwm.xpm,FvwmAuto)%"     		Module  FvwmAuto 200 Raise Nop
+ "Stop AutoRaise%GETMINI(mini.fvwm.xpm,FvwmAuto)%" 		KillModule FvwmAuto
+ "" Nop
+ "IconBox%GETMINI(mini.fvwm.xpm,FvwmIconBox)%"				Module	FvwmIconBox
+ "IconMan%GETMINI(mini.fvwm.xpm,FvwmIconMan)%"       		Module  FvwmIconMan
+ "" Nop
+ "Form - Rlogin%GETMINI(mini.fvwm.xpm,FvwmForm-Rlogin)%"     	Module FvwmForm FvwmForm-Rlogin
+ "Form - Talk to fvwm%GETMINI(mini.fvwm.xpm,FvwmForm-MyTalk)%" 	Module FvwmForm FvwmForm-MyTalk
+ "Form - QuitVerify%GETMINI(mini.fvwm.xpm,QuitVerify)%" 	Module FvwmForm QuitVerify

DEBUG(Quit-Verify)
DestroyMenu Quit-Verify 
AddToMenu Quit-Verify 
+ "Quit Fvwm?" Title	
+ "Yes, Really Quit%GETMINI(mini.fvwm.xpm,Quit)%"  	Quit
+ "" Nop	
+ "Restart Fvwm2%GETMINI(mini.fvwm.xpm,Restart)%"     	Restart
+ "" Nop	
+ "Start twm%GETMINI(mini.fvwm.xpm,twm)%"         	Restart twm
+ "Start KDE%GETMINI(mini.fvwm.xpm,startkde)%"    	    Restart startkde
+ "Start Gnome%GETMINI(mini.fvwm.xpm,gnome-session)%"       	Restart gnome-session
+ "Start xfce%GETMINI(mini.fvwm.xpm,startxfce)%"        	Restart startxfce
+ "" Nop	
+ "No, Don't Quit"    					Nop	

#------------------------------------------------------------------------------
# A "Move Window" menu

DEBUG(Move-Window)
DestroyMenu   Move-Window 
AddToMenu   Move-Window 
+ "Move to ..." Title
+ 'Desk 0 Top left%GETMINI(mini.move1.xpm,SendToDeskAndPage)%'      SendToDeskAndPage 0 0 0
+ 'Desk 0 Top middle%GETMINI(mini.move1.xpm,SendToDeskAndPage)%'    SendToDeskAndPage 0 1 0
+ 'Desk 0 Top right%GETMINI(mini.move1.xpm,SendToDeskAndPage)%'     SendToDeskAndPage 0 2 0
+ 'Desk 0 Bottom left%GETMINI(mini.move1.xpm,SendToDeskAndPage)%'   SendToDeskAndPage 0 0 1
+ 'Desk 0 Bottom middle%GETMINI(mini.move1.xpm,SendToDeskAndPage)%' SendToDeskAndPage 0 1 1
+ 'Desk 0 Bottom right %GETMINI(mini.move1.xpm,SendToDeskAndPage)%' SendToDeskAndPage 0 2 1
+ 'Desk 1 Top left%GETMINI(mini.move1.xpm,SendToDeskAndPage)%'      SendToDeskAndPage 1 0 0
+ 'Desk 1 Top middle%GETMINI(mini.move1.xpm,SendToDeskAndPage)%'    SendToDeskAndPage 1 1 0
+ 'Desk 1 Top right%GETMINI(mini.move1.xpm,SendToDeskAndPage)%'     SendToDeskAndPage 1 2 0
+ 'Desk 1 Bottom left%GETMINI(mini.move1.xpm,SendToDeskAndPage)%'   SendToDeskAndPage 1 0 1
+ 'Desk 1 Bottom middle%GETMINI(mini.move1.xpm,SendToDeskAndPage)%' SendToDeskAndPage 1 1 1
+ 'Desk 1 Bottom right %GETMINI(mini.move1.xpm,SendToDeskAndPage)%' SendToDeskAndPage 1 2 1

DEBUG(WinRearrange)
DestroyMenu   WinRearrange 
AddToMenu   WinRearrange 
+ "Rearrange" title
+ "&Cascade%GETMINI(mini.windows.xpm,FvwmRearrange)%" FvwmRearrange -cascade -m 3 3 -incx 2
+ "Tile &horizontally%GETMINI(mini.windows.xpm,FvwmRearrange)%" FvwmRearrange -tile -h -m 2 2 98 98
+ "Tile &vertically%GETMINI(mini.windows.xpm,FvwmRearrange)%" FvwmRearrange -tile -m 2 2 98 98
+ "" Nop
+ "" Nop
+ "&Arrange Icons%GETMINI(mini.icons.xpm,RecaptureWindow)%" All (CurrentDesk Iconic) RecaptureWindow
+ "&Refresh Screen%GETMINI(mini.ray.xpm,Refresh)%" Refresh

#------------------------------------------------------------------------------
# Decor menu:
DestroyMenu My-Decors 
AddToMenu My-Decors 
+ "Decors" Title
+		"Base"			Function BaseDecorAndSave
+       "ABC"     		Function SwitchDecor abc.decor
+       "BlueGray"      Function SwitchDecor bluegray.decor
+       "Blue Wing"     Function SwitchDecor blue_wing.decor
+       "Celtic"        Function SwitchDecor celtic.decor
+       "Emerald"       Function SwitchDecor emerald.decor
+       "Gold Leaf"     Function SwitchDecor goldleaf.decor
+       "Leather"       Function SwitchDecor leather.decor
+       "Marble"        Function SwitchDecor marble.decor
+       "Metal"         Function SwitchDecor metal.decor
+       "Pink Pearl"    Function SwitchDecor pinkpearl.decor
+       "Purple and Silver"  Function SwitchDecor purpsilver.decor
+       "Rainbow"       Function SwitchDecor rainbow.decor
+       "Red and Gold"  Function SwitchDecor redgold.decor
+       "Silver"        Function SwitchDecor silver.decor
+       "Springtime"    Function SwitchDecor springtime.decor
+       "Starry"        Function SwitchDecor starry.decor
+       "Stone Age"     Function SwitchDecor stoneage.decor
+       "Wood"          Function SwitchDecor wood.decor
+       "Plain Decors"  Popup Fractal-Decors

DestroyMenu Fractal-Decors 
AddToMenu Fractal-Decors 
+ "Fractal Decors" Title
+       "MWM"            Function PlainDecor #cdc7b8 #97715a
+       "Circled Vine"   Function PlainDecor #847383 #403b5b
+       "Fanar"          Function PlainDecor #cdc7b8 #97715a
+       "Old Lace"       Function PlainDecor #b197a2 #f7eecf
+       "Startdust"      Function PlainDecor #8c95b4 #3d3571
+       "Sunset Flowers" Function PlainDecor #8a9a8f #3b3d4a
+       "Swimming"       Function PlainDecor #a08895 #684f62
+       "Twist of Fate"  Function PlainDecor #938988 #364147

AddToMenu RootMenu "Gnome-1 Menu%GETMINI(x.xpm,GnomeMenu)%" Popup GnomeMenu
DestroyMenu GnomeMenu
AddToMenu GnomeMenu "Gnome-1" Title
AddToMenu GnomeMenu "Gnome System Menu" Popup gnome-sys
AddToMenu GnomeMenu "Gnome User Menu" Popup gnome-user
AddToMenu GnomeMenu "Gnome RedHat Menu" Popup gnome-redhat

PipeRead 'fvwm-menu-desktop --enable-mini-icons --lang C'
PipeRead 'fvwm-menu-desktop --desktop gnome-user --enable-mini-icons --lang C'
PipeRead 'fvwm-menu-desktop --desktop gnome-redhat --enable-mini-icons --lang C'

AddToMenu RootMenu "Gnome-2 Menu%GETMINI(x.xpm,Gnome2Menu)%" Popup Gnome2Menu
#PipeRead ~/.fvwm/fvwm-gnome2
m4_include(SYSTEMNAME/menu_gnome2)

# AddToMenu RootMenu "KDE Menu%GETMINI(x.xpm,kde-sys)%" Popup kde-sys
# PipeRead 'fvwm-menu-desktop --desktop kde-sys --lang C'