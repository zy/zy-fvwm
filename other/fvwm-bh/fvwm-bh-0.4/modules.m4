DEBUG(FvwmIdent)
########################## Window-Identifier ###############################
# Just choose colors and a fonts
*FvwmIdent: Colorset 1 # should track MenuColorset
*FvwmIdent: Font SMALLFONT

DEBUG(FvwmPager)
########################### Pager #########################################
# pager root:
*FvwmPager: Rows NUMDESKS
*FvwmPager: Colorset * 0
*FvwmPager: HilightColorset * 2
# pager text etc
# turn off desktop names for swallowing in above button bar example:
*FvwmPager: Font none
*FvwmPager: Geometry -1-1
*FvwmPager: Label 0 Misc
*FvwmPager: Label 1 VMWare
*FvwmPager: Label 2 Desk2
*FvwmPager: Label 3 Desk3
*FvwmPager: SmallFont TINYFONT
*FvwmPager: Balloons            All
*FvwmPager: BalloonBack         Yellow
*FvwmPager: BalloonFore         Black
*FvwmPager: BalloonFont         SMALLFONT
*FvwmPager: BalloonYOffset      +2
*FvwmPager: BalloonBorderWidth  1
*FvwmPager: BalloonBorderColor  Black

DEBUG(FvwmWinList)
##########################FvwmWinList##################################
*FvwmWinList: Colorset 0
*FvwmWinList: FocusColorset 1
*FvwmWinList: Font WINLISTFONT
*FvwmWinList: Action Click1 Iconify -1,Focus
*FvwmWinList: Action Click2 Iconify
*FvwmWinList: Action Click3 Module "FvwmIdent" FvwmIdent
#*FvwmWinList: UseSkipList
*FvwmWinList: Geometry +0-1
*FvwmWinList: LeftJustify

DEBUG(FvwmIconMan)                                      
########################## Icon Manager ####################################
# this is a window that lists the iconised processes -  
# Similar to, if uglier than, FvwmWinList but better control of what is displayed
*FvwmIconMan: NumManagers 1
*FvwmIconMan: Resolution  global
*FvwmIconMan: Colorset 0 # default text colour - should track MenuColorset
*FvwmIconMan: FocusColorset 5 # text colour for the window with focus
*FvwmIconMan: FocusAndSelectColorset 2 # text colour for buttons which are focused and selected
*FvwmIconMan: IconColorset 6 # text colour for buttons whose apps are iconified 
*FvwmIconMan: PlainColorset 4 # text colour for normal buttons - seems to be the same as ColorSet
*FvwmIconMan: SelectColorset 5 # text colour for selected button
*FvwmIconMan: TitleColorset 6 # button when manager is empty
*FvwmIconMan: font        WINLISTFONT
*FvwmIconMan: format      "%c: %i"
*FvwmIconMan: action      Mouse   1 N sendcommand DeiconifyFocusAndRaise, quit
*FvwmIconMan: action      Mouse   2 N sendcommand "Iconify"
*FvwmIconMan: action      Mouse   3 N sendcommand "Popup Window-Ops2"
*FvwmIconMan: action      Key 	  q N quit
*FvwmIconMan: action      Key 	  Escape N quit
*FvwmIconMan: followfocus true
#*FvwmIconMan: sort name
*FvwmIconMan: focusbutton          up yellow firebrick
*FvwmIconMan: focusandselectButton down yellow firebrick
*FvwmIconMan: DrawIcons Always
*FvwmIconMan: buttongeometry  300x30
*FvwmIconMan: PlainButton Up
*FvwmIconMan: managergeometry 1
*FvwmIconMan: UseWinList false
*FvwmIconMan: Show resource=*
*FvwmIconMan: DontShow resource=Fvwm*

DEBUG(FvwmBacker)
# xli appears to be the fastest load for jpg
# xli won't load xpm or xwd files
# display 
# approx timings in seconds to load 1600x1200 images (on 633Mhz Celeron gentoo optimised)
#               JPG XPM XWD PNG
# xli             1   x   x   2 == xsetbg
# display         2   x   2   2
# fvwm-root       x >30   x   2
# xwud            x   x   2   x but can't undump to root

