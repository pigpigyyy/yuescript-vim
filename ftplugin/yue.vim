" Language:    YueScript
" Maintainer:  Li Jin <dragon-fly@qq.com>
" Based On:    CoffeeScript by Mick Koch <kchmck@gmail.com>
" URL:         http://github.com/pigpigyyy/yuescript-vim
" License:     WTFPL

if exists("b:did_ftplugin")
  finish
endif
let b:did_ftplugin = 1

setlocal formatoptions-=t
setlocal comments=:--
setlocal commentstring=--\ %s

let b:undo_ftplugin = "setlocal commentstring< comments< formatoptions<"
