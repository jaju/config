set wrap
filetype plugin on

" omnicppcomplete options
autocmd BufEnter,BufNewFile *.h,*.hpp,*.H,*.hh,*.c,*.cc,*.cpp,*.C,*.cxx,*.l,*.y map <C-x><C-x><C-T> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q -f ~/.vim/cpp.tags /usr/include/c++ /usr/local/include ~/local/include<CR><CR>
map <C-x><C-t> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR><CR>
set tags+=./tags

"-------------> programs and header files <-------------
autocmd BufEnter,BufNewFile *.h,*.hpp,*.H,*.hh,*.c,*.cc,*.cpp,*.C,*.cxx,*.l,*.y,*.java,*.ice set expandtab ai si cin formatoptions=croql tabstop=4
autocmd BufEnter,BufNewFile *.h,*.hpp,*.H,*.hh,*.c,*.cc,*.cpp,*.C,*.cxx,*.l,*.y map <F1> :!man -a <cword><CR><CR>
autocmd BufEnter,BufNewFile *.h,*.hpp,*.H,*.hh,*.c,*.cc,*.cpp,*.C,*.cxx*,.l,*.y map <F4> :!ctags -R --c++-kinds=+pcfmnt --fields=+iaSz --extra=+q .<CR>
autocmd BufEnter,BufNewFile *.h,*.hpp,*.H,*.hh,*.c,*.cc,*.cpp,*.C,*.cxx,*.l,*.y set tags+=$HOME/.vim/cpp.tags
autocmd BufEnter /usr/include/c++/** set syntax=cpp

autocmd BufEnter,BufNewFile,BufRead *.xml set expandtab ai tabstop=2
autocmd BufRead,BufNewFile *.cmake,CMakeLists.txt,*.cmake.in runtime! indent/cmake.vim
autocmd BufRead,BufNewFile *.cmake,CMakeLists.txt,*.cmake.in setf cmake
autocmd BufRead,BufNewFile *.ctest,*.ctest.in setf cmake

" The following depends on the a.vim plugin by Michael Sharpe <feline@irendi.com>
autocmd BufEnter,BufNewFile *.h,*.hpp,*.hh,*.H,*.c,*.cc,*.cpp,*.cxx,*.rb imap <C-A> <ESC>:A<CR>
autocmd BufEnter,BufNewFile *.h,*.hpp,*.hh,*.H,*.c,*.cc,*.cpp,*.cxx,*.rb map <C-A> :A<CR>

" The following depends on the taglist.vim plugin by Yegappan Lakshmanan
" (yegappan AT yahoo DOT com), from http://vim-taglist.sourceforge.net
autocmd BufRead,BufEnter *.h,*.hpp,*.hh,*.H,*.c,*.cc,*.cpp,*.C,*.l,*.y,*.java imap <C-O> <ESC>:TlistToggle<CR>
autocmd BufRead,BufEnter *.h,*.hpp,*.hh,*.H,*.c,*.cc,*.cpp,*.C,*.l,*.y,*.java map <C-O> :TlistToggle<CR>

autocmd BufEnter,BufRead,BufNewFile,BufNew *.rb,*.erb set keywordprg=ri
autocmd BufEnter,BufRead,BufNewFile,BufNew *.cc,*.cpp,*.c,*.C,*.cxx,*.h,*.H,*.hpp set keywordprg=man

autocmd BufRead,BufEnter *.py,*.rb,*.sh set shiftwidth=2 tabstop=2 softtabstop=2 expandtab
set wildchar=<Tab> wildmenu wildmode=full

au BufRead,BufNewFile COMMIT_EDITMSG setf git
abbrev rtag !ctags -R --Ruby-kinds=cfmF --language-force=ruby lib spec app ~/.gems/gems<CR>

" -- configs --
let OmniCpp_MayCompleteDot = 1 " autocomplete with .
let OmniCpp_MayCompleteArrow = 1 " autocomplete with ->
let OmniCpp_MayCompleteScope = 1 " autocomplete with ::
let OmniCpp_SelectFirstItem = 2 " select first item (but don't insert)
let OmniCpp_NamespaceSearch = 2 " search namespaces in this and included files
let OmniCpp_ShowPrototypeInAbbr = 1 " show function prototype (i.e. parameters) in popup window
let OmniCpp_LocalSearchDecl = 1 " don't require special style of function opening braces
