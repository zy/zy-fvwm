#------------------------------------------------------------------------------
#------------------ FvwmTaskBar
#------------------------------------------------------------------------------

Style "FvwmTaskBar" NoTitle,Sticky,WindowListSkip,CirculateSkip,NoHandles, \
                        TitleAtBottom, StaysOnTop, BorderWidth 0

#------------------------------------------------------------------------------
#--------- Taskbar's start menu
#------------------------------------------------------------------------------

DEBUG(StartMenu)
DestroyMenu StartMenu
AddToMenu   StartMenu
m4_ifdef({RXVT},{+ "&Rxvt%GETMINI(mini-term.xpm,Rxvt)%"           		RXVT_run},{+ "&Xterm%GETMINI(mini-term.xpm,Xterm)%" XTERM_run})
+ "&Fvwm%GETMINI(mini.fvwm.xpm,Fvwm)%"				Popup Fvwm
+ "Rearra&ge%GETMINI(mini.fvwm.xpm,WinRearrange)%"			Popup WinRearrange
+ "&Programs%GETMINI(mini/x.xpm,RootMenu)%"             Popup RootMenu
+ "Shut &Down%GETMINI(mini/x.xpm,FvwmScript-Quit)%"            Module FvwmScript FvwmScript-Quit

# Note: Title at bottom is for shading.
DEBUG(FvwmTaskBar)
DestroyModuleConfig FvwmTaskBar*
*FvwmTaskBar: Geometry +0-0
*FvwmTaskBar: Rows 1
*FvwmTaskBar: Colorset 0
*FvwmTaskBar: IconColorset 0
*FvwmTaskBar: FocusColorset 1
*FvwmTaskBar: Font SMALLFONT
*FvwmTaskBar: SelFont SMALLFONT
*FvwmTaskBar: StatusFont fixed
*FvwmTaskBar: Action Click1 DeiconifyFocusAndRaise
*FvwmTaskBar: Action Click2 Iconify
*FvwmTaskBar: Action Click3 Menu Window-Ops2 c+0 -101m
*FvwmTaskBar: UseSkipList
*FvwmTaskBar: AutoStick
*FvwmTaskBar: StartName fvwm2
*FvwmTaskBar: StartMenu StartMenu mouse -100p -100m
*FvwmTaskBar: StartIcon mini.penguin.xpm
*FvwmTaskBar: ShowTips
*FvwmTaskBar: ShowTransients
#*FvwmTaskBar: HighlightFocus
*FvwmTaskBar: AutoHide
#*FvwmTaskBar: DeskOnly
*FvwmTaskBar: NoIconAction SendToModule FvwmAnimate animate
*FvwmTaskBar: Button Title Lock, Icon screensaver-locking.xpm, Action (Mouse 1) Exec xscreensaver-command -lock, Action (Mouse 3) Exec xscreensaver-demo

#Style "FvwmTaskBar" Sticky, NoTitle, NoHandles, BorderWidth 1, HandleWidth 1, WindowListSkip
#
#*FvwmTaskBar: Geometry +0+0
#*FvwmTaskBar: NoBrightFocus
#*FvwmTaskBar: AutoStick
#*FvwmTaskBar: Font     -adobe-helvetica-medium-r-*-*-10-*-*-*-*-*-*-*
## The manpage says the start menu uses SelFont, but it doesn't seem to
#*FvwmTaskBar: SelFont    -adobe-helvetica-bold-r-*-*-10-*-*-*-*-*-*-*
## Font for clock
#*FvwmTaskBar: StatusFont -adobe-helvetica-bold-r-*-*-10-*-*-*-*-*-*-*
#*FvwmTaskBar: StartName Programs
#*FvwmTaskBar: StartMenu (Mouse 1) Quick-Menu
#*FvwmTaskBar: StartMenu (Mouse 2) Window-Ops
#*FvwmTaskBar: StartMenu (Mouse 3) System
#*FvwmTaskBar: StartIcon SUN.xpm
#*FvwmTaskBar: StartButtonRightMargin 4
##*FvwmTaskBar: StartCommand Popup Quick-Menu rectangle +100+100
#*FvwmTaskBar: ClockFormat %l:%M%p %h %e
#*FvwmTaskBar: DeskOnly
#*FvwmTaskBar: UseSkipList
#*FvwmTaskBar: Button Icon mini/mini.display.xpm, Action exec Eterm
#*FvwmTaskBar: Button Icon mini/main-window16.xpm, Action exec mozilla
##*FvwmTaskBar: Button Icon mini/mini.sound.xpm, Action exec /usr/openwin/bin/audiocontrol

Module FvwmTaskBar