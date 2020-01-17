set tabstop=4 "Specifies length of TAB character
set softtabstop=4 "Specifies how many spaces is TAB
set expandtab "Tabs becomes spaces
set number "Set line numbers
set showcmd "Show command in bottom bar
set cursorline "Underline current line
filetype indent on
set foldenable "Enable folding
set foldmethod=indent "Setting folding method to indent
set autoindent

set wrap
set linebreak

let python_highlight_all = 1

" Reformat python file
nnoremap <leader>l :w<bar>!black %<CR>
" Discover and check the python tests
nnoremap <leader>t :w<bar>!python -m unittest discover<CR>
nnoremap <leader>r :w<bar>!python %<CR>

let b:python_version_2 = 0
let &syntax=&syntax

