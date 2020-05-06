function orcan#init#LanguageClientStart()

    if !has_key(g:LanguageClient_serverCommands, &filetype)
        echoerr 'g:LanguageClient_serverCommands has no ''' . &filetype . ''' key'
        return
    endif

    LanguageClientStart

    let g:language_client_started = 1

    function! LanguageClientInfoRequest()
        call LanguageClient#textDocument_hover()
        call LanguageClient#textDocument_signatureHelp()
    endfunction

    nnoremap <silent> <leader>sh <Cmd>call LanguageClient#textDocument_hover()<CR>
    nnoremap <silent> <leader>ss <Cmd>call LanguageClient#textDocument_signatureHelp()<CR>
    nnoremap <silent> <leader>sd <Cmd>call LanguageClient#textDocument_definition()<CR>
    nnoremap <silent> <leader>sa <Cmd>call LanguageClient#textDocument_codeAction()<CR>
    nnoremap <silent> <leader>sr <Cmd>call LanguageClient#textDocument_rename()<CR>

    augroup language_client_autocmds
        autocmd!
        autocmd CursorHold <buffer> silent! call s:LanguageClientCursorHold()
    augroup END

    echom 'Language client started'

endfunction

function orcan#init#LanguageClientStop()

    if !exists('g:language_client_started') || g:language_client_started == 0
        echoerr 'Language client is not running'
        return
    endif

    autocmd! language_client_autocmds

    nunmap <leader>sh
    nunmap <leader>ss
    nunmap <leader>sd
    nunmap <leader>sa
    nunmap <leader>sr

    LanguageClientStop

    let g:language_client_started = 0

    echom 'Language client stopped'

endfunction

function orcan#init#LanguageClientToggle()
    if !exists('g:language_client_started') || g:language_client_started == 0
        call orcan#init#LanguageClientStart()
    else
        call orcan#init#LanguageClientStop()
    endif
endfunction