# for root window:
m4_ifdef({BG_DESK_0},{*FvwmBacker: Command (Desk 0) BG_DESK_0},
m4_ifdef({BG_DESK_0_PAGE_00},{*FvwmBacker: Command (Desk 0, Page 0 0) BG_DESK_0_PAGE_00})
m4_ifdef({BG_DESK_0_PAGE_10},{*FvwmBacker: Command (Desk 0, Page 1 0) BG_DESK_0_PAGE_10})
m4_ifdef({BG_DESK_0_PAGE_20},{*FvwmBacker: Command (Desk 0, Page 2 0) BG_DESK_0_PAGE_20})
m4_ifdef({BG_DESK_0_PAGE_01},{*FvwmBacker: Command (Desk 0, Page 0 1) BG_DESK_0_PAGE_01})
m4_ifdef({BG_DESK_0_PAGE_11},{*FvwmBacker: Command (Desk 0, Page 1 1) BG_DESK_0_PAGE_11})
m4_ifdef({BG_DESK_0_PAGE_21},{*FvwmBacker: Command (Desk 0, Page 2 1) BG_DESK_0_PAGE_21}))

m4_ifdef({BG_DESK_1},{*FvwmBacker: Command (Desk 1) BG_DESK_1},
m4_ifdef({BG_DESK_1_PAGE_00},{*FvwmBacker: Command (Desk 1, Page 0 0) BG_DESK_1_PAGE_00})
m4_ifdef({BG_DESK_1_PAGE_10},{*FvwmBacker: Command (Desk 1, Page 1 0) BG_DESK_1_PAGE_10})
m4_ifdef({BG_DESK_1_PAGE_20},{*FvwmBacker: Command (Desk 1, Page 2 0) BG_DESK_1_PAGE_20})
m4_ifdef({BG_DESK_1_PAGE_01},{*FvwmBacker: Command (Desk 1, Page 0 1) BG_DESK_1_PAGE_01})
m4_ifdef({BG_DESK_1_PAGE_11},{*FvwmBacker: Command (Desk 1, Page 1 1) BG_DESK_1_PAGE_11})
m4_ifdef({BG_DESK_1_PAGE_21},{*FvwmBacker: Command (Desk 1, Page 2 1) BG_DESK_1_PAGE_21}))

m4_ifdef({BG_DESK_2},{*FvwmBacker: Command (Desk 2) BG_DESK_2},
m4_ifdef({BG_DESK_2_PAGE_00},{*FvwmBacker: Command (Desk 2, Page 0 0) BG_DESK_2_PAGE_00})
m4_ifdef({BG_DESK_2_PAGE_10},{*FvwmBacker: Command (Desk 2, Page 1 0) BG_DESK_2_PAGE_10})
m4_ifdef({BG_DESK_2_PAGE_20},{*FvwmBacker: Command (Desk 2, Page 2 0) BG_DESK_2_PAGE_20})
m4_ifdef({BG_DESK_2_PAGE_01},{*FvwmBacker: Command (Desk 2, Page 0 1) BG_DESK_2_PAGE_01})
m4_ifdef({BG_DESK_2_PAGE_11},{*FvwmBacker: Command (Desk 2, Page 1 1) BG_DESK_2_PAGE_11})
m4_ifdef({BG_DESK_2_PAGE_21},{*FvwmBacker: Command (Desk 2, Page 2 1) BG_DESK_2_PAGE_21}))

*FvwmScrollBack Colorset 0
	
