" Language:    YueScript
" Maintainer:  Li Jin <dragon-fly@qq.com>
" Based On:    MoonScript by leafo <leafot@gmail.com>
" URL:         http://github.com/pigpigyyy/yuescript-vim
" License:     WTFPL

autocmd BufNewFile,BufRead *.yue set filetype=yue

function! s:DetectYue()
    if getline(1) =~ '^#!.*\<yue\>'
        set filetype=yue
    endif
endfunction

autocmd BufNewFile,BufRead * call s:DetectYue()
