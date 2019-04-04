" Pathogen configuratins
runtime bundle/vim-pathogen/autoload/pathogen.vim
call pathogen#infect()
set sessionoptions-=options

" Set compatible
set nocp
"set nospell
set shell=/usr/bin/sh

syntax on
set showcmd		" Show (partial) command in status line.
set showmatch		" Show matching brackets.

" This line is added some time I forget, to be studied.
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

"" Basics
filetype plugin indent on
set ignorecase		" Do case insensitive matching
set smartcase		" Do smart case matching
"set incsearch		" Incremental search
set autowrite		" Automatically save before commands like :next and :make
set hidden          " Hide buffers when they are abandoned
set mouse=""
set number
set modeline
set background=dark
colorscheme gruvbox

set tw=80
set shiftwidth=4

set fileformat=unix

" Chinese configuration
set encoding=utf8
set fileencoding=utf8
"set fileencodings=gb18030,ucs-bom,uft-8,default
set formatoptions+=m " Let Vim do not need a space to create new line when Unicode is larger than 255
set formatoptions+=B " Do not add a space when emerge two lines of Chinese

"" Some global configuration on fold
set foldmethod=syntax
set foldlevelstart=10
"set foldcolumn=6

"" Some settings on Python
" ts = tabstop, the spaces occupied by a TAB
" sw = shiftwidth, the spaces of each level of indent
" et = expandtab
set smartindent
augroup filetype_python
    autocmd!
    autocmd FileType python setlocal expandtab smarttab shiftwidth=4 softtabstop=4 foldmethod=indent
    autocmd BufNewFile,BufRead *.sage	setf python
augroup END

"" LaTeX and vimtex
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
set conceallevel=1
let g:tex_conceal='abdmg'
augroup filetype_tex
    autocmd!
    autocmd BufNewFile,BufRead *.Rtex	setf tex
augroup END


""%%% Some Fortran configuration %%%
"let fortran_more_precise=1
"let fortran_do_enddo=1
"let fortran_free_source=1
"let fortran_have_tabs=1
"let fortran_fold_conditonals=1
"let fortran_fold_multilinecomments=1
let fortran_fold=1
augroup filetype_fortran
    autocmd!
    autocmd BufRead,BufNewFile *.f08 setf Fortran
    autocmd BufRead,BufNewFile *.f03 setf Fortran
    autocmd BufRead,BufNewFile *.f95 setf Fortran
    autocmd BufRead,BufNewFile *.f90 setf Fortran
    autocmd FileType Fortran let b:fortran_do_enddo=1
    autocmd FileType Fortran let b:fortran_free_source=1
    autocmd FileType Fortran let b:fortran_have_tabs=1
    autocmd FileType Fortran let b:fortran_more_precise=1
    autocmd FileType Fortran setlocal expandtab
augroup END

" Ctags configuration
set tags=tags;/

" Markdown configuration
let g:vim_markdown_math = 1

" Some useful mapping
map <F6> :tabp<cr>
map <F7> :tabn<cr>
map <F3> :ls<cr>:e #
"nmap <F9> :%s/\(\_.*\)\n^,\n\(\_.*\)\n^,\n\(\_.*\)\n^,\n\_.*\n^,\n.*/\2/<CR>
map <F8> :!python %
" Set <F2> to toggle line numbers on/off
nnoremap <F2> :set nonumber!<CR>:set foldcolumn=0<CR>

"" Syntastic Configuration
"autocmd VimEnter * SyntasticToggleMode
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

"" Powerline things.
"python3 from powerline.vim import setup as powerline_setup
"python3 powerline_setup()
"python3 del powerline_setup

"" UltiSnips Configurations
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'

snippet sign "Signature"
Yours sincerely,
Zeyu Liu
endsnippet

snippet today "Date"
`date +%F`
endsnippet

snippet box "Box"
`!p snip.rv = '┌' + '─' * (len(t[1]) + 2) + '┐'`
│ $1 │
`!p snip.rv = '└' + '─' * (len(t[1]) + 2) + '┘'`
$0
endsnippet

snippet beg "begin{} / end{}" bA
\begin{$1}
	$0
\end{$1}
endsnippet

snippet mk "Math" wA
$${1}$`!p
if t[2] and t[2][0] not in [',', '.', '?', '-', ' ']:
    snip.rv = ' '
else:
    snip.rv = ''
`$2
endsnippet

snippet '([A-Za-z])(\d)' "auto subscript" wrA
`!p snip.rv = match.group(1)`_`!p snip.rv = match.group(2)`
endsnippet

snippet '([A-Za-z])_(\d\d)' "auto subscript2" wrA
`!p snip.rv = match.group(1)`_{`!p snip.rv = match.group(2)`}
endsnippet

snippet sr "^2" iA
^2
endsnippet

snippet cb "^3" iA
^3
endsnippet

snippet compl "complement" iA
^{c}
endsnippet

snippet td "superscript" iA
^{$1}$0
endsnippet

snippet // "Fraction" iA
\\frac{$1}{$2}$0
endsnippet

snippet '((\d+)|(\d*)(\\)?([A-Za-z]+)((\^|_)(\{\d+\}|\d))*)/' "Fraction" wrA
\\frac{`!p snip.rv = match.group(1)`}{$1}$0
endsnippet

priority 1000
snippet '^.*\)/' "() Fraction" wrA
`!p
stripped = match.string[:-1]
depth = 0
i = len(stripped) - 1
while True:
	if stripped[i] == ')': depth += 1
	if stripped[i] == '(': depth -= 1
	if depth == 0: break;
	i -= 1
snip.rv = stripped[0:i] + "\\frac{" + stripped[i+1:-1] + "}"
`{$1}$0
endsnippet

snippet / "Fraction" iA
\\frac{${VISUAL}}{$1}$0
endsnippet

snippet sympy "sympy block " w
sympy $1 sympy$0
endsnippet

priority 10000
snippet 'sympy(.*)sympy' "evaluate sympy" wr
`!p
from sympy import *
x, y, z, t = symbols('x y z t')
k, m, n = symbols('k m n', integer=True)
f, g, h = symbols('f g h', cls=Function)
init_printing()
snip.rv = eval('latex(' + match.group(1).replace('\\', '') \
    .replace('^', '**') \
    .replace('{', '(') \
    .replace('}', ')') + ')')
`
endsnippet

