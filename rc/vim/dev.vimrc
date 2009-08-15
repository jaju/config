" Ravindra Jaju
"
"set columns=100
set wrap

"-------------> programs and header files <-------------
autocmd BufRead * set formatoptions=tcql nocindent comments&
autocmd BufEnter,BufRead *vimrc iab exts *.h,*.hpp,*.H,*.c,*.cc,*.cpp,*.cxx,*.C,*.l,*.y
:autocmd BufEnter *.h,*.hpp,*.H,*.c,*.cc,*.cpp,*.C,*.cxx,*.l,*.y,*.java,*.ice set expandtab ai si cin formatoptions=croql
autocmd BufNewFile *.h,*.hpp,*.H,*.c,*.cc,*.cpp,*.C,*.cxx,*.l,*.y,*.java set tabstop=4 columns=100
autocmd BufLeave *.h,*.hpp,*.H,*.c,*.cc,*.cpp,*.C,*.cxx,*.l,*.y,*.java set nosi nocin formatoptions=tcql
autocmd BufEnter *.h,*.hpp,*.H,*.c,*.cc,*.cpp,*.C,*.cxx,*.l,*.y,*.java set comments=sr:/*,mb:*,el:*/,://
autocmd BufLeave *.h,*.hpp,*.H,*.c,*.cc,*.cpp,*.C,*.cxx,*.l,*.y,*.java set comments=sr:/*,mb:*,el:*/,://,b:#,:%,:XCOMM,n:>,fb:-
autocmd BufEnter *.h,*.hpp,*.H,*.c,*.cc,*.cpp,*.C,*.cxx,*.l,*.y map <F1> :!man -a <cword><CR><CR>
autocmd BufEnter *.h,*.hpp,*.H,*.c,*.cc,*.cpp,*.C,*.cxx,*.l,*.y map <F2> mpI/* <ESC>A */<ESC>`pj
autocmd BufEnter *.h,*.hpp,*.H,*.c,*.cc,*.cpp,*.C,*.cxx,*.l,*.y map <F3> mp^3x$xxx`pj
autocmd BufEnter *.java                   map <F2> mpI//<ESC>`pj
autocmd BufEnter *.java                   map <F3> mp^2x`pj
autocmd BufEnter *.h,*.hpp,*.H,*.c,*.cc,*.cpp,*.C,*.cxx*,.l,*.y map <F4> :!ctags -R --c++-kinds=+pcfmnt --fields=+iaSz --extra=+q .<CR>
autocmd BufEnter *.h,*.hpp,*.H,*.c,*.cc,*.cpp,*.C,*.cxx,*.l,*.y set tags+=$HOME/.vim/cpp.tags
autocmd BufLeave *.h,*.hpp,*.H,*.c,*.cc,*.cpp,*.C,*.cxx,*.l,*.y unmap <F1>
autocmd BufLeave *.h,*.hpp,*.H,*.c,*.cc,*.cpp,*.C,*.cxx,*.l,*.y,*.java unmap <F2>
autocmd BufLeave *.h,*.hpp,*.H,*.c,*.cc,*.cpp,*.C,*.cxx,*.l,*.y,*.java unmap <F3>
autocmd BufLeave *.h,*.hpp,*.H,*.c,*.cc,*.cpp,*.C,*.cxx,*.l,*.y unmap <F4>

autocmd BufEnter /usr/include/c++/** set syntax=cpp

autocmd BufRead,BufNewFile *.cmake,CMakeLists.txt,*.cmake.in runtime! indent/cmake.vim 
autocmd BufRead,BufNewFile *.cmake,CMakeLists.txt,*.cmake.in setf cmake
autocmd BufRead,BufNewFile *.ctest,*.ctest.in setf cmake

filetype plugin on
"map <F4> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>

" ---------------------------------------------------------------------------------

" The following depends on the a.vim plugin by Michael Sharpe <feline@irendi.com>
"
imap <C-A> <ESC>:A<CR>
map <C-A> :A<CR>

" The following depends on the taglist.vim plugin by Yegappan Lakshmanan
" (yegappan AT yahoo DOT com), from http://vim-taglist.sourceforge.net
autocmd BufRead,BufEnter *.h,*.hpp,*.H,*.c,*.cc,*.cpp,*.C,*.l,*.y,*.java imap <C-O> <ESC>:TlistToggle<CR>
autocmd BufRead,BufEnter *.h,*.hpp,*.H,*.c,*.cc,*.cpp,*.C,*.l,*.y,*.java map <C-O> :TlistToggle<CR>

autocmd BufEnter,BufRead,BufNewFile,BufNew *.rb,*.erb set keywordprg=ri
autocmd BufEnter,BufRead,BufNewFile,BufNew *.cc,*.cpp,*.c,*.C,*.cxx,*.h,*.H,*.hpp set keywordprg=man

autocmd BufRead,BufEnter *.py,*.rb set shiftwidth=2 tabstop=2 softtabstop=2 expandtab
set wildchar=<Tab> wildmenu wildmode=full

" Buffers - explore/next/previous: Alt-F12, F12, Shift-F12.
nnoremap <Silent> <M-F12> :BufExplorer<CR>
nnoremap <Silent> <F12> :bn<CR>
nnoremap <Silent> <S-F12> :bp<CR>
set grepprg=ack
set grepformat=%f:%l:%m
au BufRead,BufNewFile COMMIT_EDITMSG setf git
