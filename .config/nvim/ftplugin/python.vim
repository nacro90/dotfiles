set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

set number "Set line numbers
set showcmd "Show command in bottom bar
set cursorline "Underline current line
set foldenable "Enable folding
set foldmethod=indent "Setting folding method to indent
set autoindent

" Autofolding disabled by default
set foldlevel=99

" Widely used textwidth value for python. Black uses it too.
set textwidth=88

set nowrap

let python_highlight_all = 1

nnoremap <silent> <leader>l <Cmd>call orcan#python#AutoformatBlack()<CR>
" Discover and check the python tests
nnoremap <leader>t :w<bar>!python -m unittest discover<CR>
nnoremap <leader>r :w<bar>!python %<CR>

let b:python_version_2 = 0

let g:syntastic_python_checkers = ['python']

if executable('mypy')
    call add(g:syntastic_python_checkers, 'mypy')
endif

if executable('pyls')
    if exists('g:LanguageClient_serverCommands')
        let g:LanguageClient_serverCommands['python'] = ['pyls']
    else
        let g:LanguageClient_serverCommands = { 'python': ['pyls'] }
    endif
endif
