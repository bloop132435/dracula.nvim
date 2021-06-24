let g:colors_name = 'dracula'


let s:fg        = ['#F8F8F2', 253]
let s:bglighter = ['#424450', 238]
let s:bglight   = ['#281a26', 237]
let s:bg        = ['#181A26', 236]
let s:bgdark    = ['#21222C', 235]
let s:bgdarker  = ['#191A21', 234]
let s:comment   = ['#6272A4',  61]
let s:selection = ['#44475A', 239]
let s:subtle    = ['#424450', 238]
let s:cyan      = ['#8BE9FD', 117]
let s:green     = ['#50FA7B',  84]
let s:orange    = ['#FFB86C', 215]
let s:pink      = ['#FF79C6', 212]
let s:purple    = ['#BD93F9', 141]
let s:red       = ['#FF5555', 203]
let s:yellow    = ['#F1FA8C', 228]

let g:terminal_color_0  = '#21222C'
let g:terminal_color_1  = '#FF5555'
let g:terminal_color_2  = '#50FA7B'
let g:terminal_color_3  = '#F1FA8C'
let g:terminal_color_4  = '#BD93F9'
let g:terminal_color_5  = '#FF79C6'
let g:terminal_color_6  = '#8BE9FD'
let g:terminal_color_7  = '#F8F8F2'
let g:terminal_color_8  = '#6272A4'
let g:terminal_color_9  = '#FF6E6E'
let g:terminal_color_10 = '#69FF94'
let g:terminal_color_11 = '#FFFFA5'
let g:terminal_color_12 = '#D6ACFF'
let g:terminal_color_13 = '#FF92DF'
let g:terminal_color_14 = '#A4FFFF'
let g:terminal_color_15 = '#FFFFFF'

let s:none      = ['NONE', 'NONE']



" Script Helpers: 2


function! s:h(scope, fg, ...) " bg, attr_list, special
	let l:fg = copy(a:fg)
	let l:bg = get(a:, 1, ['NONE', 'NONE'])

	let l:attr_list = filter(get(a:, 2, ['NONE']), 'type(v:val) == 1')
	let l:attrs = len(l:attr_list) > 0 ? join(l:attr_list, ',') : 'NONE'

	" Falls back to coloring foreground group on terminals because
	" nearly all do not support undercurl
	let l:special = get(a:, 3, ['NONE', 'NONE'])
	if l:special[0] !=# 'NONE' && l:fg[0] ==# 'NONE' && !has('gui_running')
		let l:fg[0] = l:special[0]
		let l:fg[1] = l:special[1]
	endif

	let l:hl_string = [
				\ 'highlight', a:scope,
				\ 'guifg=' . l:fg[0], 'ctermfg=' . l:fg[1],
				\ 'guibg=' . l:bg[0], 'ctermbg=' . l:bg[1],
				\ 'gui=' . l:attrs, 'cterm=' . l:attrs,
				\ 'guisp=' . l:special[0],
				\]

	execute join(l:hl_string, ' ')
endfunction


" Dracula Highlight Groups:

call s:h('DraculaBgLight', s:none, s:bglight)
call s:h('DraculaBgLighter', s:none, s:bglighter)
call s:h('DraculaBgDark', s:none, s:bgdark)
call s:h('DraculaBgDarker', s:none, s:bgdarker)

call s:h('DraculaFg', s:fg)
call s:h('DraculaFgUnderline', s:fg, s:none, ["underline"])
call s:h('DraculaFgBold', s:fg, s:none, ["bold"])

call s:h('DraculaComment', s:comment)
call s:h('DraculaCommentBold', s:comment, s:none, ["bold"])

call s:h('DraculaSelection', s:none, s:selection)

call s:h('DraculaSubtle', s:subtle)

call s:h('DraculaCyan', s:cyan)
call s:h('DraculaCyanItalic', s:cyan, s:none, ["italic"])

call s:h('DraculaGreen', s:green)
call s:h('DraculaGreenBold', s:green, s:none, ["bold"])
call s:h('DraculaGreenItalic', s:green, s:none, ["italic"])
call s:h('DraculaGreenItalicUnderline', s:green, s:none, ["italic", "underline"])

call s:h('DraculaOrange', s:orange)
call s:h('DraculaOrangeBold', s:orange, s:none, ["bold"])
call s:h('DraculaOrangeItalic', s:orange, s:none, ["italic"])
call s:h('DraculaOrangeBoldItalic', s:orange, s:none, ["bold", "italic"])
call s:h('DraculaOrangeInverse', s:bg, s:orange)

call s:h('DraculaPink', s:pink)
call s:h('DraculaPinkItalic', s:pink, s:none, ["italic"])

call s:h('DraculaPurple', s:purple)
call s:h('DraculaPurpleBold', s:purple, s:none, ["bold"])
call s:h('DraculaPurpleItalic', s:purple, s:none, ["italic"])

call s:h('DraculaRed', s:red)
call s:h('DraculaRedInverse', s:fg, s:red)

call s:h('DraculaYellow', s:yellow)
call s:h('DraculaYellowItalic', s:yellow, s:none, ["italic"])

call s:h('DraculaError', s:red, s:none, [], s:red)

call s:h('DraculaErrorLine', s:none, s:none, ["undercurl"], s:red)
call s:h('DraculaWarnLine', s:none, s:none, ["undercurl"], s:orange)
call s:h('DraculaInfoLine', s:none, s:none, ["undercurl"], s:cyan)

call s:h('DraculaTodo', s:cyan, s:none, ["bold", "inverse"])
call s:h('DraculaSearch', s:green, s:none, ["inverse"])
call s:h('DraculaBoundary', s:comment, s:bgdark)
call s:h('DraculaLink', s:cyan, s:none, ["underline"])

