" Include other source files {{{
source $XDG_CONFIG_HOME/nvim/util.vim
" }}}
" vim-plug {{{

if empty(glob('~/.vim/autoload/plug.vim'))
  silent execute "!curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.local/share/nvim/plugged')

" Themes {{{
Plug 'chriskempson/base16-vim'
Plug 'dracula/vim'
Plug 'tomasr/molokai'
Plug 'flazz/vim-colorschemes'
Plug 'haishanh/night-owl.vim'
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

Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
"Plug 'jistr/vim-nerdtree-tabs'

" }}}

" File Types {{{
Plug 'mboughaba/i3config.vim', { 'for': 'i3config' }

Plug 'freitass/todo.txt-vim', { 'for': 'todo' }

Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }

Plug 'vim-pandoc/vim-pandoc-syntax', { 'for': 'pandoc' }

Plug 'cespare/vim-toml', { 'for': 'toml' }

Plug 'jceb/vim-orgmode', { 'for': 'org' }

Plug 'chrisbra/csv.vim', { 'for': 'csv' }

Plug 'rust-lang/rust.vim', { 'for': 'rust' }
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

Plug 'preservim/nerdcommenter'

Plug 'danro/rename.vim'

Plug 'tommcdo/vim-exchange'

Plug 'matze/vim-move'

Plug 'kana/vim-textobj-entire'

Plug 'kana/vim-textobj-indent'

Plug 'roxma/vim-paste-easy'

Plug 'machakann/vim-highlightedyank'

Plug 'tpope/vim-abolish'

Plug 'vim-scripts/ReplaceWithRegister'

Plug 'vim-scripts/Parameter-Text-Objects'
" }}}

" Utils {{{

Plug 'neomake/neomake'

Plug 'godlygeek/tabular'

Plug 'thaerkh/vim-workspace'

Plug 'tpope/vim-obsession'

Plug 'majutsushi/tagbar'

Plug 'vim-pandoc/vim-pandoc', { 'for': 'pandoc' }

Plug 'SirVer/ultisnips'

" }}}

call plug#end()
" }}}


" Variables {{{

" TODO

" }}}


" Themes & colors {{{
set termguicolors "Enable 24 bit color support
set background=dark

colorscheme night-owl

let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"


" hi MatchParen ctermbg=black ctermfg=white
" }}}


" Sets {{{

" Basics {{{

syntax on
set nocompatible
filetype plugin indent on

"}}}

" Use 'clipboard' instead of internal register
set clipboard=unnamedplus
" It hides buffers instead of closing them
set hidden
" Indicates the line that cursor is on
set cursorline
" Sets the terminal title depending on the context
set title

" Visual autocomplete for command menu
set wildmenu
set wildmode=longest,full
set wildignore=*.swp,*.bak,*.pyc,*.class "Ignore build and temp files
" Of course it is
set fileformat=unix
" set foldlevelstart=10
" set foldnestmax=4

" In case of laziness
set mouse=a

" Splits open at the bottom and right, which is non-retarded
set splitbelow splitright

set ignorecase
set smartcase
set smarttab
" set hlsearch
set incsearch
" Preview :substitute command in a split
set inccommand=split

set autoindent
" Detect non-interactive changes in files
set autoread
set expandtab
" Round indent to multiple of 'shiftwidth'
set shiftround
set shiftwidth=4 tabstop=4 softtabstop=4
" Line numbers
set number
" Relative line numbers are very convenient for vim
set relativenumber
" I want to see original version of a file first
set nowrap
" Spell check disabled by default
set nospell
" Set vertical scroll off to one if not set
if !&scrolloff
    set scrolloff=1
endif
" Set horizontal scroll off to one if not set
if !&sidescrolloff
    set sidescrolloff=5
endif
" While using <C-d>, <C-u> don't move the cursor to first
set nostartofline
" Persistent undo file
set undofile

" Dont' display mode (Lightline)
set noshowmode
set laststatus=2

set showcmd

set list

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


" Key bindings {{{

" Turkish keyboard flaws
nnoremap ı i

" Nvim configuration {{{
" function! EditVimrc()

nnoremap <leader>ev :vsplit $MYVIMRC<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>
" }}}

" Edit personal main todo file {{{
" 
function IEditTodo()
    if exists("$TODO") && filereadable($TODO)
        pedit $TODO
    else
        echoerr "Environment variable '$TODO' has not been set"
    endif
endfunction

nnoremap <leader>et :call IEditTodo()<CR>
" }}}

" Edit personal calendar file {{{
function IEditCalendar()
    if exists("$CALENDAR") && filereadable($CALENDAR)
        pedit $CALENDAR
    else
        echoerr "Environment variable '$CALENDAR' has not been set"
    endif
endfunction

nnoremap <leader>ec :call IEditCalendar()<CR>
" }}}

" Edit personal quick notes file {{{
function IEditQuickNote()
    if exists("$QUICK") && filereadable($QUICK)
        pedit $QUICK
    else
        echoerr "Environment variable '$QUICK' has not been set"
    endif
endfunction

nnoremap <leader>eq :call IEditQuickNote()<CR>
" }}}

" Terminal {{{
" Focuses the terminal window by default
nnoremap <leader>t :10split term://zsh<CR>i
" }}}

" Kill current buffer {{{
" If there is unsaved changes then display a prompt
function IKillBuffer()
    if &modified
        if confirm("Buffer has been modified! Kill the buffer?")
            bdelete!
        endif
    else
        bdelete!
    endif
