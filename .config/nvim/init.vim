" Include other source files {{{
source $XDG_CONFIG_HOME/nvim/util.vim
" }}}


" vim-plug {{{

" Setup {{{
let s:plug_vim = $XDG_CONFIG_HOME . '/nvim/autoload/plug.vim'
if empty(glob(s:plug_vim))
    silent execute "!curl -fLo " . s:plug_vim . " --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
    autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin($XDG_DATA_HOME . '/nvim/plugged')

" }}}

" Themes {{{
Plug 'chriskempson/base16-vim'
" Plug 'dracla/vim'
Plug 'tomasr/molokai'
Plug 'flazz/vim-colorschemes'
Plug 'haishanh/night-owl.vim'
Plug 'challenger-deep-theme/vim'
" }}}

" Visual plugins {{{
Plug 'junegunn/goyo.vim'

Plug 'itchyny/lightline.vim'

Plug 'airblade/vim-gitgutter'

Plug 'nathanaelkane/vim-indent-guides'

Plug 'junegunn/fzf.vim'

Plug 'mbbill/undotree'

Plug 'jeffkreeftmeijer/vim-numbertoggle'

Plug 'norcalli/nvim-colorizer.lua'

Plug 'tpope/vim-fugitive'

Plug 'scrooloose/nerdtree'
" Plug 'Xuyuanp/nerdtree-git-plugin'
" Plug 'jistr/vim-nerdtree-tabs'

" }}}

" File Types {{{
Plug 'freitass/todo.txt-vim', { 'for': 'todo' }

Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }

Plug 'baskerville/vim-sxhkdrc', { 'for': 'sxhkdrc' }

Plug 'mustache/vim-mustache-handlebars', { 'for': ['html.mustache', 'html.handlebars'] }

Plug 'cespare/vim-toml', { 'for': 'toml' }

Plug 'jceb/vim-orgmode', { 'for': 'org' }

Plug 'chrisbra/csv.vim', { 'for': 'csv' }

Plug 'rust-lang/rust.vim', { 'for': 'rust' }

Plug 'vim-python/python-syntax', { 'for': 'python' }
" Plug 'numirias/semshi', { 'for': 'python', 'do': ':UpdateRemotePlugins' }
Plug 'szymonmaszke/vimpyter' " Requires `notedown`

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

Plug 'tpope/vim-commentary'

Plug 'jiangmiao/auto-pairs'

Plug 'danro/rename.vim'

Plug 'tommcdo/vim-exchange'

Plug 'matze/vim-move'

Plug 'kana/vim-textobj-entire'

Plug 'kana/vim-textobj-indent'

" Plug 'roxma/vim-paste-easy'

Plug 'machakann/vim-highlightedyank'

Plug 'vim-scripts/ReplaceWithRegister'

Plug 'vim-scripts/Parameter-Text-Objects'
" }}}

" Utils {{{

Plug 'zhimsel/vim-stay'

Plug 'neomake/neomake'

Plug 'vim-syntastic/syntastic'

Plug 'tpope/vim-obsession'

Plug 'chrisbra/NrrwRgn'

" Plug 'Konfekt/FastFold'

if has('nvim')
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
    Plug 'Shougo/deoplete.nvim'
    Plug 'roxma/nvim-yarp'
    Plug 'roxma/vim-hug-neovim-rpc'
endif

Plug 'autozimu/LanguageClient-neovim', {
            \ 'branch': 'next',
            \ 'do': 'bash install.sh',
            \ }

Plug 'ptzz/lf.vim'
Plug 'rbgrouleff/bclose.vim'

Plug 'majutsushi/tagbar'

Plug 'SirVer/ultisnips'
" Plug 'honza/vim-snippets'

Plug 'tmhedberg/SimpylFold', { 'for': 'python' }
Plug 'plytophogy/vim-virtualenv'
" Plug 'PieterjanMontens/vim-pipenv'

" }}}

call plug#end()
" }}}


" Variables {{{

let $FZF_DEFAULT_OPTS = "--color=16 --info=inline --marker='* ' --bind=change:top --bind=ctrl-b:page-up --bind=ctrl-f:page-down --bind=ctrl-u:half-page-up --bind=ctrl-d:half-page-down"

