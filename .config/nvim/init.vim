" vim-plug {{{
call plug#begin('~/.local/share/nvim/plugged')

" Themes {{{
Plug 'chriskempson/base16-vim'
Plug 'dracula/vim'
Plug 'tomasr/molokai'
Plug 'flazz/vim-colorschemes'
" }}}

" Visual plugins {{{
Plug 'junegunn/goyo.vim'

Plug 'itchyny/lightline.vim'

Plug 'airblade/vim-gitgutter'

Plug 'nathanaelkane/vim-indent-guides'

Plug 'junegunn/fzf.vim'

Plug 'mbbill/undotree'

Plug 'tpope/vim-fugitive'
Plug 'shumphrey/fugitive-gitlab.vim'
Plug 'tpope/vim-rhubarb'

" NERDTree {{{

Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
"Plug 'jistr/vim-nerdtree-tabs'

" }}}

" }}}

" Syntax {{{
Plug 'mboughaba/i3config.vim', { 'for': 'i3config' }

Plug 'diepm/vim-rest-console'

Plug 'freitass/todo.txt-vim', { 'for': 'todo' }

Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }

Plug 'vim-pandoc/vim-pandoc-syntax', { 'for': 'pandoc' }

Plug 'cespare/vim-toml', { 'for': 'toml' }

Plug 'jceb/vim-orgmode', { 'for': 'org' }
" }}}

" Editing {{{
Plug 'kana/vim-textobj-user'

Plug 'tpope/vim-surround'

Plug 'terryma/vim-multiple-cursors'

Plug 'chiel92/vim-autoformat'

Plug 'tpope/vim-speeddating'

Plug 'junegunn/vim-easy-align'

Plug 'tpope/vim-repeat'

Plug 'tpope/vim-unimpaired'

Plug 'scrooloose/nerdcommenter'

Plug 'danro/rename.vim'

Plug 'tommcdo/vim-exchange'

Plug 'matze/vim-move'

Plug 'kana/vim-textobj-entire'

Plug 'kana/vim-textobj-indent'

Plug 'roxma/vim-paste-easy'

Plug 'tpope/vim-abolish'
" }}}

" Utils {{{

Plug 'benekastah/neomake'

Plug 'godlygeek/tabular'

Plug 'thaerkh/vim-workspace'

Plug 'tpope/vim-obsession'

" Plug 'Shougo/deoplete.nvim'

" Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Plug 'SirVer/ultisnips'

" Plug 'honza/vim-snippets'

" Plug 'janko-m/vim-test'

" Plug 'vim-scripts/taglist.vim'

Plug 'majutsushi/tagbar'

Plug 'vim-pandoc/vim-pandoc', { 'for': 'pandoc' }

" }}}

call plug#end()
" }}}


" Themes & colors {{{
set termguicolors "Enable 24 bit color support
set background=dark

colorscheme molokai

let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"


" hi MatchParen ctermbg=black ctermfg=white
" }}}


" Sets {{{

" Basics {{{

set nocompatible
syntax on
filetype plugin indent on

"}}}

set clipboard=unnamedplus

nmap <F3> :NERDTreeToggle<CR>

let python_highlight_all = 1


set hidden "It hides buffers instead of closing them

set title
set wildmenu "Visual autocomplete for command menu
set wildmode=longest,full
set wildignore=*.swp,*.bak,*.pyc,*.class "Ignore build and temp files
set fileformat=unix
set foldlevelstart=10
set foldnestmax=4

set go=a
set mouse=a

" Splits open at the bottom and right, which is non-retarded, unlike vim defaults.
set splitbelow splitright

set ignorecase
set smartcase
" set hlsearch
set incsearch

set autoindent
set expandtab
set shiftround
set shiftwidth=4 tabstop=4 softtabstop=4

set number
set relativenumber
set nowrap

set nospell

set scrolloff=2
set nostartofline

set undofile

set visualbell
set noerrorbells

" Better display for messages
set cmdheight=2

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Don't update screen while running macros
set lazyredraw               

" Word boundaries
set iskeyword-=.             " Regard . as a word boundary
set iskeyword-=_             " Regard _ as a word boundary
set iskeyword-=#             " Regard # as a word boundary

"}}}


" Autocommands {{{

" Saving views {{{
augroup AutoSaveFolds
  autocmd!
  autocmd BufWinLeave ?* mkview
  autocmd BufWinEnter ?* silent! loadview
