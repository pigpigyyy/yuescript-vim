" Language:    YueScript
" Maintainer:  Li Jin <dragon-fly@qq.com>
" Based On:    MoonScript by leafo <leafot@gmail.com>
" URL:         http://github.com/pigpigyyy/yuescript-vim
" License:     WTFPL

" Bail if our syntax is already loaded.
if exists('b:current_syntax') && b:current_syntax == 'yue'
  finish
endif

if version < 600
  syn clear
endif

" Highlight long strings.
syn sync minlines=100

" These are `matches` instead of `keywords` because vim's highlighting
" priority for keywords is higher than matches. This causes keywords to be
" highlighted inside matches, even if a match says it shouldn't contain them --
" like with yueAssign and yueDot.
syn match yueStatement /\<\%(return\|break\|continue\)\>/ display
hi def link yueStatement Statement

syn match yueRepeat /\<\%(for\|while\)\>/ display
hi def link yueRepeat Repeat

syn match yueConditional /\<\%(if\|else\|elseif\|then\|switch\|when\|unless\)\>/
\                           display
hi def link yueConditional Conditional

" syn match yueException /\<\%(try\|catch\|finally\)\>/ display
" hi def link yueException Exception

syn match yueKeyword /\<\%(export\|local\|global\|import\|from\|with\|in\|and\|or\|not\|class\|extends\|super\|using\|do\|macro\)\>/
\                       display
syn match yueKeyword /\%(import\s*['"][^'"]\+['"]\s*\)\@<=as/
\                       display
syn match yueKeyword /\%(export\)\@<=\s\+default/
\                       display
syn match yueKeyword /\<\I\i\+\>\%(\s\+\%(\I\i*\|,\|\s\+\)\+\s*=\)\@=/
\                       display
hi def link yueKeyword Keyword

" all built in funcs from Lua 5.1
syn keyword yueLuaFunc assert collectgarbage dofile error next
syn keyword yueLuaFunc print rawget rawset tonumber tostring type _VERSION
syn keyword yueLuaFunc _G getfenv getmetatable ipairs loadfile
syn keyword yueLuaFunc loadstring pairs pcall rawequal
syn keyword yueLuaFunc require setfenv setmetatable unpack xpcall
syn keyword yueLuaFunc load module select
syn match yueLuaFunc /package\.cpath/
syn match yueLuaFunc /package\.loaded/
syn match yueLuaFunc /package\.loadlib/
syn match yueLuaFunc /package\.path/
syn match yueLuaFunc /package\.preload/
syn match yueLuaFunc /package\.seeall/
syn match yueLuaFunc /coroutine\.running/
syn match yueLuaFunc /coroutine\.create/
syn match yueLuaFunc /coroutine\.resume/
syn match yueLuaFunc /coroutine\.status/
syn match yueLuaFunc /coroutine\.wrap/
syn match yueLuaFunc /coroutine\.yield/
syn match yueLuaFunc /string\.byte/
syn match yueLuaFunc /string\.char/
syn match yueLuaFunc /string\.dump/
syn match yueLuaFunc /string\.find/
syn match yueLuaFunc /string\.len/
syn match yueLuaFunc /string\.lower/
syn match yueLuaFunc /string\.rep/
syn match yueLuaFunc /string\.sub/
syn match yueLuaFunc /string\.upper/
syn match yueLuaFunc /string\.format/
syn match yueLuaFunc /string\.gsub/
syn match yueLuaFunc /string\.gmatch/
syn match yueLuaFunc /string\.match/
syn match yueLuaFunc /string\.reverse/
syn match yueLuaFunc /table\.maxn/
syn match yueLuaFunc /table\.concat/
syn match yueLuaFunc /table\.sort/
syn match yueLuaFunc /table\.insert/
syn match yueLuaFunc /table\.remove/
syn match yueLuaFunc /math\.abs/
syn match yueLuaFunc /math\.acos/
syn match yueLuaFunc /math\.asin/
syn match yueLuaFunc /math\.atan/
syn match yueLuaFunc /math\.atan2/
syn match yueLuaFunc /math\.ceil/
syn match yueLuaFunc /math\.sin/
syn match yueLuaFunc /math\.cos/
syn match yueLuaFunc /math\.tan/
syn match yueLuaFunc /math\.deg/
syn match yueLuaFunc /math\.exp/
syn match yueLuaFunc /math\.floor/
syn match yueLuaFunc /math\.log/
syn match yueLuaFunc /math\.log10/
syn match yueLuaFunc /math\.max/
syn match yueLuaFunc /math\.min/
syn match yueLuaFunc /math\.fmod/
syn match yueLuaFunc /math\.modf/
syn match yueLuaFunc /math\.cosh/
syn match yueLuaFunc /math\.sinh/
syn match yueLuaFunc /math\.tanh/
syn match yueLuaFunc /math\.pow/
syn match yueLuaFunc /math\.rad/
syn match yueLuaFunc /math\.sqrt/
syn match yueLuaFunc /math\.frexp/
syn match yueLuaFunc /math\.ldexp/
syn match yueLuaFunc /math\.random/
syn match yueLuaFunc /math\.randomseed/
syn match yueLuaFunc /math\.pi/
syn match yueLuaFunc /io\.stdin/
syn match yueLuaFunc /io\.stdout/
syn match yueLuaFunc /io\.stderr/
syn match yueLuaFunc /io\.close/
syn match yueLuaFunc /io\.flush/
syn match yueLuaFunc /io\.input/
syn match yueLuaFunc /io\.lines/
syn match yueLuaFunc /io\.open/
syn match yueLuaFunc /io\.output/
syn match yueLuaFunc /io\.popen/
syn match yueLuaFunc /io\.read/
syn match yueLuaFunc /io\.tmpfile/
syn match yueLuaFunc /io\.type/
syn match yueLuaFunc /io\.write/
syn match yueLuaFunc /os\.clock/
syn match yueLuaFunc /os\.date/
syn match yueLuaFunc /os\.difftime/
syn match yueLuaFunc /os\.execute/
syn match yueLuaFunc /os\.exit/
syn match yueLuaFunc /os\.getenv/
syn match yueLuaFunc /os\.remove/
syn match yueLuaFunc /os\.rename/
syn match yueLuaFunc /os\.setlocale/
syn match yueLuaFunc /os\.time/
syn match yueLuaFunc /os\.tmpname/
syn match yueLuaFunc /debug\.debug/
syn match yueLuaFunc /debug\.gethook/
syn match yueLuaFunc /debug\.getinfo/
syn match yueLuaFunc /debug\.getlocal/
syn match yueLuaFunc /debug\.getupvalue/
syn match yueLuaFunc /debug\.setlocal/
syn match yueLuaFunc /debug\.setupvalue/
syn match yueLuaFunc /debug\.sethook/
syn match yueLuaFunc /debug\.traceback/
syn match yueLuaFunc /debug\.getfenv/
syn match yueLuaFunc /debug\.getmetatable/
syn match yueLuaFunc /debug\.getregistry/
syn match yueLuaFunc /debug\.setfenv/
syn match yueLuaFunc /debug\.setmetatable/