############################################################
# Iconbox still has a right hand border -- how to get rid of it?
############################################################
# Note that icons are shown in the module
#    only if NoIcon commnand is applied.
# This one appears in my right-hand bar!
Style * NoIcon
*FvwmIconBox: Colorset 0
*FvwmIconBox: IconColorset 1
*FvwmIconBox: IconHiColorset 2
*FvwmIconBox: Geometry    1x5+0+0
*FvwmIconBox: UseSkipList
*FvwmIconBox: Placement   Top Left
#*FvwmIconBox: MaxIconSize 60x48
#*FvwmIconBox: Font        -adobe-helvetica-medium-r-*-*-12-*-*-*-*-*-*-*
*FvwmIconBox: SortIcons   IconName
*FvwmIconBox: Padding     0
# This is over-ridden when swallowed by the FvwmButton command:
*FvwmIconBox: Lines       10
#*FvwmIconBox: SBWidth     0
#*FvwmIconBox: Pixmap      fvwm.xpm
*FvwmIconBox: HideSC Horizontal
*FvwmIconBox: SetWMIconSize
*FvwmIconBox: HilightFocusWin
*FvwmIconBox: FrameWidth 0 0
#*FvwmIconBox: Resolution          Desk
#*FvwmIconBox: "XTerm*" "-" ... just suppresses the icon, not the entry!
#*FvwmIconBox: "rxvt" "-"
*FvwmIconBox: Mouse       1       Click           DeiconifyFocusAndRaise
*FvwmIconBox: Mouse       1       DoubleClick     Iconify
*FvwmIconBox: Mouse       2       Click           Iconify -1, Focus
*FvwmIconBox: Mouse       3       Click           Popup Window-Ops2
*FvwmIconBox: Key         r       DeiconifyFocusAndRaise
*FvwmIconBox: Key         space   Iconify
*FvwmIconBox: Key         d       Close
*FvwmIconBox: Key         n       Next
*FvwmIconBox: Key         p       Prev
*FvwmIconBox: Key         h       Left
*FvwmIconBox: Key         Left    Left
*FvwmIconBox: Key         j       Down
*FvwmIconBox: Key         Down    Down
*FvwmIconBox: Key         k       Up
*FvwmIconBox: Key         Up      Up
*FvwmIconBox: Key         l       Right
*FvwmIconBox: Key         Right   Right
#
# Icon file specifications
#
# Mostly, you don't have to specify icon files, as FvwmIconBox now
# reads icon files specified in Style commands.
#
*FvwmIconBox            "Fvwm*"         -

