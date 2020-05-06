set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

set number "Set line numbers
set showcmd "Show command in bottom bar
set cursorline "Underline current line
set foldenable "Enable folding
" set foldmethod=indent "Setting folding method to indent
set autoindent

set iskeyword+=_

" Autofolding disabled by default
set foldlevel=99

" Widely used textwidth value for python. Black uses it too.
" It becomes annoying
" set textwidth=88

set nowrap

nnoremap <silent> <leader>l <Cmd>call orcan#python#AutoformatBlack()<CR>
nnoremap <leader>sr :w<bar>!python %<CR>

let b:python_version_2 = 0

" {{{ Syntastic python checkers
let g:syntastic_python_checkers = ['python']
if executable('mypy')
    call add(g:syntastic_python_checkers, 'mypy')
endif
if executable('flake8')
    call add(g:syntastic_python_checkers, 'flake8')
else
    if executable('pyflakes')
        call add(g:syntastic_python_checkers, 'pyflakes')
    endif
    if executable('pycodestyle')
        call add(g:syntastic_python_checkers, 'pycodestyle')
    endif
endif
" }}}

if executable('pyls')
    if exists('g:LanguageClient_serverCommands')
        let g:LanguageClient_serverCommands['python'] = ['pyls']
    else
        let g:LanguageClient_serverCommands = { 'python': ['pyls'] }
    endif
endif
