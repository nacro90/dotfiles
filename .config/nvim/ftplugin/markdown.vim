setlocal autoindent
" setlocal nonumber "No line numbers
setlocal shiftwidth=2
setlocal tabstop=2
setlocal expandtab
set conceallevel=2
" Easy formatting while typing
set textwidth=79
" No fold by default
set nofoldenable
" Disable spellcheck, which is default
set nospell
" Close no folds
set foldlevel=99

" set list "Display EOL's
" set listchars=eol:¬
" Enable the soft wrap
set wrap
" Soft wrap by spaces, don't cut word
set linebreak

" highlight OverLength ctermbg=red ctermfg=white guibg=#592929
" match OverLength /\%81v.\+/

"t -> Autoformat while typing
"l -> 
"n -> Respect list indentation
"q -> Autoformat html comments
"r -> Format insert new lines with <Enter>
" set formatoptions=tlnqr

" Mappings
" autocmd! BufWritePre *.md,*.mkd,*.markdown substitute
