# According to the man page, these are builtin:
#            AddToFunc FuncFvwmRaiseLowerX
#            + I Raise
#            + M $0
#            + D Lower

DestroyFunc DeiconifyFocusAndRaise
AddToFunc DeiconifyFocusAndRaise 
+ I Iconify off
+ I Focus
+ I Raise

AddToFunc SendToDeskAndPage
+ I ThisWindow MoveToDesk 0 $0
+ I GotoDesk 0 $0
+ I ThisWindow MoveToPage $1 $2
+ I GotoPage $1 $2
+ I Raise

AddToFunc PopupFvwmIconMan
+ I Module FvwmIconMan
+ I DeiconifyFocusAndRaise
+ I WindowId FvwmIconMan WarpToWindow 50 50

######################## Initialization Functions ############################
DestroyFunc StartFunction
AddToFunc StartFunction 
+ I Module FvwmButtons
+ I Module FvwmBacker
+ I Module FvwmCommandS
+ I FvwmEvent FvwmEvent-NewWindow

#fvwm-menu-xlock -n MenuSSaver -t "Screensaver" -icon-item mini.bball.xpm -- -nice 19 -nolock'
#PipeRead 'fvwm-menu-xlock -n MenuSLock  -t "Lock Screen" -icon-item mini.rball.xpm -- -nice 19'
m4_ifdef({TASKBAR},{+ I Module FvwmTaskBar})
# + "I" exec $HOME/.background

######################## Sample Functions ##########################
# I = immediate
# C = click
# M = motion
# H = hold (for more than ClickTime millisecs)
# D = double click
DEBUG(MailFunction)
AddToFunc MailFunction	   "I" Next [$0] Iconify -1
+ "I" Next [$0] Focus
+ "I" None [$0] Exec $0 $1

DEBUG(Move-or-Raise)
AddToFunc Move-or-Raise
+ "C" RaiseLower
+ "M" Move
+ "D" Lower

DEBUG(Move-or-Raise2)
AddToFunc Move-or-Raise2	"M" Raise
+ "M" Move
+ "D" Lower

DEBUG(Maximize-Func)
AddToFunc Maximize-Func		"M" Maximize	 100 100
+ "C" Maximize	 0 100
+ "D" Maximize	 100 100

DEBUG(MaximizeV-Func)
AddToFunc MaximizeV-Func
+ "I" Maximize	    50 100
+ "I" Move	  	    1p 0

DEBUG(Move-or-Iconify)
AddToFunc Move-or-Iconify	"I" Raise
+ "M" Move
+ "D" Iconify

DEBUG(Resize-or-Raise)
AddToFunc Resize-or-Raise
+ "I" Raise
+ "M" Resize
+ "D" Lower

DEBUG(Resize-or-Raise2)
AddToFunc Resize-or-Raise2
+ "M" Raise
+ "M" Resize
+ "D" Lower

DEBUG(PrintFunction)
AddToFunc PrintFunction
+ "I" Raise
+ "I" Exec xdpr -id $w

DEBUG(PrintReverseFunction)
AddToFunc PrintReverseFunction
+ "I" Raise
+ "I" Exec xdpr 1/2 -h -rv -id $w

DEBUG(Iconify-and-Raise)
AddToFunc Iconify-and-Raise
+ "I" Iconify
+ "I" Raise

DEBUG(FocusAndWarp)
AddToFunc FocusAndWarp
+ "I" Focus
+ "I" WarpToWindow 50 50

DEBUG(DeiconifyFocusAndWarp)
AddToFunc DeiconifyFocusAndWarp
+ "I" Iconify -1
+ "I" FocusAndWarp

DEBUG(ChangeDefaultFocus)
AddToFunc ChangeDefaultFocus
+ "I" Style "*" $0
+ "I" AddToFunc

# RunFocusWarp EXEC_STRING PROGNAME STYLE
AddToFunc RunFocusWarp
+ "I" $0
+ "I" Wait $1
+ "I" Next ("$2") FocusAndWarp

