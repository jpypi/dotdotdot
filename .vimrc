" Set up plug

call plug#begin('~/.vim/plugged')
Plug 'ntpeters/vim-better-whitespace'
Plug 'wting/rust.vim'
Plug 'tomasr/molokai'
Plug 'kien/ctrlp.vim'
Plug 'davidhalter/jedi-vim'
"Plug 'ervandrew/supertab'
Plug 'scrooloose/nerdtree'
call plug#end()


syntax on
color molokai
set colorcolumn=81

set smartindent
"Sets the number of columns a "tab" takes up
set tabstop=4
"The width used with the "indent" keys/commands
set shiftwidth=4
"Expands tab charaters to spaces
set expandtab
"This makes backspace remove N spaces
set softtabstop=4

" Removes "tabs" (spaces) correctly
set backspace=2

" Set up fancy numbering
set number
set relativenumber

" Super awesome search (Stole this from stringy; Thanks!)
set incsearch
set ignorecase
set smartcase " intelligently go by case

" The 2 things below is not compatible with "incsearch"
" Check out https://github.com/haya14busa/incsearch.vim
" to fix this issue
" Pls to highlight searchs ...But let me clear the highlights
"set highlight=on
"nnoremap <esc> :noh<return><esc>

" Y iz this not the default??
map Y y$

"setkey ctrl-space ctrl-p
"set \ esc

" Nice "IDE-like build" shortcut
au FileType python noremap <c-b> :!python %<cr>
au FileType ruby noremap <c-b> :!ruby %<cr>
au FileType r noremap <c-b> :!r --vanilla < %<cr>
au FileType c noremap <c-b> :!make<cr>
au FileType rust noremap <c-b> :!cargo build; cargo run<cr>
au FileType go noremap <c-b> :!go run %<cr>

au BufRead,BufNewFile *.pye set filetype=python


