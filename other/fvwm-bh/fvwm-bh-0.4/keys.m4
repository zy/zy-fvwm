# KEY BINDINGS:

# Reminder of fvwm syntax:
# Key keyname Context Modifiers Function:
# Context R=root W=applicationWindow T=titleBar S=sideTopBottom F=frame(corners) I=icon 0-9=button A=anyExceptButtons
# Modifiers N=none C=control S=shift M=meta A=any
#
# What this boils down to for the 4th field is:
# SCM is Sft-Ctl-Alt
# CM  is Ctl-Alt
# M   is Alt

# According to the man page, these are builtin:
#            Key Help R A Popup MenuFvwmRoot
#            Key F1 R A Popup MenuFvwmRoot
#            Key Tab A M WindowList Root c c NoDeskSort
#            Key Escape A MC EscapeFunc

# Add this to get anything with WindowListSkip - mainly the xterm's
Key Tab A SM WindowList Root c c NoDeskSort, OnlyListSkip

# Window control:
Key h 			A 	CM 		Maximize 0 	100
Key h 			A 	SCM 	Maximize 50 100
Key m 			A 	CM 		Maximize 100 100
Key v 			A 	CM 		Maximize 100 0
Key Home		A 	SCM 	Move 1p 0
Key End			A 	SCM		Resize 564p 340p
Key greater		A 	CM 		Raise # This is actually SCM-!
Key less		A 	CM 		Lower # This is actually SCM-!

# Window focus:
Key Next        A   SCM     Next [*] 	Focus
Key Prior       A   SCM     Prev [*] 	Focus

# Command shortcuts:
Key e 			A 	CM 		m4_ifdef({RXVT},RXVT_run,XTERM_run)
Key e 			A 	SCM		XTERM_run
Key t 			A 	SCM		Module FvwmForm FvwmForm-MyTalk
Key l 			A 	SCM		Exec xscreensaver-command -lock
Key m 			A 	SCM		MOUSE_run
Key r 			A 	SCM		Menu RootMenu Nop
Key Delete		A	SCM		Restart

# Movement
# Alt            up/down etc move to the next page
# Shift-Alt      up/down move the current window to the next page
# Ctrl-Alt       up/down move the cursor
# Shift-Ctrl-Alt up/down move the cursor quickly

Key Left		A	M		Scroll -100 0
Key Right		A	M		Scroll +100 +0
Key Up			A	M		Scroll +0   -100
Key Down		A	M		Scroll +0   +100
Key Left		A	SM		SendToDeskAndPage 0p -1p  0p
Key Right		A	SM		SendToDeskAndPage 0p  1p  0p
Key Up			A	SM		SendToDeskAndPage 0p  0p -1p
Key Down		A	SM		SendToDeskAndPage 0p  0p  1p

# The keypad provides a warp function:
# Ctrl-Alt       Home warps to the top left page, desk 0 etc
# Shift-Ctrl-Alt Home warps the current window to the top left page, desk 0 etc
# The 2 desktops map to the keys:
#
# Desktop 1: 7   8   9
#            4   5   6
#
# Desktop 2  1   2   3
#            Ins Del Enter

Key KP_Home		A	CM		GotoDeskAndPage 0 0 0
Key KP_Up		A	CM		GotoDeskAndPage 0 1 0
Key KP_Prior	A	CM		GotoDeskAndPage 0 2 0
Key KP_Left		A	CM		GotoDeskAndPage 0 0 1
Key KP_Begin	A	CM		GotoDeskAndPage 0 1 1
Key KP_Right	A	CM		GotoDeskAndPage 0 2 1
Key KP_End		A	CM		GotoDeskAndPage 1 0 0
Key KP_Down		A	CM		GotoDeskAndPage 1 1 0
Key KP_Next		A	CM		GotoDeskAndPage 1 2 0
Key KP_Insert	A	CM		GoToDeskAndPage 1 0 1
Key KP_Delete	A	CM		GoToDeskAndPage 1 1 1
Key KP_Enter	A	CM		GoToDeskAndPage 1 2 1
Key KP_7		A	SCM		SendToDeskAndPage 0 0 0
Key KP_8		A	SCM		SendToDeskAndPage 0 1 0
Key KP_9		A	SCM		SendToDeskAndPage 0 2 0
Key KP_4		A	SCM		SendToDeskAndPage 0 0 1
Key KP_5		A	SCM		SendToDeskAndPage 0 1 1
Key KP_6		A	SCM		SendToDeskAndPage 0 2 1
Key KP_1		A	SCM		SendToDeskAndPage 1 0 0
Key KP_2		A	SCM		SendToDeskAndPage 1 1 0
Key KP_3		A	SCM		SendToDeskAndPage 1 2 0
Key KP_0		A	SCM		SendToDeskAndPage 1 0 1
Key KP_Decimal	A	SCM		SendToDeskAndPage 1 1 1
Key KP_Enter	A	SCM		SendToDeskAndPage 1 2 1

# Move the cursor around:
# slow:
Key Left   		A CM   		CursorMove -2p 0p
Key Right  		A CM   		CursorMove +2p +0p
Key Up     		A CM   		CursorMove +0p -2p
Key Down   		A CM   		CursorMove +0p +2p
# fast:
Key Left   		A CMS 		CursorMove -20p 0p
Key Right  		A CMS 		CursorMove +20p +0p
Key Up     		A CMS		CursorMove +0p -20p
Key Down   		A CMS 		CursorMove +0p +20p
Key Return  	A CMS   	FakeClick depth 2 press 1 wait 160 release 1 # looks like C-M-S-mouse-1 to emacs!

# The following hack is for the MS keys - leftWindow, rightWindow & Menu
# In .xsession we need:
#xmodmap -e "keycode 115=Help"
#xmodmap -e "keycode 116=Find"
#xmodmap -e "keycode 117=Menu"
Key Find	A	N	Menu Window-Ops2 Nop
Key Help	A	N	WindowList
#Key Help	A	N	Module FvwmWinList
#Key Help	A	N	PopupFvwmIconMan
Key Menu	A	N	Menu RootMenu Nop
Key Print   A   N   FvwmForm FvwmForm-Print
