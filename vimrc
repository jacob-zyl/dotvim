" Pathogen configuratins
" This should the first lines of .vimrc
runtime bundle/pathogen/autoload/pathogen.vim
call pathogen#infect()
set sessionoptions-=options
" End of Pathogen configurations

" Root of all configurations
set nocompatible
let mapleader = ','
filetype plugin indent on

" Edit vimr configuration file
nnoremap <Leader>ve :e $MYVIMRC<CR>
" Reload vimr configuration file
nnoremap <Leader>vr :source $MYVIMRC<CR>
" Save my right pinky
nnoremap <Leader><Leader> :

" Some useful mapping
map <F3> :ls<cr>:e #
map <F8> :!python %
" Set <F2> to toggle line numbers on/off
map <F2> :set nonumber!<CR>:set foldcolumn=0<CR>
map ;; :%s:::<Left><Left>
map ;g :g::<Left>

" Basics

"" about searching
set path+=**
set showcmd		" Show (partial) command in status line.
set showmatch		" Show matching brackets.

set ignorecase		" Do case insensitive matching
set smartcase		" Do smart case matching
"set incsearch		" Incremental search (this is already on by default)
set nohls		" no highlight search

"" Appearance
set autowrite		" Automatically save before commands like :next and :make
set hidden          	" Hide buffers when they are abandoned
set mouse=a
set number
set modeline
set background=dark
"set colorcolumn=82
colorscheme gruvbox
set textwidth=78
set shiftwidth=4
set smartindent
set conceallevel=1

"" Syntax
syntax on
set fileformat=unix

" Chinese configuration
set encoding=utf8
set fileencoding=utf8
"set fileencodings=gb18030,ucs-bom,uft-8,default
"" Let Vim do not need a space to create new line when Unicode is larger than 255
set formatoptions+=m 
set formatoptions+=B " Do not add a space when emerge two lines of Chinese

"" Some global configuration on fold
set foldmethod=syntax
set foldlevelstart=10
"set foldcolumn=6


"" Home-made keymaps
nmap Q !!$SHELL<CR>

"" Some settings on Python and Haskell
"" ts = tabstop, the spaces occupied by a TAB
"" sw = shiftwidth, the spaces of each level of indent
"" et = expandtab
augroup filetype_python
    autocmd!
    autocmd FileType python setlocal expandtab smarttab shiftwidth=4 softtabstop=4 foldmethod=indent
    autocmd BufNewFile,BufRead *.sage	setf python
augroup END

augroup filetype_haskell
    autocmd!
    autocmd FileType haskell setlocal expandtab smarttab shiftwidth=4 softtabstop=4 foldmethod=indent
augroup END

"" LaTeX and vimtex
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
let g:tex_conceal='abmg'
augroup filetype_tex
    autocmd!
    autocmd BufNewFile,BufRead *.Rtex	setf tex
augroup END

"" The PDF document should be opened with
"#!/bin/sh
"echo $1
"zathura -s -x "gvim --servername $1 -c \"let g:syncpdf='$1'\" --remote +%{line} %{input}" $*
"" Given such function, synctex is able to be achieved:
"function! Synctex()
    "" remove 'silent' for debugging
    "execute "silent !zathura --synctex-forward " . line('.') . ":" . col('.') . ":" . bufname('%') . " " . g:syncpdf
"endfunction
"map <C-enter> :call Synctex()<cr>


" Some Fortran configuration
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
    autocmd FileType Fortran let b:fortran_fold=1
    autocmd FileType Fortran setlocal expandtab
augroup END

" Ctags configuration
set tags=tags;/

" Markdown configuration
let g:vim_markdown_math = 1

" Syntastic Configuration
autocmd VimEnter * SyntasticToggleMode
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1

" UltiSnips Configurations
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<S-tab>'

let g:ycm_key_list_select_completion=[]
let g:ycm_key_list_previous_completion=[]

" Julia Configuration
let g:latex_to_unicode_auto = 1