endfunction

nnoremap <leader>k :call IKillBuffer()<CR>
" }}}

" Exchange {{{
" Starting with 'g' is more conveninent and vimish
nmap gx <Plug>(Exchange)
xmap x <Plug>(Exchange)
nmap gxc <Plug>(ExchangeClear)
nmap gxx <Plug>(ExchangeLine)
" 'gX' should be like 'C' or 'D'
nmap gX gx$
" }}}

" Replace with register {{{
" 'gR' should be like 'C' or 'D'
nmap gR gr$
" }}}

"Autoformat
nnoremap <leader>f :Autoformat<CR>

" Goyo
nnoremap <leader>z :Goyo<CR>

" Undo tree
nnoremap <leader>u :UndotreeToggle<CR>

" Easy configure the corresponding filetype {{{
function! ConfigureFiletype(folder, filetype)

    function! CreateExecuteScript(ft) closure
        let l:execString = printf('%s/nvim/%s/%s.vim', $XDG_CONFIG_HOME, a:folder, a:ft)
        return join(['vsplit', fnameescape(l:execString)], ' ')
    endfunction

    if empty(a:filetype)
        let l:filetype = input({
                    \ 'prompt': printf("Which filetype do you want to configure for %s?\n", a:folder),
                    \ 'default': &filetype,
                    \ 'cancelreturn': -1
                    \ })
        if l:filetype == -1
            return
        elseif empty(filetype)
            execute CreateExecuteScript(&l:filetype)
        else
            execute CreateExecuteScript(l:filetype)
        endif
    else
        execute CreateExecuteScript(a:filetype)
    endif
endfunction

command! ConfigureFtplugin :call ConfigureFiletype('ftplugin', '') 
nnoremap <leader>ef :ConfigureFtplugin<CR>
command! ConfigureSyntax :call ConfigureFiletype('syntax', '')
nnoremap <leader>es :ConfigureSyntax<CR>
" }}}


" Easy Expansion of the Active File Directory from Practical Vim {{{
function ExpandPercentageIfInCommand()
    if getcmdtype() == ':'
        return expand('%:h') . '/'
    else
        return '%%'
    endif
endfunction
cnoremap <expr> %% ExpandPercentageIfInCommand()
" }}}

" Clear search highlighting before redraw
function! AdvancedRedraw()
    set hlsearch!
    if exists("*lightline#update")
        call lightline#update()
    endif
    redraw
endfunction

nnoremap <silent> <C-l> :call AdvancedRedraw()<CR>
" Clear search higlighting in insert mode and command-line mode
noremap! <silent> <C-l> <Cmd>call AdvancedRedraw()<CR>

" Pad current line with new lines
nnoremap <M-o> m0o<ESC>kO<ESC>`0
inoremap <M-o> <ESC>m0o<ESC>kO<ESC>`0i

" Yank with 'Y' should be like 'D' or 'C'
nnoremap Y y$

" FZF {{{
" TODO if exists("*fzf#run")
    " FZF buffer list
    nnoremap <leader>b :Buffers<CR>
    " FZF file list
    nnoremap <leader>f :Files<CR>
    " FZF Occurence list
    nnoremap <leader>o :BLines<CR>
    " FZF Global occurence list
    nnoremap <leader>O :Lines<CR>
    " FZF Recent files list
    nnoremap <leader>r :History<CR>
    " FZF Search history list
    nnoremap <leader>/ :History/<CR>
    " FZF Command history list
    nnoremap <leader>: :History:<CR>
" else
    " echom "FZF is not installed. Mapping primitive equivalents"
    " " Buffer list
    " nnoremap <leader>b :buffers<CR>
    " " File list
    " nnoremap <leader>f :Hexplore<CR>
    " " Recent files list
    " nnoremap <leader>r :browse oldfiles<CR>
    " " Search history list
    " nnoremap <leader>/ q/
    " " Command history list
    " nnoremap <leader>: q:
" endif

" }}}

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

" EasyAlign {{{

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" }}}

" Typos {{{

command! Q q
command! W w

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

"}}}


" Plugin configurations {{{

" NERDTree {{{
nnoremap <leader>n :NERDTreeToggle<CR>
" }}}

" Lightline {{{
let g:lightline = {
            \ 'colorscheme': 'nightowl',
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
            \ }
            \ }
" }}}

" Vim markdown {{{
let g:vim_markdown_math=1
let g:vim_markdown_frontmatter=1
let g:vim_markdown_conceal_code_blocks = 0
let g:vim_markdown_strikethrough = 1
" }}}

" undotree {{{
let g:undotree_WindowLayout = 3
" }}}

" NerdCommenter {{{
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" }}}

" vim-highlightedyank
let g:highlightedyank_highlight_duration = 400
highlight HighlightedyankRegion cterm=reverse gui=reverse

" }}}


" Autocommands {{{

" Saving views {{{
augroup AutoSaveFolds
    autocmd!
    autocmd BufWinLeave ?* mkview
    autocmd BufWinEnter ?* silent! loadview
augroup END

" }}}

" Link filetypes {{{
augroup FileTypes
    autocmd!
augroup END
" }}}

" }}}


highlight! link Conceal Visual
" highlight Normal ctermbg=NONE guibg=NONE
" highlight NonText ctermbg=NONE guibg=NONE
" highlight Folded ctermbg=NONE guibg=NONE

" vim: foldmethod=marker
