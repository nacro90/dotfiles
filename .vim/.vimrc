call plug#begin('~/.local/share/nvim/plugged/')

Plug 'chriskempson/base16-vim'

" Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'

Plug 'junegunn/goyo.vim'

Plug 'mboughaba/i3config.vim'

Plug 'itchyny/lightline.vim'

Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'

Plug 'freitass/todo.txt-vim'


Plug 'airblade/vim-gitgutter'

Plug 'nathanaelkane/vim-indent-guides'

Plug 'plasticboy/vim-markdown'

Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'

Plug 'tpope/vim-surround'

Plug 'cespare/vim-toml'

Plug 'ycm-core/YouCompleteMe'

Plug 'starcraftman/vim-eclim'

Plug 'tomasr/molokai'
Plug 'flazz/vim-colorschemes'

Plug 'terryma/vim-multiple-cursors'

Plug 'tpope/vim-speeddating'

Plug 'tpope/vim-repeat'

Plug 'majutsushi/tagbar'

Plug 'scrooloose/nerdcommenter'

call plug#end()

set nocompatible
syntax on
filetype plugin indent on


" execute pathogen#infect()
" set rtp+=~/.fzf

" set clipboard=unnamed

" let g:solarized_termtrans=1
" let g:solarized_termcolors=16
" let g:solarized_visibility="low"
" set t_Co=256
set termguicolors "Enable 24 bit color support
let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
set background=dark
colorscheme base16-tomorrow-night

highlight Normal ctermbg=NONE guibg=NONE
highlight NonText ctermbg=NONE guibg=NONE


hi MatchParen ctermbg=black ctermfg=white

"let mapleader = ","
nmap <F3> :NERDTreeToggle<CR>
nmap <leader>ve :e ~/.vimrc<CR>
nmap <leader>vr :source ~/.vimrc<CR>
nmap <c-p> :Buffers<CR>
nmap <c-n> :Files<CR>
nmap [b :bprev<CR>
nmap ]b :bnext<CR>
nmap <c-q> :YcmCompleter GetDoc<CR>

command Q q
command W w

let python_highlight_all = 1

let g:vim_markdown_math=1
let g:vim_markdown_frontmatter=1
let g:vim_markdown_conceal_code_blocks = 0
let g:vim_markdown_strikethrough = 1

" Turkish deasciifier
let g:turkish_deasciifier_path = 'turkish-deasciify'
vmap <leader>tr :<c-u>call Turkish_Deasciify()<CR>
vmap <leader>rt :<c-u>call Turkish_Asciify()<CR>

set hidden "It hides buffers instead of closing them

set title
set wildmenu "Visual autocomplete for command menu
set wildignore=*.swp,*.bak,*.pyc,*.class "Ignore build and temp files
set fileformat=unix
set foldlevelstart=10
set foldnestmax=10

set ignorecase
set smartcase
set hlsearch
set incsearch

set number
set relativenumber
set nowrap

set nospell

set scrolloff=2
set nostartofline

set isk+=(,),[,],_,$,@,%,#,- " none word dividers

" better backup, swap and undos storage
set directory=~/.vim/tmp/swap     " directory to place swap files in
set backup                        " make backup files
set backupdir=~/.vim/tmp/backup  " where to put backup files
set undofile                      " persistent undos - undo after you re-open the file
set undodir=~/.vim/tmp/undo
set viminfo+=n~/.vim/tmp/info
set history=1000
set noswapfile

" store yankring history file there too
let g:yankring_history_dir = '~/.vim/dirs/'

" create needed directories if they don't exist
if !isdirectory(&backupdir)
    call mkdir(&backupdir, "p")
endif
if !isdirectory(&directory)
    call mkdir(&directory, "p")
endif
if !isdirectory(&undodir)
    call mkdir(&undodir, "p")
endif

let g:ycm_autoclose_preview_window_after_insertion=1

" set visualbell
set noerrorbells

"Lightline
set laststatus=2
set noshowmode
set showcmd
set ttimeout ttimeoutlen=30 "For esc delay

let g:lightline = {
      \ 'colorscheme': 'default',
      \ }

autocmd Filetype python source ~/.vim/ftplugin/python.vim
autocmd Filetype markdown source ~/.vim/ftplugin/markdown.vim
autocmd Filetype todo source ~/.vim/ftplugin/todo.vim

" mapping to make movements operate on 1 screen line in wrap mode
function! ScreenMovement(movement)
   if &wrap
      return "g" . a:movement
   else
      return a:movement
   endif
endfunction
onoremap <silent> <expr> j ScreenMovement("j")
onoremap <silent> <expr> k ScreenMovement("k")
onoremap <silent> <expr> 0 ScreenMovement("0")
onoremap <silent> <expr> ^ ScreenMovement("^")
onoremap <silent> <expr> $ ScreenMovement("$")
nnoremap <silent> <expr> j ScreenMovement("j")
nnoremap <silent> <expr> k ScreenMovement("k")
nnoremap <silent> <expr> 0 ScreenMovement("0")
nnoremap <silent> <expr> ^ ScreenMovement("^")
nnoremap <silent> <expr> $ ScreenMovement("$")

let $JAVA_TOOL_OPTIONS = '-javaagent:/home/orcan/.local/lib/lombok/lombok.jar -Xbootclasspath/a:/home/orcan/.local/lib/lombok/lombok.jar'
