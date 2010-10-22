m4_dnl For example, you can define THEME in your
m4_dnl `hostname/`hostname`.m4 file and use the following for the
m4_dnl "BaseDecor":

m4_ifdef({THEME},,{m4_define({THEME},basic)})

# Metal theme:
m4_ifelse(THEME,{metal},{
	m4_ifdef({FONTFAMILY},,{m4_define({FONTFAMILY},{LUCIDA})})
	m4_define({BACKGROUND},{#cccccc})
	m4_define({FOREGROUND},black)
	m4_define({SELECTFOREGROUND},{black})
	m4_define({SELECTBACKGROUND},{#9999cc})
})

# MockMack theme:
m4_ifelse(THEME,{mockmack},{
	m4_ifdef({FONTFAMILY},,{m4_define({FONTFAMILY},{LUCIDA})})
	m4_define({BACKGROUND},{#dddddd})
	m4_define({FOREGROUND},black)
	m4_define({SELECTFOREGROUND},{black})
	m4_define({SELECTBACKGROUND},{#a2ccf2})
})

# basic theme:
m4_ifelse(THEME,{basic},{
	m4_ifdef({FONTFAMILY},,{m4_define({FONTFAMILY},{HELVETICA})})
	m4_define({BACKGROUND},{#eaeaea})
	m4_define({FOREGROUND},black)
	m4_define({SELECTFOREGROUND},{black})
	m4_define({SELECTBACKGROUND},{#a2ccf2})
})

m4_define({PAGERFORE},{#484048})
m4_define({PAGERBACK},{#908090})

m4_ifdef({FONTBASE},,{m4_define({FONTBASE},70)})
m4_define({DEFAULTFONTSIZE},{m4_eval(FONTBASE + 20)})
m4_define({WINFONTSIZE},{m4_eval(FONTBASE + 20)})
m4_define({MENUFONTSIZE},{m4_eval(FONTBASE + 20)})
m4_define({ICONFONTSIZE},{m4_eval(FONTBASE + 10)})
m4_define({SMALLFONTSIZE},{m4_eval(FONTBASE + 10)})
m4_define({TINYFONTSIZE},{m4_eval(FONTBASE + 0)})

m4_ifelse(FONTFAMILY,{LUCIDA},{
	m4_define({DEFAULTFONT},-b&h-lucida-medium-r-normal-*-*-DEFAULTFONTSIZE-100-100-p-*-iso8859-1)
	m4_define({WINFONT},-b&h-lucida-bold-r-normal-*-*-WINFONTSIZE-100-100-p-*-iso8859-1)
	m4_define({MENUFONT},-b&h-lucida-medium-r-normal-*-*-MENUFONTSIZE-100-100-p-*-iso8859-1)
	m4_define({ICONFONT},-b&h-lucida-medium-r-normal-*-*-ICONFONTSIZE-100-100-p-*-iso8859-1)
	m4_define({SMALLFONT},-b&h-lucida-medium-r-normal-*-*-SMALLFONTSIZE-100-100-p-*-iso8859-1)
	m4_define({TINYFONT},-b&h-lucida-medium-r-normal-*-*-TINYFONTSIZE-100-p-*-iso8859-1)
	m4_define({WINLISTFONT},WINFONT)
})

m4_ifelse(FONTFAMILY,{BOOKMAN},{
	m4_define({DEFAULTFONT},-zz_abiword-bookman-regular-r-normal-*-*-DEFAULTFONTSIZE-100-100-p-*-iso8859-1)
	m4_define({WINFONT},-zz_abiword-bookman-bold-r-normal-*-*-WINFONTSIZE-100-100-p-*-iso8859-1)
	m4_define({MENUFONT},-zz_abiword-bookman-regular-r-normal-*-*-MENUFONTSIZE-100-100-p-*-iso8859-1)
	m4_define({ICONFONT},-zz_abiword-bookman-regular-r-normal-*-*-ICONFONTSIZE-100-100-p-*-iso8859-1)
	m4_define({SMALLFONT},-zz_abiword-bookman-regular-r-normal-*-*-SMALLFONTSIZE-100-100-p-*-iso8859-1)
	m4_define({TINYFONT},-zz_abiword-bookman-regular-r-normal-*-*-TINYFONTSIZE-100-100-p-*-iso8859-1)
	m4_define({WINLISTFONT},WINFONT)
})
		
m4_ifelse(FONTFAMILY,{CHARTER},{
	m4_define({DEFAULTFONT},-bitstream-charter-medium-r-normal-*-*-DEFAULTFONTSIZE-*-*-p-*-iso8859-9)
	m4_define({WINFONT},-bitstream-charter-bold-r-normal-*-*-WINFONTSIZE-*-*-p-*-iso8859-9)
	m4_define({MENUFONT},-bitstream-charter-medium-r-normal-*-*-MENUFONTSIZE-*-*-p-*-iso8859-9)
	m4_define({ICONFONT},-bitstream-charter-medium-r-normal-*-*-ICONFONTSIZE-*-*-p-*-iso8859-9)
	m4_define({SMALLFONT},-bitstream-charter-medium-r-normal-*-*-SMALLFONTSIZE-*-*-p-*-iso8859-9)
	m4_define({TINYFONT},-bitstream-charter-medium-r-normal-*-*-TINYFONTSIZE-*-*-p-*-iso8859-9)
    m4_define({WINLISTFONT},WINFONT)
})
		
m4_ifelse(FONTFAMILY,{HELVETICA},{
	m4_define({DEFAULTFONT},-adobe-helvetica-medium-r-normal-*-*-DEFAULTFONTSIZE-100-100-*-*-iso8859-1)
	m4_define({WINFONT},-adobe-helvetica-bold-r-normal-*-*-WINFONTSIZE-100-100-*-*-iso8859-1)
	m4_define({MENUFONT},-adobe-helvetica-bold-r-normal-*-*-MENUFONTSIZE-100-100-*-*-iso8859-1)
	m4_define({ICONFONT},-adobe-helvetica-medium-r-normal-*-*-ICONFONTSIZE-100-100-*-*-iso8859-1)
	m4_define({SMALLFONT},-adobe-helvetica-medium-r-normal-*-*-SMALLFONTSIZE-100-100-*-*-iso8859-1)
	m4_define({TINYFONT},-adobe-helvetica-medium-r-normal-*-*-TINYFONTSIZE-100-100-*-*-iso8859-1)
    m4_define({WINLISTFONT},WINFONT)
})
		
m4_ifelse(FONTFAMILY,{TIMES},{
	m4_define({DEFAULTFONT},-adobe-times-medium-r-normal-*-*-DEFAULTFONTSIZE-100-100-*-*-iso8859-1)
	m4_define({WINFONT},-adobe-times-bold-r-normal-*-*-WINFONTSIZE-100-100-*-*-iso8859-1)
	m4_define({MENUFONT},-adobe-times-medium-r-normal-*-*-MENUFONTSIZE-100-100-*-*-iso8859-1)
	m4_define({ICONFONT},-adobe-times-medium-r-normal-*-*-ICONFONTSIZE-100-100-*-*-iso8859-1)
	m4_define({SMALLFONT},-adobe-times-medium-r-normal-*-*-SMALLFONTSIZE-100-100-*-*-iso8859-1)
	m4_define({TINYFONT},-adobe-times-medium-r-normal-*-*-TINYFONTSIZE-100-100-*-*-iso8859-1)
    m4_define({WINLISTFONT},WINFONT)
})

m4_dnl Ensure there are at least some minimal defaults for base.m4 (not needed in menus.m4):
m4_ifdef({DEFAULTFONT},,{m4_define({DEFAULTFONT},-adobe-helvetica-medium-r-normal-*-*-DEFAULTFONTSIZE-100-100-*-*-iso8859-1)})
m4_ifdef({WINFONT},,{m4_define({WINFONT},-adobe-helvetica-bold-r-normal-*-*-WINFONTSIZE-100-100-*-*-iso8859-1)})
m4_ifdef({MENUFONT},,{m4_define({MENUFONT},-adobe-helvetica-bold-r-normal-*-*-MENUFONTSIZE-100-100-*-*-iso8859-1)})
m4_ifdef({ICONFONT},,{m4_define({ICONFONT},-adobe-helvetica-medium-r-normal-*-*-ICONFONTSIZE-100-100-*-*-iso8859-1)})
m4_ifdef({SMALLFONT},,{m4_define({SMALLFONT},-adobe-helvetica-medium-r-normal-*-*-SMALLFONTSIZE-100-100-*-*-iso8859-1)})
m4_ifdef({TINYFONT},,{m4_define({TINYFONT},-adobe-helvetica-medium-r-normal-*-*-TINYFONTSIZE-100-100-*-*-iso8859-1)})
m4_ifdef({WINLISTFONT},,{m4_define({WINLISTFONT},WINFONT)})
m4_ifdef({FONTFAMILY},,{m4_define({FONTFAMILY},{HELVETICA})})
m4_ifdef({BACKGROUND},,{m4_define({BACKGROUND},{#dddddd})})
m4_ifdef({FOREGROUND},,{m4_define({FOREGROUND},black)})
m4_ifdef({SELECTFOREGROUND},,{m4_define({SELECTFOREGROUND},{black})})
m4_ifdef({SELECTBACKGROUND},,{m4_define({SELECTBACKGROUND},{#a2ccf2})})
m4_ifdef({PAGERFORE},,{m4_define({PAGERFORE},{#484048})})
m4_ifdef({PAGERBACK},,{m4_define({PAGERBACK},{#908090})})

m4_errprint({DEFAULTFONT}=DEFAULTFONT
)
m4_errprint({WINFONT}=    WINFONT
)
m4_errprint({MENUFONT}=   MENUFONT
)
m4_errprint({ICONFONT}=   ICONFONT
)
m4_errprint({SMALLFONT}=  SMALLFONT
)
m4_errprint({TINYFONT}=   TINYFONT
)
m4_errprint({WINLISTFONT}=WINLISTFONT
)