hi def link yueLuaFunc Identifier

" The first case matches symbol operators only if they have an operand before.
syn match yueExtendedOp /\%(\S\s*\)\@<=[+\-*/%&|\^=!<>?#]\+\|\.\|\\\||>\|<=\|<\-/
\                          display
hi def link yueExtendedOp yueOperator
hi def link yueOperator Operator

syntax match yueFunction /->\|=>\|)\|(\|\[\|]\|{\|}\|!/
highlight default link yueFunction Function

" This is separate from `yueExtendedOp` to help differentiate commas from
" dots.
syn match yueSpecialOp /[,;]/ display
hi def link yueSpecialOp SpecialChar

syn match yueBoolean /\<\%(true\|false\)\>/ display
hi def link yueBoolean Boolean

syn match yueNil /\<\%(nil\)\>/ display
hi def link yueNil Constant

" A special variable
syn match yueSpecialVar /\<\%(self\)\>/ display
" An @-variable
syn match yueSpecialVar /@\%(\I\i*\)\?/ display
" An $-macro name
syn match yueSpecialVar /$\%(\I\i*\)\?/ display
hi def link yueSpecialVar Structure

" A class-like name that starts with a capital letter
syn match yueObject /\<\u\w*\>/ display
hi def link yueObject Type

" A constant-like name in SCREAMING_CAPS
syn match yueConstant /\<\u[A-Z0-9_]\+\>/ display
hi def link yueConstant Constant


" A variable name
syn cluster yueIdentifier contains=yueSpecialVar,yueObject,
\                                     yueConstant

" A non-interpolated string
syn cluster yueBasicString contains=@Spell,yueEscape
" An interpolated string
syn cluster yueInterpString contains=@yueBasicString,yueInterp

" Regular strings
syn region yueString start=/"/ skip=/\\\\\|\\"/ end=/"/
\                       contains=@yueInterpString
syn region yueString start=/'/ skip=/\\\\\|\\'/ end=/'/
\                       contains=@yueBasicString
hi def link yueString String

syn region yueString2 matchgroup=yueString start="\[\z(=*\)\[" end="\]\z1\]" contains=@Spell
hi def link yueString2 String


" A integer, including a leading plus or minus
syn match yueNumber /\i\@<![-+]\?\d\+\%([eE][+-]\?\d\+\)\?/ display
" A hex number
syn match yueNumber /\<0[xX]\x\+\>/ display
hi def link yueNumber Number

" A floating-point number, including a leading plus or minus
syn match yueFloat /\i\@<![-+]\?\d*\.\@<!\.\d\+\%([eE][+-]\?\d\+\)\?/
\                     display
hi def link yueFloat Float

" An error for reserved keywords
if !exists("yue_no_reserved_words_error")
  syn match yueReservedError /\<\%(end\|function\|repeat\)\>/
  \                             display
  hi def link yueReservedError Error
endif

" This is separate from `yueExtendedOp` since assignments require it.
syn match yueAssignOp /:/ contained display
hi def link yueAssignOp yueOperator

" Strings used in string assignments, which can't have interpolations
syn region yueAssignString start=/"/ skip=/\\\\\|\\"/ end=/"/ contained
\                             contains=@yueBasicString
syn region yueAssignString start=/'/ skip=/\\\\\|\\'/ end=/'/ contained
\                             contains=@yueBasicString
hi def link yueAssignString String

" A normal object assignment
syn match yueObjAssign /@\?\I\i*#\?:\@<!::\@!/
\                         contains=@yueIdentifier,yueAssignOp
hi def link yueObjAssign Identifier

" Short hand table literal assign
syn match yueShortHandAssign /:\@<!:@\?\I\i*#\?\s*/
\                         contains=@yueIdentifier,yueAssignOp
hi def link yueShortHandAssign Identifier

" An object-string assignment
syn match yueObjStringAssign /\("\|'\)[^\1]*\1\s*;\@<!::\@!'\@!/
\                               contains=yueAssignString,yueAssignOp
" An object-integer assignment
syn match yueObjNumberAssign /\d\+\%(\.\d\+\)\?\s*:\@<!::\@!/
\                               contains=yueNumber,yueAssignOp

syn keyword yueTodo TODO FIXME XXX contained
hi def link yueTodo Todo

syn match yueComment "\%^#!.*"
syn match yueComment /--.*/ contains=@Spell,yueTodo
hi def link yueComment Comment

syn region yueBlockComment start=/--\[\[/ end=/\]\]/
\                             contains=@Spell,yueTodo
hi def link yueBlockComment yueComment

syn region yueInterp matchgroup=yueInterpDelim start=/#{/ end=/}/ contained
\                       contains=@yueAll
hi def link yueInterpDelim PreProc

" A string escape sequence
syn match yueEscape /\\\d\d\d\|\\x\x\{2\}\|\\u\x\{4\}\|\\./ contained display
hi def link yueEscape SpecialChar

" Heredoc strings
" syn region yueHeredoc start=/"""/ end=/"""/ contains=@yueInterpString
" \                        fold
" syn region yueHeredoc start=/'''/ end=/'''/ contains=@yueBasicString
" \                        fold
" hi def link yueHeredoc String

" An error for trailing whitespace, as long as the line isn't just whitespace
if !exists("yue_no_trailing_space_error")
  syn match yueSpaceError /\S\@<=\s\+$/ display
  hi def link yueSpaceError Error
endif

" An error for trailing semicolons, for help transitioning from JavaScript
if !exists("yue_no_trailing_semicolon_error")
  syn match yueSemicolonError /;$/ display
  hi def link yueSemicolonError Error
endif

" Ignore reserved words in dot accesses.
syn match yueDotAccess /\.\@<!\.\s*\I\i*/he=s+1 contains=@yueIdentifier
hi def link yueDotAccess yueExtendedOp

" Ignore reserved words in slash accesses.
syn match yueSlashAccess /\\\@<!\\\s*\I\i*/he=s+1 contains=@yueIdentifier
hi def link yueSlashAccess yueExtendedOp

" Ignore reserved words in macro definition.
syn match yueMacroDef /\%(macro\s\+\)\@<=\s*\I\i*/he=s contains=@yueIdentifier
hi def link yueMacroDef yueExtendedOp

" This is required for interpolations to work.
syn region yueCurlies matchgroup=yueCurly start=/{/ end=/}/
\                        contains=@yueAll contained

" " These are highlighted the same as commas since they tend to go together.
" hi def link yueBlock yueSpecialOp
" hi def link yueBracket yueBlock
" hi def link yueCurly yueBlock
" hi def link yueParen yueBlock

" This is used instead of TOP to keep things yue-specific for good
" embedding. `contained` groups aren't included.
syn cluster yueAll contains=yueStatement,yueRepeat,yueConditional,
\                              yueKeyword,yueOperator,yueFunction,
\                              yueExtendedOp,yueSpecialOp,yueBoolean,
\                              yueNil,yueSpecialVar,yueObject,
\                              yueConstant,yueString,yueNumber,
\                              yueFloat,yueReservedError,yueObjAssign,
\                              yueObjStringAssign,yueObjNumberAssign,
\                              yueShortHandAssign,yueComment,yueLuaFunc,
\                              yueSpaceError,yueSemicolonError,
\                              yueDotAccess,
\                              yueCurlies

if !exists('b:current_syntax')
  let b:current_syntax = 'yue'
endif
