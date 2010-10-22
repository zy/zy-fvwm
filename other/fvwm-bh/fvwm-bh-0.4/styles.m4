m4_dnl ************ Leave these macros alone unless you are brave:

m4_dnl usage is _APPSTYLE(flag)
m4_define({_APPSTYLE},{m4_ifdef({$1},{m4_ifdef({$1_style_name},{Style $1_style_name BorderWidth BORDERWIDTH{}m4_ifdef({$1_icon},{{,} Icon $1_icon}){}m4_ifdef({$1_mini},{{,} MiniIcon $1_mini}){}m4_ifdef({$1_extras},{{,} $1_extras})})})})

# Styles for programs:
m4_dnl errprint({_STYLE_LIST=},_STYLE_LIST)
m4_esyscmd(for i in _STYLE_LIST; do u=`echo $i | PROGNAME2MACRO`; echo "{_APPSTYLE}({{$u}})"; done)

m4_define({BUTTONBARBORDER},1)