call s:h('DraculaDiffChange', s:orange, s:none)
call s:h('DraculaDiffText', s:bg, s:orange)
call s:h('DraculaDiffDelete', s:red, s:bgdark)



set background=dark

" Required as some plugins will overwrite
call s:h('Normal', s:fg,s:bg )
call s:h('StatusLine', s:none, s:bglighter, ["bold"])
call s:h('StatusLineNC', s:none, s:bglight)
call s:h('StatusLineTerm', s:none, s:bglighter, ["bold"])
call s:h('StatusLineTermNC', s:none, s:bglight)
call s:h('WildMenu', s:bg, s:purple, ["bold"])
call s:h('CursorLine', s:none, s:subtle)

hi! link ColorColumn  DraculaBgDark
hi! link CursorColumn CursorLine
hi! link CursorLineNr DraculaYellow
hi! link DiffAdd      DraculaGreen
hi! link DiffAdded    DiffAdd
hi! link DiffChange   DraculaDiffChange
hi! link DiffDelete   DraculaDiffDelete
hi! link DiffRemoved  DiffDelete
hi! link DiffText     DraculaDiffText
hi! link Directory    DraculaPurpleBold
hi! link ErrorMsg     DraculaRedInverse
hi! link FoldColumn   DraculaSubtle
hi! link Folded       DraculaBoundary
hi! link IncSearch    DraculaOrangeInverse
call s:h('LineNr', s:comment)
hi! link MoreMsg      DraculaFgBold
hi! link NonText      DraculaSubtle
hi! link Pmenu        DraculaBgDark
hi! link PmenuSbar    DraculaBgDark
hi! link PmenuSel     DraculaSelection
hi! link PmenuThumb   DraculaSelection
hi! link Question     DraculaFgBold
hi! link Search       DraculaSearch
call s:h('SignColumn', s:comment)
hi! link TabLine      DraculaBoundary
hi! link TabLineFill  DraculaBgDarker
hi! link TabLineSel   Normal
hi! link Title        DraculaGreenBold
hi! link VertSplit    DraculaBoundary
hi! link Visual       DraculaSelection
hi! link VisualNOS    Visual
hi! link WarningMsg   DraculaOrangeInverse

" Syntax:

" Required as some plugins will overwrite
call s:h('MatchParen', s:green, s:none, ["underline"])
call s:h('Conceal', s:cyan, s:none)

hi! link SpecialKey DraculaRed
hi! link LspReferenceText DraculaSelection
hi! link LspReferenceRead DraculaSelection
hi! link LspReferenceWrite DraculaSelection
hi! link LspDiagnosticsDefaultInformation DraculaCyan
hi! link LspDiagnosticsDefaultHint DraculaCyan
hi! link LspDiagnosticsDefaultError DraculaError
hi! link LspDiagnosticsDefaultWarning DraculaOrange
hi! link LspDiagnosticsUnderlineError DraculaErrorLine
hi! link LspDiagnosticsUnderlineHint DraculaInfoLine
hi! link LspDiagnosticsUnderlineInformation DraculaInfoLine
hi! link LspDiagnosticsUnderlineWarning DraculaWarnLine

hi! link Comment DraculaComment
hi! link Underlined DraculaFgUnderline
hi! link Todo DraculaTodo

hi! link Error DraculaError
hi! link SpellBad DraculaErrorLine
hi! link SpellLocal DraculaWarnLine
hi! link SpellCap DraculaInfoLine
hi! link SpellRare DraculaInfoLine

hi! link Constant DraculaPurple
hi! link String DraculaYellow
hi! link Character DraculaPink
hi! link Number Constant
hi! link Boolean Constant
hi! link Float Constant

hi! link Identifier DraculaFg
hi! link Function DraculaGreen

hi! link Statement DraculaPink
hi! link Conditional DraculaPink
hi! link Repeat DraculaPink
hi! link Label DraculaPink
hi! link Operator DraculaPink
hi! link Keyword DraculaPink
hi! link Exception DraculaPink

hi! link PreProc DraculaPink
hi! link Include DraculaPink
hi! link Define DraculaPink
hi! link Macro DraculaPink
hi! link PreCondit DraculaPink
hi! link StorageClass DraculaPink
hi! link Structure DraculaPink
hi! link Typedef DraculaPink

hi! link Type DraculaCyanItalic

hi! link Delimiter DraculaFg

hi! link Special DraculaPink
hi! link SpecialComment DraculaCyan
hi! link Tag DraculaCyan
hi! link helpHyperTextJump DraculaLink
hi! link helpCommand DraculaPurple
hi! link helpExample DraculaGreen
hi! link helpBacktick Special


hi! link TSInclude PreProc
hi! link TSConstMacro PreProc
hi! link TSProperty DraculaPurple
hi! link TSNamespace DraculaPurple
hi! link TSRepeat DraculaPurpleItalic


" # Misc
hi! link TSPunctSpecial Special
" # Constants
hi! link TSConstMacro Macro
hi! link TSStringEscape Character
hi! link TSSymbol DraculaPurple
hi! link TSAnnotation DraculaYellow
hi! link TSAttribute DraculaGreenItalic
hi! link TSFuncBuiltin DraculaCyan
hi! link TSFuncMacro Function
hi! link TSParameter DraculaOrangeItalic
hi! link TSParameterReference DraculaOrange
hi! link TSField DraculaOrange
hi! link TSConstructor DraculaCyan
hi! link TSLabel DraculaPurpleItalic
hi! link TSVariableBuiltin DraculaPurpleItalic
hi! link TSStrong DraculaFgBold
hi! link TSEmphasis DraculaFg
hi! link TSUnderline Underlined
hi! link TSTitle DraculaYellow
hi! link TSLiteral DraculaYellow
hi! link TSURI DraculaYellow