DEBUG(BaseDecor)
AddToFunc BaseDecor
# Reset everything to my own original decor:
#+ I Echo BaseDecor
#+ I Exec ./.fvwm/savedecor
+ I Colorset 0 fg FOREGROUND, bg BACKGROUND, Pixmap 
+ I Colorset 1 fg SELECTFOREGROUND, bg SELECTBACKGROUND, Pixmap 
#+ I Colorset 2 fg PAGERFORE, bg PAGERBACK, Pixmap 
+ I Colorset 2 fg white, bg SlateBlue, Pixmap 
+ I Colorset 3 fg #484048, bg #908090, Pixmap 
+ I Colorset 6 DGradient 200 SlateBlue navy m4_dnl background
+ I AddToDecor "base" BorderStyle Simple 
+ I AddToDecor "base" TitleStyle Centered 
#+ I AddToDecor "base" TitleStyle ActiveUp HGradient 32 2 SlateBlue 16 navy 16 SlateBlue
+ I AddToDecor "base" TitleStyle ActiveUp SGradient 32 SlateBlue navy
+ I AddToDecor "base" TitleStyle ActiveDown Solid #900000 
+ I AddToDecor "base" ButtonStyle Reset
+ I AddToDecor "base" ButtonStyle 3 17 20x20@1 30x20@1 50x40@1 70x20@1 80x20@1 80x30@0 60x50@0 80x70@1 80x80@0 70x80@0 50x60@0 30x80@0 20x80@0 20x70@0 40x50@1 20x30@0 20x20@1
+ I Style * UseDecor base
#+ I Style * HiLightFore white, HiLightBack SlateBlue
+ I Style * HiLightColorset 2
+ I Style * Colorset 0
+ I Style * BorderWidth BORDERWIDTH, HandleWidth HANDLEWIDTH
#+ I Style * Icon unknown1.xpm
+ I Style * NoIcon # for the sake of FvwmIconMan etc ... keep the desktop clear of filthy icons
+ I Style * MWMFunctions, MWMDecor, HintOverride
+ I Style * DecorateTransient, NoPPosition
+ I Style * FocusFollowsMouse
+ I Style * MinOverlapPlacement
+ I Style * ResizeOpaque
+ I Style * Font WINFONT
+ I Style * IconFont ICONFONT
+ I Style * MwmBorder
+ I Style * MwmButtons
+ I Style FvwmButtons NoTitle, NoHandles, Sticky, BorderWidth BUTTONBARBORDER, Icon toolbox.xpm, ClickToFocus, StaysOnTop
+ I Style FvwmIconBox NoTitle, NoHandles, Sticky, BorderWidth 0
+ I Style FvwmTaskBar NoTitle, NoHandles, BorderWidth 0, Sticky, StaysOnTop
+ I Style FvwmIconMan Sticky, StaysOnTop
+ I Style Fvwm* CirculateSkipIcon, CirculateSkip, WindowListSkip
+ I Style FvwmPager StaysOnTop
+ I Style FvwmBanner StaysOnTop
+ I Style xpdf Title, Handles, BorderWidth 2, Icon XPFD_icon, SloppyFocus,StaysPut,!WindowListSkip
+ I MenuStyle * MenuColorset 0
+ I MenuStyle * ActiveColorset 3
#+ I MenuStyle * Foreground FOREGROUND, BackGround BACKGROUND
+ I MenuStyle * HilightBack SELECTBACKGROUND
+ I MenuStyle * PopupDelayed, PopupDelay 150
+ I MenuStyle * Font MENUFONT, Hilight3DThin, Animation
+ I MenuStyle * BorderWidth 2
+ I MenuStyle * TrianglesRelief
+ I MenuStyle * SidePic side.fvwm2.xpm, SideColor Black
+ I *FvwmPager: Colorset * 0
+ I *FvwmPager: HilightColorset * 2
+ I *FvwmTaskBar: Colorset 1
+ I *FvwmTaskBar: IconColorset 0
+ I *FvwmTaskBar: FocusColorset 1
+ I *FvwmTaskBar: StartIcon buttons/EosCobbleBut3.xpm
+ I *FvwmIdent: Colorset 0
+ I *FvwmIconBox:  Colorset 0
+ I *FvwmIconMan:  Colorset 0
+ I *FvwmWinList:  Colorset 0
+ I *FvwmWharf: Colorset 0
# These are all forms:
+ I *FvwmForm: Colorset 0
+ I *FvwmForm-MyTalkOneShot: Colorset 0
+ I *FvwmForm-MyTalkOneShot: ItemColorset 1
+ I *FvwmForm-MyTalk: Colorset 0
+ I *FvwmForm-MyTalk: ItemColorset 1
+ I *FvwmForm-Print: Colorset 0
+ I *FvwmForm-Print: ItemColorset 1
+ I *FvwmForm-TalkHelp: Colorset 0
+ I *FvwmForm-TalkHelp: ItemColorset 1
+ I *FvwmForm-Connector: Colorset 0
+ I *FvwmForm-Connector: ItemColorset 1
+ I *FvwmForm-Rlogin: Colorset 0
+ I *FvwmForm-Rlogin: ItemColorset 1

AddToFunc BaseDecorAndSAve
+ I BaseDecor
+ I Exec ./.fvwm/savedecor

DEBUG(PlainDecor) 
AddToFunc PlainDecor
#+ I DestroyModuleConfig FvwmTaskBar: StartIcon
+ I Exec ./.fvwm/savedecor "PlainDecor $0 $1"
+ I Colorset 0 fg $0, bg $1, TiledPixmap, Pixmap
+ I Colorset 1 fg $1, bg $0, TiledPixmap, Pixmap
+ I Style * IconTitleColorset
+ I Style * HilightIconTitleColorset
+ I Read $[HOME]/.fvwm/decor/plain.decor
#+ I KillModule FvwmTaskBar
#+ I Module FvwmTaskBar
#+ I KillModule FvwmPager
#+ I Module FvwmPager 0 2

DEBUG(SwitchDecor)
AddToFunc SwitchDecor
#+ I DestroyModuleConfig FvwmTaskBar: StartIcon
+ I Exec ./.fvwm/savedecor "SwitchDecor $0"
+ I Style * IconTitleColorset
+ I Style * HilightIconTitleColorset
+ I Read $[HOME]/.fvwm/decor/$0
#+ I KillModule FvwmTaskBar
#+ I Module FvwmTaskBar
#+ I KillModule FvwmPager
#+ I Module FvwmPager 0 2

AddToFunc FvwmIdent-Func
+ I Module FvwmIdent
# I RefreshWindow
