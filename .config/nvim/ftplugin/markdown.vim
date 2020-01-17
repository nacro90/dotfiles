au! BufRead,BufNewFile *.mkd set filetype=markdown
au! BufRead,BufNewFile *.md  set filetype=markdown

setlocal autoindent
" setlocal nonumber "No line numbers
setlocal shiftwidth=2
setlocal tabstop=2
setlocal expandtab
set conceallevel=2

set nospell

" set list "Display EOL's
" set listchars=eol:¬
set wrap "Enable the soft wrap
set linebreak "Soft wrap by spaces, don't cut word

" highlight OverLength ctermbg=red ctermfg=white guibg=#592929
" match OverLength /\%81v.\+/

"t -> Autoformat while typing
"l -> 
"n -> Respect list indentation
"q -> Autoformat html comments
"r -> Format insert new lines with <Enter>
" set formatoptions=tlnqr

" For turkish keyboards iI confusion
nnoremap ı i

"Custom syntaxes
syntax match markdownMustache /{{.*}}/
