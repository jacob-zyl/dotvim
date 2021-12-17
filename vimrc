"#######################################
" Pathogen configuratins
"#######################################
"" This should the first lines of .vimrc
"{{{
runtime bundle/pathogen/autoload/pathogen.vim
call pathogen#infect()
set sessionoptions-=options
"" End of Pathogen configurations
"}}}
""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""

"#######################################
" Root of all configurations
"#######################################
"{{{
set nocompatible
let mapleader = ','
filetype plugin indent on
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END
runtime macros/matchit.vim
"}}}
""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""

"#######################################
" Grammar of Key Bindings
"#######################################

"" <Leader>v means vimrc file related.
"" <Leader>c means NERDCommenter related.
"" <Leader>t means NeERDTree related.
"{{{
"" Edit vim configuration file
nnoremap <Leader>ve :e $MYVIMRC<CR>
"" Reload vimr configuration file
nnoremap <Leader>vr :source $MYVIMRC<CR>
"" Save my right pinky
nnoremap <Leader><Leader> :
"nnoremap : <nop>

"" Some useful mapping
noremap <F3> :ls<cr>:e #
noremap <F8> :!python %
"" Set <F2> to toggle line numbers on/off
noremap <F2> :set nonumber!<CR>:set foldcolumn=0<CR>
"" set ; commands as subs and more
noremap ;; :%s:::<Left><Left>
noremap ;g :g::<Left>

"" Home-made keymaps
nnoremap Q !!$SHELL<CR>
"}}}
""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""

"#######################################
" Basics
"#######################################
"{{{
"" Searching
set path+=**    	" so that :find and :b work like charms
set showcmd	    	" Show (partial) command in status line.
set showmatch		" Show matching brackets.
set ignorecase		" Do case insensitive matching
set smartcase		" Do smart case matching
"set incsearch		" Incremental search (this is already on by default)
set nohls   		" no highlight search
set wildmenu
set wildmode=longest:full,full

"" Appearance
"" aw = autowrite
set aw	        	" Automatically save before :next and :make
set hidden         	" Hide buffers when they are abandoned
set mouse=a
set number
set modeline
set background=dark
set colorcolumn=80
colorscheme dracula
set textwidth=78
set shiftwidth=4
set tabstop=4
set smartindent
set conceallevel=1
set culopt=both
autocmd InsertEnter * set cul
autocmd InsertLeave * set nocul
set guifont=Source\ Code\ Pro\ 16

"" Fold
set foldmethod=syntax
set foldlevelstart=10
"set foldcolumn=6

"" Syntax
syntax on

"" Encoding and Format
set fileformat=unix
set encoding=utf-8
set fileencoding=utf-8
"}}}
""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""

"#######################################
" Chinese configuration
"#######################################
"{{{
set fileencodings=uft8,gb18030,ucs-bom,default

"" Let Vim do not need a space to create 
"" new line when Unicode is larger than 255
set formatoptions+=m 
"" Do not add a space when emerge two lines of Chinese
set formatoptions+=B 
"}}}
""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""

"#######################################
" Python and Haskell
"#######################################
"{{{
"" ts = tabstop, the spaces occupied by a TAB
"" sts = softtabstop
"" sw = shiftwidth, the spaces of each level of indent
"" et = expandtab
"" st = smarttab
"" fdm = foldmethod

augroup filetype_python
    autocmd!
    autocmd FileType python setlocal et st sw=4 sts=4 fdm=indent
    autocmd BufNewFile,BufRead *.sage	setf python
augroup END

augroup filetype_haskell
    autocmd!
    autocmd FileType haskell setlocal et st sw=4 sts=4 fdm=indent
augroup END
"}}}
""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""

"#######################################
" LaTeX and vimtex
"#######################################
"{{{
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
let g:tex_conceal='abmg'
augroup filetype_tex
    autocmd!
    autocmd BufNewFile,BufRead *.Rtex setf tex
augroup END
"}}}
""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""

"#######################################
" Fortran configuration
"#######################################
"{{{
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
"}}}
""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""

"#######################################
" Ctags configuration
"#######################################
"{{{
set tags=tags;/
"}}}
""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""

"#######################################
" Markdown configuration
"#######################################
"{{{
let g:vim_markdown_math = 1
let g:vim_markdown_frontmatter = 1
"}}}
""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""

"#######################################
" Syntastic Configuration
"#######################################
"{{{
autocmd VimEnter * SyntasticToggleMode
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1
"}}}
""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""

"#######################################
" UltiSnips and YCM Configurations
"#######################################
"{{{
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<S-tab>'

let g:ycm_key_list_select_completion=[]
let g:ycm_key_list_previous_completion=[]
"}}}
""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""

"#######################################
" Julia Configuration
"#######################################
"{{{
let g:latex_to_unicode_auto = 1
hi link juliaParDelim Delimiter
hi link juliaSemicolon Operator
"hi link juliaComma Comma
hi link juliaFunctionCall Identifier
"}}}
""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""

"#######################################
" NERDTree Configuration
"#######################################
"{{{
nnoremap <Leader>t<space> :NERDTreeToggle<CR>
nnoremap <Leader>tt :NERDTree<CR>
"}}}
""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""
