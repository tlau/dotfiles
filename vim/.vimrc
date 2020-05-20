" Jump to matching paren
set showmatch
" Don't create .bak file
set nobackup
set writebackup
set autowrite
" Don't wrap text
set textwidth=0
" Automatically indent new lines
set autoindent
" Tabwidth of 4
set tabstop=4
set shiftwidth=4
" Allow backspacing past the start of insert
set backspace=2
" Create a viminfo file (storing searches, marks, etc.) for last 50 files
" '50 - remember marks for up to 50 previously edited files
" %   - save and restore the buffer list
" :50 - save up to 50 lines of command-line history
" /50 - save 50 searches
set viminfo='50,%,:50,"100,/50
" Always display status bar
set laststatus=2
" Enable modelines
set modeline

" Typos, misspellings, and shortcuts
iab teh the
iab becasue because
iab equilavent equivalent
iab peolpe people
iab searh search

" Emacs-style cmdline editing keys
cnoremap <C-A> <Home>
cnoremap <C-F> <Right>
cnoremap <C-B> <Left>
cnoremap <Esc>b <S-Left>
cnoremap <Esc>f <S-Right>
cnoremap <C-P> <Up>
cnoremap <C-N> <Down>

" Turn syntax highlighting on
if &term =~ "vt100" || &term =~ "xterm" || &term =~ "screen"
	syntax on
endif

" Turn file typing on
filetype on

