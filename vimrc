" Pathogen configuratins
runtime bundle/vim-pathogen/autoload/pathogen.vim
call pathogen#infect()
set sessionoptions-=options

" Set compatible
set nocp
set nospell

syntax on
set showcmd		    " Show (partial) command in status line.
set showmatch		" Show matching brackets.

" This line is added some time I forget, to be studied.
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

filetype plugin indent on
set ignorecase		" Do case insensitive matching
set smartcase		" Do smart case matching
set incsearch		" Incremental search
set autowrite		" Automatically save before commands like :next and :make
set hidden          " Hide buffers when they are abandoned
set mouse=a         " Enable mouse usage (all modes)
set ruler
set number
set modeline
set background=light
colorscheme desert

set tw=80
set shiftwidth=4

" Chinese configuration
set encoding=utf8
set fileencoding=utf8
"set fileencodings=gb18030,ucs-bom,uft-8,default
set formatoptions+=m " Let Vim do not need a space to create new line when Unicode is larger than 255
set formatoptions+=B " Do not add a space when emerge two lines of Chinese

""%%% Some global configuration on fold %%%
let fortran_fold=1
let C_fold=1
" let g:tex_fold_enable=1
set foldmethod=syntax
set foldlevelstart=10
"set foldcolumn=6

""%%% Some settings on Python %%%
" ts = tabstop, the spaces occupied by a TAB
" sw = shiftwidth, the spaces of each level of indent
" et = expandtab
set smartindent
au FileType python setlocal expandtab sta shiftwidth=4 softtabstop=4 foldmethod=indent
au BufNewFile,BufRead *.sage	setf python

""%%% correct latex syntax highlight %%%
let g:tex_flavor='latex'
au BufNewFile,BufRead *.Rtex	setf tex

""%%% LaTeX Suite configurations %%%
set grepprg=grep\ -nH\ $*

""%%% Some Fortran configuration %%%
"let fortran_more_precise=1
"let fortran_do_enddo=1
"let fortran_free_source=1
"let fortran_have_tabs=1
"let fortran_fold_conditonals=1
"let fortran_fold_multilinecomments=1
au! BufRead,BufNewFile *.f08 let b:fortran_do_enddo=1
au! BufRead,BufNewFile *.f08 let b:fortran_free_source=1
au! BufRead,BufNewFile *.f08 let b:fortran_have_tabs=1
au! BufRead,BufNewFile *.f03 let b:fortran_do_enddo=1
au! BufRead,BufNewFile *.f03 let b:fortran_free_source=1
au! BufRead,BufNewFile *.f03 let b:fortran_have_tabs=1
au! BufRead,BufNewFile *.f95 let b:fortran_do_enddo=1
au! BufRead,BufNewFile *.f95 let b:fortran_free_source=1
au! BufRead,BufNewFile *.f95 let b:fortran_have_tabs=1
au! BufRead,BufNewFile *.f90 let b:fortran_do_enddo=1
au! BufRead,BufNewFile *.f90 let b:fortran_free_source=1
au! BufRead,BufNewFile *.f90 let b:fortran_have_tabs=1

" Airline theme
let g:airline_theme='tomorrow'

" Ctags configuration
set tags=tags;/

" Some useful mapping
map <F6> :tabp<cr>
map <F7> :tabn<cr>
map <F3> :ls<cr>:e #
"nmap <F9> :%s/\(\_.*\)\n^,\n\(\_.*\)\n^,\n\(\_.*\)\n^,\n\_.*\n^,\n.*/\2/<CR>
map <F8> :!python %
" Set <F2> to toggle line numbers on/off
nnoremap <F2> :set nonumber!<CR>:set foldcolumn=0<CR>

au VimEnter * vsplit