" }}}


" Themes & colors {{{
set termguicolors "Enable 24 bit color support
set background=dark

let ayucolor="dark"

colorscheme ayu

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

" Set max height of completion window to human levels
set pumheight=15

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

" Session specific mappings are useful to me like make!...
set sessionoptions-=options
" Don't save blank
set sessionoptions-=blank

" See https://github.com/zhimsel/vim-stay
set viewoptions=cursor,folds,slash,unix

" This option controls the behavior when switching between buffers.
set switchbuf=usetab

" Dont' display mode (Lightline)
set noshowmode
set laststatus=2

set showcmd

set completeopt+=noinsert

set list

set visualbell
set noerrorbells
" Better display for messages
set cmdheight=2
" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300
" don't give |ins-completion-menu| messages.
if has("patch-7.4.314")
    set shortmess+=c
endif
" always show signcolumns
set signcolumn=yes
" Don't update screen while running macros
set lazyredraw
" Word boundaries
set iskeyword-=.             " Regard . as a word boundary
set iskeyword-=#             " Regard # as a word boundary
set iskeyword+=_             " Don't regard # as a word boundary

"}}}


" Plugin configurations {{{

" Python {{{

let g:python_highlight_all = 1

" SimpylFold {{{



" }}}

" }}}

" NrrwRgn {{{

let g:nrrw_rgn_nomap_nr = 1
let g:nrrw_rgn_nomap_Nr = 1

" }}}

" LF {{{

let g:lf_map_keys = 0
let g:NERDTreeHijackNetrw = 0
let g:lf_replace_netrw = 1
let g:lf_command_override = 'lf -command "set hidden; set ratios 1:2:3"'

" }}}

" IndentGuides {{{

let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_exclude_filetypes = ['help', 'nerdtree', 'floaterm', 'man', 'gitcommit', 'fugitive', 'git']
let g:indent_guides_auto_colors = 0

" }}}

"LanguageClient {{{
"

let g:LanguageClient_autoStart = 0
" Custom variable to track language client status

function! s:LanguageClientToggle()
    if !exists('g:language_client_started') || g:language_client_started == 0
        call orcan#init#LanguageClientStart()
    else
        call orcan#init#LanguageClientStop()
    endif
endfunction

command! LanguageClientToggle call s:LanguageClientToggle()

let g:LanguageClient_diagnosticsDisplay = {
            \     1: {
            \         "name": "Error",
            \         "texthl": "SyntasticErrorLine",
            \         "signText": ">>",
            \         "signTexthl": "SyntasticErrorSign",
            \         "virtualTexthl": "Error",
            \     },
            \     2: {
            \         "name": "Warning",
            \         "texthl": "SyntasticWarningLine",
            \         "signText": "!!",
            \         "signTexthl": "SyntasticWarningLine",
            \         "virtualTexthl": "Todo",
            \     },
            \     3: {
            \         "name": "Information",
            \         "texthl": "",
            \         "signText": "OO",
            \         "signTexthl": "",
            \         "virtualTexthl": "",
            \     },
            \     4: {
            \         "name": "Hint",
            \         "texthl": "",
            \         "signText": "as",
            \         "signTexthl": "",
            \         "virtualTexthl": "",
            \     },
            \ }


" }}}

" Easy navigation with terminal {{{