DEBUG(FvwmForm-Rlogin)
# FvwmForm alias - rlogin or telnet to host via xterm
*FvwmForm-Rlogin: WarpPointer
*FvwmForm-Rlogin: Font         WINFONT
*FvwmForm-Rlogin: ButtonFont   WINFONT
*FvwmForm-Rlogin: InputFont    WINFONT
*FvwmForm-Rlogin: Colorset     0
*FvwmForm-Rlogin: ItemColorset 1
*FvwmForm-Rlogin: WarpPointer
# begin items
*FvwmForm-Rlogin: Line         center
*FvwmForm-Rlogin: Text         "Login to Remote Host"
*FvwmForm-Rlogin: Line         center
*FvwmForm-Rlogin: Text         "Host:"
*FvwmForm-Rlogin: Input        HostName  30   ""
*FvwmForm-Rlogin: Line         center
*FvwmForm-Rlogin: Selection    meth single
*FvwmForm-Rlogin: Choice       TN TN off "telnet"
*FvwmForm-Rlogin: Choice       RL RL on "rlogin: "
*FvwmForm-Rlogin: Selection    UserSel   single
#*FvwmForm-Rlogin: Choice       Default   Default   on   "same user"
#*FvwmForm-Rlogin: Choice       Custom    Custom    off  "user:"
*FvwmForm-Rlogin: Text         "(Userid:"
*FvwmForm-Rlogin: Input        UserName  10   ""
*FvwmForm-Rlogin: Text         ")"
*FvwmForm-Rlogin: Line         center
*FvwmForm-Rlogin: Text         "FG:"
*FvwmForm-Rlogin: Input        FgColor 15 ""
*FvwmForm-Rlogin: Text         "BG:"
*FvwmForm-Rlogin: Input        BgColor 15 ""
*FvwmForm-Rlogin: Line         expand
*FvwmForm-Rlogin: Button       quit "Return - Login" ^M
*FvwmForm-Rlogin: Command Exec xterm  $(FgColor?-fg $(FgColor)) $(BgColor?-bg $(BgColor)) -T xterm@$(HostName) -e $(RL?rlogin: ) $(TN?telnet) $(HostName) $(RL?-8 $(UserName?-l $(UserName)))
*FvwmForm-Rlogin: Button       restart   "^U - Clear" ^U
*FvwmForm-Rlogin: Command Beep
*FvwmForm-Rlogin: Button       quit "Esc - Cancel" ^[
*FvwmForm-Rlogin: Command Nop

DEBUG(FvwmForm-QuitVerify)
# FvwmForm alias - query exit ala mwm
*FvwmForm-QuitVerify: GrabServer
*FvwmForm-QuitVerify: WarpPointer
#*FvwmForm-QuitVerify: Font          *helvetica*m*r*n*14*
#*FvwmForm-QuitVerify: ButtonFont    *helvetica*m*o*n*14*
#*FvwmForm-QuitVerify: ButtonFont    7x13bold
*FvwmForm-QuitVerify: Colorset 0
*FvwmForm-QuitVerify: ItemColorset 2
# begin items
*FvwmForm-QuitVerify: Line          center
*FvwmForm-QuitVerify: Text          "Do you really want to exit FVWM?"
*FvwmForm-QuitVerify: Line          expand
*FvwmForm-QuitVerify: Button   quit      "Return - Exit" ^M
*FvwmForm-QuitVerify: Command  Quit
*FvwmForm-QuitVerify: Button   quit      "Esc - Cancel" ^[
*FvwmForm-QuitVerify: Command  Nop

DEBUG(FvwmForm-Connector)
# FvwmForm alias - control internet connection
*FvwmForm-Connector: WarpPointer
#*FvwmForm-Connector: Font          *helvetica*m*r*n*14*
#*FvwmForm-Connector: ButtonFont    *helvetica*m*o*n*14*
#*FvwmForm-Connector: ButtonFont    7x13bold
*FvwmForm-Connector: Fore          FOREGROUND
*FvwmForm-Connector: Colorset 0
*FvwmForm-Connector: ItemColorset 1
# begin items
*FvwmForm-Connector: Line          center
*FvwmForm-Connector: Text          "Internet connection"
*FvwmForm-Connector: Line          expand
*FvwmForm-Connector: Button   quit      "Return - On" ^M
*FvwmForm-Connector: Command  Exec sudo internet on
*FvwmForm-Connector: Button   quit      "Off"
*FvwmForm-Connector: Command  Exec sudo internet off
*FvwmForm-Connector: Button   quit      "Esc - Cancel" ^[
*FvwmForm-Connector: Command  Nop

DEBUG(FvwmForm-MyTalkOneShot)
# FvwmForm-MyTalkOneShot & FvwmForm-MyTalk from Dave Goldberg
# FvwmForm-MyTalkOneShot Form - dissappears after use
*FvwmForm-MyTalkOneShot: WarpPointer
*FvwmForm-MyTalkOneShot: Colorset 0
*FvwmForm-MyTalkOneShot: ItemColorset 2
*FvwmForm-MyTalkOneShot: Line center
*FvwmForm-MyTalkOneShot: Text "Fvwm Function"
*FvwmForm-MyTalkOneShot: Input Func 40 ""
*FvwmForm-MyTalkOneShot: Line expand
*FvwmForm-MyTalkOneShot: Button quit "Return - Run" ^M
*FvwmForm-MyTalkOneShot: Command $(Func)
*FvwmForm-MyTalkOneShot: Button restart "^U - Clear" ^U
*FvwmForm-MyTalkOneShot: Button quit "Esc - Cancel" ^[
*FvwmForm-MyTalkOneShot: Command Nop

# FvwmForm-MyTalk Form - sticks around
*FvwmForm-MyTalk: WarpPointer
#*FvwmForm-MyTalk: Font *helvetica*m*r*n*14*
#*FvwmForm-MyTalk: ButtonFont *helvetica*m*o*n*14*
#*FvwmForm-MyTalk: InputFont *cour*m*r*n*14*
*FvwmForm-MyTalk: Colorset 0
*FvwmForm-MyTalk: ItemColorset 1
*FvwmForm-MyTalk: Line expand
*FvwmForm-MyTalk: Text "Fvwm Function"
*FvwmForm-MyTalk: Input Func 80 ""
*FvwmForm-MyTalk: Line expand
*FvwmForm-MyTalk: Text "Msg:"
*FvwmForm-MyTalk: Message
*FvwmForm-MyTalk: Line expand
*FvwmForm-MyTalk: Button restart "Return - Run" ^M
*FvwmForm-MyTalk: Command $(Func)
*FvwmForm-MyTalk: Button restart "^U - Clear" ^U
*FvwmForm-MyTalk: Command Nop
*FvwmForm-MyTalk: Button restart "F1 - Help" F1
*FvwmForm-MyTalk: Command Module FvwmForm FvwmForm-TalkHelp
*FvwmForm-MyTalk: Button quit "Esc - Quit" ^[
*FvwmForm-MyTalk: Command Nop

# FvwmForm-TalkHelp - Help Text for FvwmForm-Talk
DestroyModuleConfig  FvwmForm-TalkHelp: *
*FvwmForm-TalkHelp: WarpPointer
# Layout
*FvwmForm-TalkHelp: Line    center
*FvwmForm-TalkHelp: Text    "Talk to Fvwm - Help"
*FvwmForm-TalkHelp: Line    left
*FvwmForm-TalkHelp: Text    " "
*FvwmForm-TalkHelp: Line    left
*FvwmForm-TalkHelp: PadVText 0
*FvwmForm-TalkHelp: Text    "Enter commands in the \"Command:\" input field."
*FvwmForm-TalkHelp: Line    left
*FvwmForm-TalkHelp: Text    "Commands beginning with \"!\" are executed by the"
*FvwmForm-TalkHelp: Line    left
*FvwmForm-TalkHelp: Text    "shell as a sub-process of the form."
*FvwmForm-TalkHelp: Line    left
*FvwmForm-TalkHelp: Text    "All other commands are sent to fvwm for execution."
*FvwmForm-TalkHelp: Line    left
*FvwmForm-TalkHelp: Text    ""
*FvwmForm-TalkHelp: Line    left
*FvwmForm-TalkHelp: Text    "Fvwm error messages are shown on the \"Msg:\" line."
*FvwmForm-TalkHelp: Line    left
*FvwmForm-TalkHelp: Text    ""
# Buttons
*FvwmForm-TalkHelp: Line    center
*FvwmForm-TalkHelp: Button  quit    "Return - Dismiss"         ^M
*FvwmForm-TalkHelp: Command   Nop

DEBUG(FvwmBanner)
# to change banner pixmap
#*FvwmBannerPixmap fvwm3.xpm
#*FvwmBannerTimeout 2

m4_ifelse({ this is for gnome-1 only, (via fvwm-menu_desktop) so is useless:
DEBUG(FvwmGtk)
Module FvwmGtk
*FvwmGtk: Destroy gnome-all
*FvwmGtk: Menu gnome-all
*FvwmGtk: Title "Gnome Menus"
*FvwmGtk: Separator
*FvwmGtk: Destroy gnome-sys
*FvwmGtk: Submenu "System" gnome-sys
*FvwmGtk: Destroy gnome-user
*FvwmGtk: Submenu "User" gnome-user
*FvwmGtk: Destroy gnome-redhat
*FvwmGtk: Submenu "RedHat" gnome-redhat
})

DEBUG(FvwmForm-Print)
# Derived from /usr/share/fvwm/FvwmForm-Print:
DestroyModuleConfig  FvwmForm-Print: *
*FvwmForm-Print: WarpPointer
*FvwmForm-Print: Line       center
*FvwmForm-Print: Text       "Capture Window"
*FvwmForm-Print: Line       left
*FvwmForm-Print: Text       "File: "
*FvwmForm-Print: Input      file            25      "/tmp/capture.pnm"
*FvwmForm-Print: Line       left
#*FvwmForm-Print: Text       "Printer: "
#*FvwmForm-Print: Input      printer         20      "lp"
*FvwmForm-Print: Text       "Program: "
*FvwmForm-Print: Input      program         20      "gimp"
*FvwmForm-Print: Line       expand
*FvwmForm-Print: Line       left
*FvwmForm-Print: Text       "xwd options:"
*FvwmForm-Print: Line       expand
*FvwmForm-Print: Selection  Options multiple
*FvwmForm-Print: Choice     Brd     -nobdrs off     "No border"
*FvwmForm-Print: Choice     Frm     -frame  on      "With frame"
*FvwmForm-Print: Choice     XYZ     -xy     off     "XY format"
*FvwmForm-Print: Line       expand
*FvwmForm-Print: Button     continue        "Return - Capture"       ^M
*FvwmForm-Print: Command    Exec exec xwd $(Options) | xwdtopnm > $(file); $(program) $(file) &
m4_dnl xpr no longer exists?
m4_dnl *FvwmForm-Print: Command    Exec exec xpr -device $(PtrType) $(file) | lpr -P $(printer) &
*FvwmForm-Print: Button     quit        "Capture root"
*FvwmForm-Print: Command    Exec exec xwd -root | xwdtopnm > $(file); $(program) $(file) &
*FvwmForm-Print: Button     quit            "Esc - Quit" ^[

m4_dnl this needs some work - I don't use it!
DEBUG({WHARF})
Style "FvwmWharf"  NoTitle, NoHandles, Sticky, WindowListSkip, BorderWidth 2,CirculateSkip

DestroyModuleConfig FvwmWharf: *
*FvwmWharf: Animate
*FvwmWharf: AnimateMain
*FvwmWharf: Geometry -2-50
*FvwmWharf: Columns 1
*FvwmWharf: Bgcolor Grey
#*FvwmWharf: ForceSize
*FvwmWharf: FullPush

*FvwmWharf: Colorset 0
*FvwmWharf: TextureType 1
*FvwmWharf: TextureColor FOREGROUND BACKGROUND

*FvwmWharf X           arrows2.xpm      Folder
*FvwmWharf kill        rbomb2.xpm       Close
*FvwmWharf Recycler    Jrecycle.xpm     Restart
*FvwmWharf "Quit Fvwm" exit.xpm         FvwmForm FvwmForm-QuitVerify
m4_ifdef({XLOCK},{*FvwmWharf xlock       Jlock.xpm        Exec exec xlock -nice 10 -mode random})
*FvwmWharf ~Folder
#PREF 3
m4_ifdef({RXVT},{*FvwmWharf RXVT_panel_label         RXVT_icon      RXVT_run},
	{*FvwmWharf XTERM_panel_label         XTERM_icon  XTERM_run})
m4_ifdef({EMACS},{*FvwmWharf EMACS_panel_label       EMACS_icon     EMACS_run})
m4_ifdef({XFM},{*FvwmWharf XFM_panel_label      XFM_icon          XFM_run})

*FvwmWharf Y            arrows2.xpm     Folder
m4_ifdef({NETSCAPE},{*FvwmWharf NETSCAPE_panel_label     NETSCAPE_icon       NETSCAPE_run})
m4_ifdef({MOZILLA},{*FvwmWharf MOZILLA_panel_label     MOZILLA_icon       MOZILLA_run})
m4_ifdef({FIREBIRD},{*FvwmWharf FIREBIRD_panel_label     FIREBIRD_icon       FIREBIRD_run})
m4_ifdef({FIREFOX},{*FvwmWharf FIREFOX_panel_label     FIREFOX_icon       FIREFOX_run})
m4_ifdef({OPERA},{*FvwmWharf OPERA_panel_label     OPERA_icon       OPERA_run})
m4_ifdef({SYLPHEED},{*FvwmWharf SYLPHEED_panel_label     SYLPHEED_icon       SYLPHEED_run})
m4_ifdef({GIMP},{*FvwmWharf GIMP_panel_label     GIMP_icon      GIMP_run})
*FvwmWharf ~Folder

m4_ifdef({RCLOCK},{*FvwmWharf rclock nil  MaxSwallow "rclock" RCLOCK_run})
m4_ifdef({XCLOCK},{*FvwmWharf xclock nil  MaxSwallow "xclock" XCLOCK_run})
m4_ifdef({XLOAD},{*FvwmWharf xload nil  MaxSwallow "xload" XLOAD_run})
*FvwmWharf pager nil MaxSwallowModule "FvwmPagerPager" FvwmPager FvwmPagerPager * *

DEBUG({EVENT})
*FvwmEvent-NewWindow: StartDelay 4
*FvwmEvent-NewWindow: add_window FuncFocusWindow

# It would be nice to exclude transient popup windows (eg xine's popup
# menus as the warp triggers lower level menus) but include transient
# dialog windows (eg audacity's dialogs) - but there seems no way to
# do it

# HasHandles - excludes audacity's dialogs
# Maximisable - does not exclude xine's popups
# PlacedByFvwm - excludes some of audacity's dialogs!!
# Iconifiable - excludes some of audacity's dialogs!!
# Closable - does not exclude xine's popups
# PlacedByButton3 - seems to work!
# !xine - seems not to work
# Transient - does not exclude xine's popups

DestroyFunc FuncFocusWindow
AddToFunc   FuncFocusWindow
+ I ThisWindow (AcceptsFocus, CurrentPage, !"Xine*") Focus
+ I ThisWindow (AcceptsFocus, CurrentPage, !"Xine*") WarpToWindow 50 50

