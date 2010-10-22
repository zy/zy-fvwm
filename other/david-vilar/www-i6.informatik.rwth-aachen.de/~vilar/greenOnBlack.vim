" Vim color file
" Maintainer:	David Vilar
" Last Change:	2007 June 11
" green on black

" started from "torte"

set background=dark
hi clear
if exists("syntax_on")
  syntax reset
endif
"colorscheme default
let g:colors_name = "greenOnBlack"

" GUI
highlight Normal       guifg=palegreen  guibg=Black
highlight Search       guifg=Black      guibg=Red       gui=bold
highlight Visual       guibg=#0000CD
highlight Cursor       guifg=Black      guibg=#FFA500	 gui=NONE
highlight Special      guifg=Orange
highlight Comment      guifg=#FF7F24
highlight Statement    guifg=#00FFFF		         gui=NONE
highlight Type	          			         gui=NONE
highlight CursorLine                    guibg=#1A1A1A
highlight Include      guifg=#B0C4DE
highlight String       guifg=#FFA07A
highlight Type         guifg=#00FFFF
highlight Pmenu        guifg=black      guibg=gray60
highlight PmenuSel     guifg=white      guibg=gray30
highlight Boolean      guifg=#7FFFD4
highlight StatusLine   guifg=#505B67    guibg=black
highlight StatusLineNC guifg=#505B67    guibg=black
highlight Folded       guifg=gray90     guibg=black         gui=bold
highlight helpNote     guifg=yellow
