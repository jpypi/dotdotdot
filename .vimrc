" Set up plug

call plug#begin('~/.vim/plugged')
Plug 'ntpeters/vim-better-whitespace'
Plug 'wting/rust.vim'
Plug 'tomasr/molokai'
Plug 'kien/ctrlp.vim'
Plug 'davidhalter/jedi-vim'
"Plug 'ervandrew/supertab'
Plug 'scrooloose/nerdtree'
Plug 'fatih/vim-go'
Plug 'tpope/vim-fugitive'
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
set smartcase  " intelligently search by case

" The 2 things below is not compatible with "incsearch"
" Check out https://github.com/haya14busa/incsearch.vim
" to fix this issue. (This is partially fixed, but could
" possibly be better fixed by this plugin.)
"set highlight=on

" Pls to highlight searchs ...But let me clear the highlights
" Highlight search results
set hlsearch
" Clear higlighting when pressing <return>
noremap <cr> :noh<cr>

" Y iz this not the default??
map Y y$

noremap 00 ^
noremap ^ 0

"setkey ctrl-space ctrl-p
"set \ esc

function! ExecutePython()
    " Change file type
    silent !chmod +x %
    " Run current buffer file
    !%:p
endfunction

" Nice "IDE-like build" shortcut
au FileType python noremap <c-b> :call ExecutePython()<cr>
au FileType ruby noremap <c-b> :!ruby %<cr>
au FileType r noremap <c-b> :!r --vanilla < %<cr>
au FileType c noremap <c-b> :!make<cr>
au FileType rust noremap <c-b> :!cargo build; cargo run<cr>
au FileType go noremap <c-b> :!go run %<cr>

au BufRead,BufNewFile *.pye set filetype=python
