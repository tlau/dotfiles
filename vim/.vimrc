" Jump to matching paren
set showmatch
" Don't create .bak file
set nobackup
set writebackup
set autowrite
" Don't wrap text
set textwidth=0
" Error format for gcc in quickfix mode
set errorformat=%f:%l:\ %m
" Automatically indent new lines
set autoindent
" Tabwidth of 5
set tabstop=5
set shiftwidth=5
" Use the exrc file (security hole!) --- used for lout exrc's, I believe
" set exrc
" Put filename into windowmanager icon
set icon
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
" Try to disable annoying screen clearing at exit
set t_ti=
set t_te=
" Ignore TeX .aux files, don't ignore header files
set suffixes=.bak,~,.o,.info,.swp,.aux
" Turn on incsearch
set incsearch
" Turn on search highlighting
set hlsearch
" Make the K command do a dictionary lookup
set keywordprg=dict
" Enable modelines
set modeline

" Typos, misspellings, and shortcuts
iab teh the
iab becasue because
iab equilavent equivalent
iab peolpe people
"iab myurl http://www.cs.washington.edu/homes/tlau
"iab myaddr tlau@cs.washington.edu
iab searh search

" Macro for formatting reply text
map  }mz'':.,'z-1s/^/> /
" Retain Q for formatting hotkey
nnoremap Q gq
" Retain Q for formatting hotkey
vnoremap Q gq
" Emacs-style cmdline editing keys
cnoremap <C-A> <Home>
cnoremap <C-F> <Right>
cnoremap <C-B> <Left>
cnoremap <Esc>b <S-Left>
cnoremap <Esc>f <S-Right>
cnoremap <C-P> <Up>
cnoremap <C-N> <Down>
" Load selected URL into netscape with Alt-l
map <M-l> y:!netscape -remote 'openURL(<C-R>")'<CR>
" Go to head or tail of document
map <C-PageDown> G
map <C-PageUp> 1G

" Python initialization
"if has("python")
"    python import vim
"    python import sys
"    python sys.path.insert(0, '/homes/gws/tlau/.vim')
"endif

map <F4> :make
map <F1> :bp
map <F2> :bn
map <F5> :cp
map <F6> :cn

" Autocommands
" First remove existing autocmds
autocmd!

" For C files
autocmd bufenter              *.c,*.h,*.cc,*.C   set cin et tw=0
autocmd bufenter              *.c,*.h,*.cc,*.C   map <F3> 0i/* ^[A */^[
autocmd bufleave              *.c,*.h,*.cc,*.C   set nocin noet tw=75
autocmd bufleave              *.c,*.h,*.cc,*.C   unmap <F3>

" For mail files
"autocmd bufenter               */Mail/drafts/*    so ~/.vim/mail-enter.vim
"autocmd bufleave               */Mail/drafts/*    so ~/.vim/mail-leave.vim
"autocmd bufenter               */Mail/drafts/*    set dict=/usr/dict/words
"autocmd bufenter               */Mail/drafts/*    set ts=8 sw=8 tw=70
"autocmd bufleave               */Mail/drafts/*    set dict=
"autocmd bufleave               */Mail/drafts/*    set ts=5 sw=5 tw=75

" New python file
autocmd bufnewfile			*.py	0r ~/.vim/template.py
" Python settings
autocmd FileType python       set si
autocmd FileType python       inoremap # X#
autocmd FileType python       set cinwords=for,def,class,while,if,else,elif,try,except
autocmd FileType python       set sw=4 ts=4 sts=4 et

"autocmd FileType python       set nosi
"autocmd FileType python       iunmap #
"autocmd FileType python       set cinwords&
"autocmd FileType python       set sw=8 ts=8

" Editing HTML
autocmd bufnewfile 			*.html    	0r ~/.vim/template.html
autocmd FileType html    	so ~/.vim/vi-mode-html
autocmd bufenter                *.html      set sw=2 ts=2 et
autocmd bufenter                *.css       set sw=2 ts=2 et
" This doesn't work yet
" autocmd BufWritePre,FileWritePre *.html		ms:1,20g/Last modification: /|normal f:lD:read !date^M:normal kJ

" Editing LaTeX
autocmd bufnewfile			*.tex		0r ~/.vim/template.tex

" SWIG interface files
"au BufNewFile,BufRead *.i                     so $VIM/syntax/c.vim
"au BufNewFile,BufRead py*                     so $VIM/syntax/python.vim

" .scwmrc
"au BufNewFile,BufRead .scwmrc                     so $VIM/syntax/lisp.vim

" Editing javascript
autocmd bufenter			*.js		set ts=8 sts=2 sw=2 et

if &term =~ "vt100" || &term =~ "xterm" || &term =~ "screen"
	if has("terminfo")
       set t_Co=8
       set t_Sf=[1;3%p1%dm
       set t_Sb=[4%p1%dm
	  set t_AF=[1;3%p1%dm
       set t_AB=[4%p1%dm
     else
       set t_Co=8
       set t_Sf=[1;3%dm
       set t_Sb=[4%dm
       set t_AF=[1;3%dm
       set t_AB=[4%dm
     endif
endif

" Turn syntax highlighting on
if &term =~ "vt100" || &term =~ "xterm" || &term =~ "screen"
	syntax on
endif

" Turn file typing on
filetype on

" SMARTedit
"function! SMARTedit()
"	write
"	execute "!smartedit" "-l" line(".") "%"
"	edit
"endfunction
"cnoremap SM call SMARTedit()

"function! MakeSMARTeditTask() range
"	let filename = "/projects/ai4/smartedit/scenarios/dogfood/" . input("Enter a filename for this task: ")
"	while filereadable(filename)
"		let filename = "/projects/ai4/smartedit/scenarios/dogfood/" . input("That file exists; enter a new filename: ")
"	endwhile
"
"	execute a:firstline . "," . a:lastline . "y"
"	execute "new " . filename
"     0read /homes/gws/tlau/.vim/smartedit-task.txt
"	normal Gp7G
"	startinsert
"endfunction
"
"
imap  :wa
map <F1> <Esc>
set path=.,,**

" To work more easily with wrapped lines
noremap <buffer> <silent> k gk
noremap <buffer> <silent> j gj
noremap <buffer> <silent> 0 g0
noremap <buffer> <silent> $ g$