augroup END

" }}}

" }}}


" Plugin configurations {{{

" Vim workspace plugin {{{

let g:workspace_persist_undo_history = 0
let g:workspace_autosave_untrailspaces = 0
let g:workspace_session_directory = $HOME . '/.local/share/nvim/workspace'

" }}}

" Lightline {{{

set laststatus=2
set noshowmode
set showcmd

let g:lightline = {
      \ 'colorscheme': 'one',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'readonly', 'filename', 'modified' ] ],
      \   'right': [ [ 'gitbranch' ],
      \              [ 'filetype' ],
      \              [ 'lineinfo', 'percent' ] ]
      \ },
      \ 'component': {
      \   'charvaluehex': '0x%B'
      \ }, 
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head'
      \ },
      \ }

" }}}

" Vim markdown {{{
let g:vim_markdown_math=1
let g:vim_markdown_frontmatter=1
let g:vim_markdown_conceal_code_blocks = 0
let g:vim_markdown_strikethrough = 1

" }}}

" GitGutter {{{

set updatetime=100 "milliseconds

" }}}

" undotree {{{
let g:undotree_WindowLayout = 4
" }}}

" NerdCommenter {{{

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" }}}

" }}}


" Key bindings {{{

" Nvim configuration
nnoremap <leader>`` :tabe ~/.config/nvim/init.vim<CR>

" Autoformat
nnoremap <leader>f :Autoformat<CR>

" Undo tree
nnoremap <leader>u :UndotreeToggle<cr>

" Vim workspace plugin
" nnoremap <leader>s :ToggleWorkspace<CR>

" GitGutter {{{
nnoremap <leader>ggl :GitGutterLineHighlightsToggle<CR>
nnoremap <leader>ggn :GitGutterLineNrHighlightsToggle<CR>
nnoremap <leader>ggb :GitGutterBufferToggle<CR>
nnoremap <leader>ggg :GitGutterToggle<CR>
nnoremap <leader>ggs :GitGutterSignsToggle<CR>

nnoremap ]h :GitGutterNextHunk<CR>
nnoremap [h :GitGutterPrevHunk<CR>

nnoremap <leader>ghs :GitGutterStageHunk<CR>
nnoremap <leader>ghu :GitGutterUndoHunk<CR>

" }}}

" Fugitive {{{
" Git status
nnoremap <leader>gs :Gstatus<CR>
" Fetch
nnoremap <leader>gf :Gfetch<CR>
" Pull
nnoremap <leader>gpl :Gpull<CR>
" Push
nnoremap <leader>gps :Gpush<CR>
" Vertical diff split
nnoremap <leader>gd :Gvdiffsplit<CR>
" Revert
nnoremap <leader>gr :Gread<CR>
" Write / stage
nnoremap <leader>gw :Gwrite<CR>
" Commit
nnoremap <leader>gc :Gcommit<CR>
" Merge 
nnoremap <leader>gm :Gmerge<CR>
" Log
nnoremap <leader>gl :Glog!<CR>
" Blame
nnoremap <leader>gb :Gblame<CR>

" G-edit - Show HEAD version of the file 
" on current buffer
nnoremap <leader>goo :Gedit<CR>
" on vertical split
nnoremap <leader>gov :Gvsplit<CR>
" on horizontal split
nnoremap <leader>gos :Gsplit<CR>
" on new tab
nnoremap <leader>got :Gtabedit<CR>
" on popup
nnoremap <leader>gop :Gpedit<CR>
" 

" }}}

" Display foldlevel
nmap z<C-x> :set foldlevel?<CR>

" FZF{{{
nmap <c-p> :Files<CR>

"}}}

" EasyAlign {{{
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" }}}

" Typos {{{

command Q q
command W w

"}}}

" {move} -> g{move} {{{
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
" }}}

" COC {{{

" Use tab for trigger completion with characters ahead and navigate.{{{
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

"}}}


" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>"

autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif


" Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)

" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)

" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'

" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)

" }}}

"}}}


" Autocommands {{{

" au BufWritePost config.h :pedit term://nvim\ /home/orcan/.config/nvim/init.vim


" }}}



highlight Normal ctermbg=NONE guibg=NONE
highlight NonText ctermbg=NONE guibg=NONE
highlight Folded ctermbg=NONE guibg=NONE

" vim: foldmethod=marker
