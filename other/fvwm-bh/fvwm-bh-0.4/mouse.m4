# some simple default mouse bindings:
# Mouse <Button> <Context> <Modifiers> <Function>
# Button:    	0=any button
# Context:   	R=root 
#				W=applicationWindow 
#				T=titleBar 
#				S=sideTopBottom 
#				F=frame(corners) 
#				I=icon 
#				0-9=title bar button (odd=left even=right)
#				A=anyExceptButtons
# Modifiers: 	N=none 
#				C=control 
#				S=shift 
#				M=meta 
#				A=any

# According to the man page, these are builtin:
#            Mouse 1 R A Menu MenuFvwmRoot
#            Mouse 1 T   A FuncFvwmRaiseLowerX Move
#            Mouse 1 FS  A FuncFvwmRaiseLowerX Resize
#            Mouse 2 FST A FuncFvwmRaiseLowerX Move

#   for the root window:
Mouse 3	    R   	A   Menu RootMenu Nop
Mouse 2	    R    	A   Menu Window-Ops2 Nop
#Mouse 3	R    	A   WindowList
#Mouse 3	R    	A   Module FvwmWinList
Mouse 1	    R    	A   Module FvwmIconMan
Mouse 3     R       M   SendToModule FvwmGtk gnome-all
Mouse 1     R       M   FvwmIdent-Func

#   for the left title bar buttons:
Mouse 0	    1    	A   Menu Window-Ops2 Close
Mouse 0     3		A	Delete

#   for the right title bar buttons:
Mouse 0	    2    	A   Maximize 100 100 # WindowShade
Mouse 0	    4    	A   Iconify

#   for other parts of the window/borders/icons:
Mouse 1		F		A	Resize-or-Raise
Mouse 1		T		A	Move-or-Raise
Mouse 1 	S		A	Resize
Mouse 1		I		A	Move-or-Iconify
Mouse 2		I		A	Iconify
Mouse 2		FST		A	Menu Window-Ops2 Nop
Mouse 3		TSIF	A	FvwmIdent-Func
Mouse 4		T		A	WindowShade False
Mouse 5		T		A	WindowShade True

# Control-button-1 in title bar moves to top left:
Mouse 1     T       C   Move 1p 0
# Alt-Button 1 in the title, sides, or icon, w/ any modifiers, gives move or raise
Mouse 1     TSIFW   M   Move-or-Raise

