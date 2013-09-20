" Vim syntax file
" Language:	My personal notes
" Maintainer:	Tessa Lau <tlau@cs.washington.edu>
" Last change:	1998 Mar 12

" Remove any old syntax stuff hanging around
syn clear

syn match   noteComment		"#.*$" contains=noteTodo
syn keyword noteTodo		contained TODO

if !exists("did_note_syntax_inits")
  let did_note_syntax_inits = 1
  " The default methods for highlighting.  Can be overridden later
  hi link noteComment			Comment
  hi link noteTodo			Todo
endif

let b:current_syntax = "note"

" vim: ts=8
