syntax on

set smartindent
"Sets the number of columns a "tab" takes up
set tabstop=4
"The width used with the "indent" keys/commands
set shiftwidth=4
"Expands tab charaters to spaces
set expandtab
"This makes backspace remove N spaces
set softtabstop=4

"
set backspace=2

set relativenumber
set number

map Y y$

"setkey ctrl-space ctrl-p
"set \ esc

au FileType python noremap <c-r> :!python %<cr>
au FileType ruby noremap <c-r> :!ruby %<cr>
au FileType r noremap <c-r> :!r --vanilla < %<cr>
au FileType c noremap <c-r> :!make<cr>
au FileType rust noremap <c-r> :!cargo run<cr>

au BufRead,BufNewFile *.pye set filetype=python


call plug#begin('~/.vim/plugged')
Plug 'ntpeters/vim-better-whitespace'
Plug 'wting/rust.vim'
Plug 'tomasr/molokai'
Plug 'kien/ctrlp.vim'
call plug#end()

color molokai
