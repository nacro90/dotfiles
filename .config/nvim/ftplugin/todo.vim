" colorscheme hashpunk

" Variables
" Ignore marked as done
let b:done_ignored = 0

" Sets
" Treat tags as a whole word
set iskeyword+=-
set iskeyword+=_
set iskeyword+=+

" Mappings
" Prepend date on every new line
nnoremap <buffer> o o<Cmd>call todo#txt#prepend_date()<CR>
nnoremap <buffer> O O<Cmd>call todo#txt#prepend_date()<CR>

nnoremap <buffer> <leader>v <Cmd>call orcan#todo#txt#ToggleDoneIgnore()<CR>

" Autocommands
augroup orcan_todo_txt
    autocmd!
    autocmd BufWritePre <buffer> sort | silent! %substitute/\s\+$//
augroup end