if (has('nvim'))
    tnoremap <C-w>m <Cmd>tabedit<CR>
    tnoremap <C-w><C-m> <Cmd>tabedit<CR>
    tnoremap <C-w>, <Cmd>tabprevious<CR>
    tnoremap <C-w><C-,> <Cmd>tabprevious<CR>
    tnoremap <C-w>. <Cmd>tabnext<CR>
    tnoremap <C-w><C-.> <Cmd>tabnext<CR>
    tnoremap <C-w>q <Cmd>wincmd q<CR>
    tnoremap <C-w><C-q> <Cmd>wincmd q<CR>
    tnoremap <C-w>c <Cmd>wincmd c<CR>
    tnoremap <C-w><C-c> <Cmd>wincmd c<CR>
    tnoremap <C-w>h <Cmd>wincmd h<CR>
    tnoremap <C-w><C-h> <Cmd>wincmd h<CR>
    tnoremap <C-w>j <Cmd>wincmd j<CR>
    tnoremap <C-w><C-j> <Cmd>wincmd j<CR>
    tnoremap <C-w>k <Cmd>wincmd k<CR>
    tnoremap <C-w><C-k> <Cmd>wincmd k<CR>
    tnoremap <C-w>l <Cmd>wincmd l<CR>
    tnoremap <C-w><C-l> <Cmd>wincmd l<CR>

    tnoremap <C-l> <Cmd>nohlsearch<CR>
    tnoremap <expr> <M-r> '<C-\><C-N>"' . nr2char(getchar()) . 'pi'
endif

" }}}

" Deoplete {{{
let g:deoplete#enable_at_startup = 1

function g:Multiple_cursors_before()
    call deoplete#custom#buffer_option('auto_complete', v:false)
endfunction
function g:Multiple_cursors_after()
    call deoplete#custom#buffer_option('auto_complete', v:true)
endfunction



" call deoplete#custom#option('skip_chars': [])


" }}}


" Syntastic {{{
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 2
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
" }}}


" Colorizer {{{

lua require 'colorizer'.setup()

" }}}

" File explorer {{{
let g:netrw_liststyle=3
let g:netrw_chgwin=2
let g:netrw_winsize=20
let g:netrw_preview=1
let g:netrw_banner=0
" }}}


function SyntasticStatuslineFlagWithoutBrackets()
    let l:line = SyntasticStatuslineFlag()
    return strcharpart(l:line, 1, strlen(l:line) - 2)
endfunction

" Lightline {{{
let g:lightline = {
            \ 'colorscheme': 'ayu_mirage',
            \ 'active': {
            \   'left': [ [ 'mode', 'paste' ],
            \             [ 'readonly', 'filename', 'modified', 'syntastic' ] ],
            \   'right': [ [ 'gitbranch' ],
            \              [ 'filetype' ],
            \              [ 'lineinfo', 'percent' ] ]
            \ },
            \ 'component': {
            \   'charvaluehex': '0x%B'
            \ },
            \ 'component_function': {
            \   'gitbranch': 'fugitive#head',
            \   'syntastic': 'SyntasticStatuslineFlagWithoutBrackets'
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


" Mappings {{{

" NrrwRgn {{{

xmap gn <Plug>NrrwrgnDo
nmap gn <Plug>NrrwrgnDo

" }}}

" Turkish keyboard flaws
nnoremap ı i

" Lf {{{

nnoremap <leader>f <Cmd>Lf<CR>
nnoremap <leader>F <Cmd>LfWorkingDirectory<CR>

" }}}

nnoremap <leader>sl <Cmd>LanguageClientToggle<CR>
nnoremap <leader>sh <Cmd>call LanguageClient#textDocument_hover()<CR>
nnoremap <leader>ss <Cmd>call LanguageClient#textDocument_signatureHelp()<CR>
nnoremap <leader>sd <Cmd>call LanguageClient#textDocument_definition()<CR>
nnoremap <leader>sa <Cmd>call LanguageClient#textDocument_codeAction()<CR>
nnoremap <leader>sr <Cmd>call LanguageClient#textDocument_rename()<CR>

" C-w is life {{{

nnoremap <C-w>. <Cmd>tabnext<CR>
nnoremap <C-w>, <Cmd>tabprevious<CR>
nnoremap <C-w><C-.> <Cmd>tabnext<CR>
nnoremap <C-w><C-,> <Cmd>tabprevious<CR>

nnoremap <C-w>m <Cmd>tabedit<CR>
nnoremap <C-w><C-m> <Cmd>tabedit<CR>
" }}}

" Nvim configuration {{{
" function! EditVimrc()

nnoremap <leader>ev :vsplit $MYVIMRC<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>
" }}}

" Fast resizing {{{
noremap <C-w><lt> 5<C-w><lt>
noremap <C-w>> 5<C-w>>
noremap <C-w>+ 3<C-w>+
noremap <C-w>- 3<C-w>-
"}}}

" Append new line {{{
" TODO inoremap <silent> <M-m>
" }}}

" Edit personal main todo file {{{
"
function IEditTodo()
    if exists("$TODO") && filereadable($TODO)
        vsplit $TODO
    else
        echoerr "Environment variable '$TODO' has not been set"
    endif
endfunction

nnoremap <leader>et :call IEditTodo()<CR>
" }}}

" Edit personal calendar file {{{
function IEditCalendar()
    if exists("$CALENDAR") && filereadable($CALENDAR)
        vsplit $CALENDAR
    else
        echoerr "Environment variable '$CALENDAR' has not been set"
    endif
endfunction

nnoremap <leader>ec :call IEditCalendar()<CR>
" }}}

" Edit personal quick notes file {{{
function IEditQuickNote()
    if exists("$QUICK") && filereadable($QUICK)
        vsplit $QUICK
    else
        echoerr "Environment variable '$QUICK' has not been set"
    endif
endfunction

nnoremap <leader>eq :call IEditQuickNote()<CR>
" }}}

" Terminal {{{ TODO: Make use of it
" Focuses the terminal window by default
" nnoremap <leader>t :10split term://zsh<CR>
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

" Colorizer
" nnoremap <leader>v <Cmd>ColorizerToggle<CR>

"Autoformat
nnoremap <leader>l <Cmd>Autoformat<CR>

" Git
nnoremap <leader>v <Cmd>Git<CR>

" Undo tree
nnoremap <leader>u <Cmd>UndotreeToggle<CR>

" Easy configure the corresponding filetype {{{
function! s:ConfigureFiletype(folder, filetype)

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
        if l:filetype == -1 || (empty(l:filetype) && empty(&l:filetype))
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

command! ConfigureFtplugin :call s:ConfigureFiletype('ftplugin', '')
nnoremap <leader>ef :ConfigureFtplugin<CR>
command! ConfigureSyntax :call s:ConfigureFiletype('after/syntax', '')
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

" Clear search highlighting before redraw {{{

nnoremap <silent> <C-l> :nohlsearch<bar>redraw<CR>
" Clear search higlighting in insert mode and command-line mode
noremap! <silent> <C-l> <Cmd>nohlsearch<bar>redraw<CR>

" }}}

" Pad current line with new lines
nnoremap <M-o> m0o<ESC>kO<ESC>`0
inoremap <M-o> <ESC>m0o<ESC>kO<ESC>`0i

" Yank with 'Y' should be like 'D' or 'C'
nnoremap Y y$

" FZF {{{
" TODO if exists("*fzf#run")
" FZF buffer list
nnoremap <leader>b <Cmd>Buffers<CR>
" FZF file list
nnoremap <leader>n <Cmd>Files<CR>
" FZF Occurence list
nnoremap <leader>o <Cmd>BLines<CR>
" FZF Grep
nnoremap <leader>O <Cmd>Rg<CR>
" FZF Recent files list
nnoremap <leader>r <Cmd>History<CR>
" FZF Search history list
nnoremap <leader>/ <Cmd>History/<CR>
" FZF Command history list
nnoremap <leader>: <Cmd>History:<CR>
" FZF Tags
nnoremap <leader>t <Cmd>Tags<CR>
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

" Don't need to assign keys to these
" nnoremap <leader>ggl :GitGutterLineHighlightsToggle<CR>
" nnoremap <leader>ggn :GitGutterLineNrHighlightsToggle<CR>
" nnoremap <leader>ggb :GitGutterBufferToggle<CR>
" nnoremap <leader>ggg :GitGutterToggle<CR>
" nnoremap <leader>ggs :GitGutterSignsToggle<CR>

nnoremap ]h :GitGutterNextHunk<CR>
nnoremap [h :GitGutterPrevHunk<CR>

nnoremap ga. :GitGutterStageHunk<CR>
nnoremap gr. :GitGutterUndoHunk<CR>

" }}}

" Fugitive {{{
"
" I am using command line more...
"
" Git status
nnoremap <leader>gs <Cmd>Git<CR>
" Push
nnoremap <leader>gp :Git push<space>
" Vertical diff split
nnoremap <leader>gd <Cmd>Gvdiffsplit<CR>
" Revert
nnoremap <leader>gr% <Cmd>Gread<CR>
" Write / stage
nnoremap <leader>ga% <Cmd>Gwrite<CR>
nnoremap <leader>gaa <Cmd>Git add --all<CR>
" Merge
nnoremap <leader>gm :Git merge<space>
" Log
nnoremap <leader>gl <Cmd>vertical Git log<CR>
" Blame
nnoremap <leader>gbl <Cmd>Git blame<CR>
" Checkout
nnoremap <leader>gco :Git checkout<space>
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

" Autocommands {{{

" " Auto View {{{

" let g:skipview_files = [
            " \ '[EXAMPLE PLUGIN BUFFER]'
            " \ ]
" function! MakeViewCheck()
    " if has('quickfix') && &buftype =~ 'nofile'
        " " Buffer is marked as not a file
        " return 0
    " endif
    " if empty(glob(expand('%:p')))
        " " File does not exist on disk
        " return 0
    " endif
    " if len($TEMP) && expand('%:p:h') == $TEMP
        " " We're in a temp dir
        " return 0
    " endif
    " if len($TMP) && expand('%:p:h') == $TMP
        " " Also in temp dir
        " return 0
    " endif
    " if index(g:skipview_files, expand('%')) >= 0
        " " File is in skip list
        " return 0
    " endif
    " return 1
" endfunction
" augroup AutoView
    " autocmd!
    " " Autosave & Load Views.
    " autocmd BufWritePost,BufLeave,WinLeave ?* if MakeViewCheck() | silent! mkview | endif
    " autocmd BufWinEnter ?* if MakeViewCheck() | silent! loadview | endif
" augroup end

" " }}}

" Terminal auto insert {{{

augroup orcan_init_vim_terminal
    autocmd!
    " Start insert when swithing to a terminal
    autocmd BufWinEnter,WinEnter term://* startinsert
augroup end

" }}}

" Indent Guides Terminal Toggle {{{

augroup orcan_indent_guides_terminal_toggle
    autocmd!
    au TermEnter * IndentGuidesDisable
    au TermLeave * IndentGuidesEnable
augroup end

" }}}


" LanguageClient {{{

function! s:OnLanguageClientStart()
    let g:language_client_started = 1

    function! s:LanguageClientCursorHold()
        call LanguageClient#textDocument_documentHighlight()
    endfunction

    augroup language_client_autocmds
        autocmd!
        autocmd CursorHold <buffer> silent! call LanguageClient#textDocument_documentHighlight()
    augroup END
endfunction

function s:OnLanguageClientStop()
    let g:language_client_started = 0
    autocmd! language_client_autocmds
endfunction

augroup orcan_language_client
    autocmd User LanguageClientStarted call s:OnLanguageClientStart()
    autocmd User LanguageClientStopped call s:OnLanguageClientStop()
augroup end

" }}}

" Autoclose omni completion preview window {{{
" If you prefer the Omni-Completion tip window to close when a selection is
" made, these lines close it on movement in insert mode or when leaving
" insert mode

augroup orcan_pum_visible_pclose
    autocmd InsertLeave * if pumvisible() == 0|pclose|endif
augroup END

" }}}


" Highlighting {{{

augroup orcan_init_vim_highlighting
    autocmd!
    autocmd VimEnter,Colorscheme * :highlight! link IndentGuidesOdd CursorLine
    autocmd VimEnter,Colorscheme * :highlight! link IndentGuidesEven CursorLine
    autocmd VimEnter,Colorscheme * :highlight! link Conceal Visual
    autocmd VimEnter,Colorscheme * :highlight! link Todo WarningMsg
augroup end

" }}}

" }}}


" highlight Normal ctermbg=NONE guibg=NONE
" highlight NonText ctermbg=NONE guibg=NONE
" highlight Folded ctermbg=NONE guibg=NONE

" vim: foldmethod=marker ft=vim
