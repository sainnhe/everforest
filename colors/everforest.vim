" -----------------------------------------------------------------------------
" Name:         Everforest
" Description:  Comfortable & Pleasant Color Scheme for Vim
" Author:       sainnhe <i@sainnhe.dev>
" Website:      https://github.com/sainnhe/everforest
" License:      MIT
" -----------------------------------------------------------------------------

" Initialization: {{{
let s:configuration = everforest#get_configuration()
let s:palette = everforest#get_palette(s:configuration.background, s:configuration.colors_override)
let s:path = expand('<sfile>:p') " the path of this script
let s:last_modified = 'Fri Sep  9 13:00:23 UTC 2022'
let g:everforest_loaded_file_types = []

if !(exists('g:colors_name') && g:colors_name ==# 'everforest' && s:configuration.better_performance)
  highlight clear
  if exists('syntax_on')
    syntax reset
  endif
endif

let g:colors_name = 'everforest'

if !(has('termguicolors') && &termguicolors) && !has('gui_running') && &t_Co != 256
  finish
endif
" }}}
" Common Highlight Groups: {{{
" UI: {{{
if s:configuration.transparent_background >= 1
  call everforest#highlight('Normal', s:palette.fg, s:palette.none)
  call everforest#highlight('Terminal', s:palette.fg, s:palette.none)
  if s:configuration.show_eob
    call everforest#highlight('EndOfBuffer', s:palette.bg4, s:palette.none)
  else
    call everforest#highlight('EndOfBuffer', s:palette.bg0, s:palette.none)
  endif
  if s:configuration.ui_contrast ==# 'low'
    call everforest#highlight('FoldColumn', s:palette.bg5, s:palette.none)
  else
    call everforest#highlight('FoldColumn', s:palette.grey0, s:palette.none)
  endif
  call everforest#highlight('Folded', s:palette.grey1, s:palette.none)
  call everforest#highlight('SignColumn', s:palette.fg, s:palette.none)
  call everforest#highlight('ToolbarLine', s:palette.fg, s:palette.none)
else
  call everforest#highlight('Normal', s:palette.fg, s:palette.bg0)
  call everforest#highlight('Terminal', s:palette.fg, s:palette.bg0)
  if s:configuration.show_eob
    call everforest#highlight('EndOfBuffer', s:palette.bg4, s:palette.bg0)
  else
    call everforest#highlight('EndOfBuffer', s:palette.bg0, s:palette.bg0)
  endif
  call everforest#highlight('Folded', s:palette.grey1, s:palette.bg1)
  call everforest#highlight('ToolbarLine', s:palette.fg, s:palette.bg2)
  if s:configuration.sign_column_background ==# 'grey'
    call everforest#highlight('SignColumn', s:palette.fg, s:palette.bg1)
    call everforest#highlight('FoldColumn', s:palette.grey2, s:palette.bg1)
  else
    call everforest#highlight('SignColumn', s:palette.fg, s:palette.none)
    if s:configuration.ui_contrast ==# 'low'
      call everforest#highlight('FoldColumn', s:palette.bg5, s:palette.none)
    else
      call everforest#highlight('FoldColumn', s:palette.grey0, s:palette.none)
    endif
  endif
endif
call everforest#highlight('IncSearch', s:palette.bg0, s:palette.red)
call everforest#highlight('Search', s:palette.bg0, s:palette.green)
call everforest#highlight('ColorColumn', s:palette.none, s:palette.bg1)
if s:configuration.ui_contrast ==# 'low'
  call everforest#highlight('Conceal', s:palette.bg5, s:palette.none)
else
  call everforest#highlight('Conceal', s:palette.grey0, s:palette.none)
endif
if s:configuration.cursor ==# 'auto'
  call everforest#highlight('Cursor', s:palette.none, s:palette.none, 'reverse')
else
  call everforest#highlight('Cursor', s:palette.bg0, s:palette[s:configuration.cursor])
endif
highlight! link vCursor Cursor
highlight! link iCursor Cursor
highlight! link lCursor Cursor
highlight! link CursorIM Cursor
if &diff
  call everforest#highlight('CursorLine', s:palette.none, s:palette.none, 'underline')
  call everforest#highlight('CursorColumn', s:palette.none, s:palette.none, 'bold')
else
  call everforest#highlight('CursorLine', s:palette.none, s:palette.bg1)
  call everforest#highlight('CursorColumn', s:palette.none, s:palette.bg1)
endif
if s:configuration.ui_contrast ==# 'low'
  call everforest#highlight('LineNr', s:palette.bg5, s:palette.none)
  if &diff
    call everforest#highlight('CursorLineNr', s:palette.grey1, s:palette.none, 'underline')
  elseif (&relativenumber == 1 && &cursorline == 0) || s:configuration.sign_column_background ==# 'none'
    call everforest#highlight('CursorLineNr', s:palette.grey1, s:palette.none)
  else
    call everforest#highlight('CursorLineNr', s:palette.grey1, s:palette.bg1)
  endif
else
  call everforest#highlight('LineNr', s:palette.grey0, s:palette.none)
  if &diff
    call everforest#highlight('CursorLineNr', s:palette.grey2, s:palette.none, 'underline')
  elseif (&relativenumber == 1 && &cursorline == 0) || s:configuration.sign_column_background ==# 'none'
    call everforest#highlight('CursorLineNr', s:palette.grey2, s:palette.none)
  else
    call everforest#highlight('CursorLineNr', s:palette.grey2, s:palette.bg1)
  endif
endif
call everforest#highlight('DiffAdd', s:palette.none, s:palette.bg_green)
call everforest#highlight('DiffChange', s:palette.none, s:palette.bg_blue)
call everforest#highlight('DiffDelete', s:palette.none, s:palette.bg_red)
call everforest#highlight('DiffText', s:palette.bg0, s:palette.blue)
call everforest#highlight('Directory', s:palette.green, s:palette.none)
call everforest#highlight('ErrorMsg', s:palette.red, s:palette.none, 'bold,underline')
call everforest#highlight('WarningMsg', s:palette.yellow, s:palette.none, 'bold')
call everforest#highlight('ModeMsg', s:palette.fg, s:palette.none, 'bold')
call everforest#highlight('MoreMsg', s:palette.yellow, s:palette.none, 'bold')
call everforest#highlight('MatchParen', s:palette.none, s:palette.bg4)
call everforest#highlight('NonText', s:palette.bg4, s:palette.none)
call everforest#highlight('Whitespace', s:palette.bg4, s:palette.none)
call everforest#highlight('SpecialKey', s:palette.bg3, s:palette.none)
call everforest#highlight('Pmenu', s:palette.fg, s:palette.bg2)
call everforest#highlight('PmenuSbar', s:palette.none, s:palette.bg2)
call everforest#highlight('PmenuSel', s:palette.bg0, s:palette.statusline1)
highlight! link WildMenu PmenuSel
call everforest#highlight('PmenuThumb', s:palette.none, s:palette.grey0)
call everforest#highlight('NormalFloat', s:palette.fg, s:palette.bg2)
call everforest#highlight('FloatBorder', s:palette.grey1, s:palette.bg2)
call everforest#highlight('Question', s:palette.yellow, s:palette.none)
if s:configuration.spell_foreground ==# 'none'
  call everforest#highlight('SpellBad', s:palette.none, s:palette.none, 'undercurl', s:palette.red)
  call everforest#highlight('SpellCap', s:palette.none, s:palette.none, 'undercurl', s:palette.blue)
  call everforest#highlight('SpellLocal', s:palette.none, s:palette.none, 'undercurl', s:palette.aqua)
  call everforest#highlight('SpellRare', s:palette.none, s:palette.none, 'undercurl', s:palette.purple)
else
  call everforest#highlight('SpellBad', s:palette.red, s:palette.none, 'undercurl', s:palette.red)
  call everforest#highlight('SpellCap', s:palette.blue, s:palette.none, 'undercurl', s:palette.blue)
  call everforest#highlight('SpellLocal', s:palette.aqua, s:palette.none, 'undercurl', s:palette.aqua)
  call everforest#highlight('SpellRare', s:palette.purple, s:palette.none, 'undercurl', s:palette.purple)
endif
if s:configuration.transparent_background == 2
  call everforest#highlight('StatusLine', s:palette.grey1, s:palette.none)
  call everforest#highlight('StatusLineTerm', s:palette.grey1, s:palette.none)
  call everforest#highlight('StatusLineNC', s:palette.grey1, s:palette.none)
  call everforest#highlight('StatusLineTermNC', s:palette.grey1, s:palette.none)
  call everforest#highlight('TabLine', s:palette.grey2, s:palette.bg3)
  call everforest#highlight('TabLineFill', s:palette.grey1, s:palette.none)
  call everforest#highlight('TabLineSel', s:palette.bg0, s:palette.statusline1)
else
  call everforest#highlight('StatusLine', s:palette.grey1, s:palette.bg2)
  call everforest#highlight('StatusLineTerm', s:palette.grey1, s:palette.bg1)
  call everforest#highlight('StatusLineNC', s:palette.grey1, s:palette.bg1)
  call everforest#highlight('StatusLineTermNC', s:palette.grey1, s:palette.bg0)
  call everforest#highlight('TabLine', s:palette.grey2, s:palette.bg3)
  call everforest#highlight('TabLineFill', s:palette.grey1, s:palette.bg1)
  call everforest#highlight('TabLineSel', s:palette.bg0, s:palette.statusline1)
endif
call everforest#highlight('VertSplit', s:palette.bg4, s:palette.none)
highlight! link WinSeparator VertSplit
call everforest#highlight('Visual', s:palette.none, s:palette.bg_visual)
call everforest#highlight('VisualNOS', s:palette.none, s:palette.bg_visual)
call everforest#highlight('QuickFixLine', s:palette.purple, s:palette.none, 'bold')
call everforest#highlight('Debug', s:palette.orange, s:palette.none)
call everforest#highlight('debugPC', s:palette.bg0, s:palette.green)
call everforest#highlight('debugBreakpoint', s:palette.bg0, s:palette.red)
call everforest#highlight('ToolbarButton', s:palette.bg0, s:palette.green)
if has('nvim')
  call everforest#highlight('Substitute', s:palette.bg0, s:palette.yellow)
  highlight! link WinBarNC Grey
  highlight! link DiagnosticFloatingError ErrorFloat
  highlight! link DiagnosticFloatingWarn WarningFloat
  highlight! link DiagnosticFloatingInfo InfoFloat
  highlight! link DiagnosticFloatingHint HintFloat
  highlight! link DiagnosticError ErrorText
  highlight! link DiagnosticWarn WarningText
  highlight! link DiagnosticInfo InfoText
  highlight! link DiagnosticHint HintText
  highlight! link DiagnosticVirtualTextError VirtualTextError
  highlight! link DiagnosticVirtualTextWarn VirtualTextWarning
  highlight! link DiagnosticVirtualTextInfo VirtualTextInfo
  highlight! link DiagnosticVirtualTextHint VirtualTextHint
  highlight! link DiagnosticUnderlineError ErrorText
  highlight! link DiagnosticUnderlineWarn WarningText
  highlight! link DiagnosticUnderlineInfo InfoText
  highlight! link DiagnosticUnderlineHint HintText
  highlight! link DiagnosticSignError RedSign
  highlight! link DiagnosticSignWarn YellowSign
  highlight! link DiagnosticSignInfo BlueSign
  highlight! link DiagnosticSignHint GreenSign
  highlight! link LspDiagnosticsFloatingError DiagnosticFloatingError
  highlight! link LspDiagnosticsFloatingWarning DiagnosticFloatingWarn
  highlight! link LspDiagnosticsFloatingInformation DiagnosticFloatingInfo
  highlight! link LspDiagnosticsFloatingHint DiagnosticFloatingHint
  highlight! link LspDiagnosticsDefaultError DiagnosticError
  highlight! link LspDiagnosticsDefaultWarning DiagnosticWarn
  highlight! link LspDiagnosticsDefaultInformation DiagnosticInfo
  highlight! link LspDiagnosticsDefaultHint DiagnosticHint
  highlight! link LspDiagnosticsVirtualTextError DiagnosticVirtualTextError
  highlight! link LspDiagnosticsVirtualTextWarning DiagnosticVirtualTextWarn
  highlight! link LspDiagnosticsVirtualTextInformation DiagnosticVirtualTextInfo
  highlight! link LspDiagnosticsVirtualTextHint DiagnosticVirtualTextHint
  highlight! link LspDiagnosticsUnderlineError DiagnosticUnderlineError
  highlight! link LspDiagnosticsUnderlineWarning DiagnosticUnderlineWarn
  highlight! link LspDiagnosticsUnderlineInformation DiagnosticUnderlineInfo
  highlight! link LspDiagnosticsUnderlineHint DiagnosticUnderlineHint
  highlight! link LspDiagnosticsSignError DiagnosticSignError
  highlight! link LspDiagnosticsSignWarning DiagnosticSignWarn
  highlight! link LspDiagnosticsSignInformation DiagnosticSignInfo
  highlight! link LspDiagnosticsSignHint DiagnosticSignHint
  highlight! link LspReferenceText CurrentWord
  highlight! link LspReferenceRead CurrentWord
  highlight! link LspReferenceWrite CurrentWord
  highlight! link LspCodeLens VirtualTextInfo
  highlight! link LspCodeLensSeparator VirtualTextHint
  highlight! link LspSignatureActiveParameter Search
  highlight! link TermCursor Cursor
  highlight! link healthError Red
  highlight! link healthSuccess Green
  highlight! link healthWarning Yellow
endif
" }}}
" Syntax: {{{
call everforest#highlight('Boolean', s:palette.purple, s:palette.none)
call everforest#highlight('Number', s:palette.purple, s:palette.none)
call everforest#highlight('Float', s:palette.purple, s:palette.none)
if s:configuration.enable_italic
  call everforest#highlight('PreProc', s:palette.purple, s:palette.none, 'italic')
  call everforest#highlight('PreCondit', s:palette.purple, s:palette.none, 'italic')
  call everforest#highlight('Include', s:palette.purple, s:palette.none, 'italic')
  call everforest#highlight('Define', s:palette.purple, s:palette.none, 'italic')
  call everforest#highlight('Conditional', s:palette.red, s:palette.none, 'italic')
  call everforest#highlight('Repeat', s:palette.red, s:palette.none, 'italic')
  call everforest#highlight('Keyword', s:palette.red, s:palette.none, 'italic')
  call everforest#highlight('Typedef', s:palette.red, s:palette.none, 'italic')
  call everforest#highlight('Exception', s:palette.red, s:palette.none, 'italic')
  call everforest#highlight('Statement', s:palette.red, s:palette.none, 'italic')
else
  call everforest#highlight('PreProc', s:palette.purple, s:palette.none)
  call everforest#highlight('PreCondit', s:palette.purple, s:palette.none)
  call everforest#highlight('Include', s:palette.purple, s:palette.none)
  call everforest#highlight('Define', s:palette.purple, s:palette.none)
  call everforest#highlight('Conditional', s:palette.red, s:palette.none)
  call everforest#highlight('Repeat', s:palette.red, s:palette.none)
  call everforest#highlight('Keyword', s:palette.red, s:palette.none)
  call everforest#highlight('Typedef', s:palette.red, s:palette.none)
  call everforest#highlight('Exception', s:palette.red, s:palette.none)
  call everforest#highlight('Statement', s:palette.red, s:palette.none)
endif
call everforest#highlight('Error', s:palette.red, s:palette.none)
call everforest#highlight('StorageClass', s:palette.orange, s:palette.none)
call everforest#highlight('Tag', s:palette.orange, s:palette.none)
call everforest#highlight('Label', s:palette.orange, s:palette.none)
call everforest#highlight('Structure', s:palette.orange, s:palette.none)
call everforest#highlight('Operator', s:palette.orange, s:palette.none)
call everforest#highlight('Title', s:palette.orange, s:palette.none, 'bold')
call everforest#highlight('Special', s:palette.yellow, s:palette.none)
call everforest#highlight('SpecialChar', s:palette.yellow, s:palette.none)
call everforest#highlight('Type', s:palette.yellow, s:palette.none)
call everforest#highlight('Function', s:palette.green, s:palette.none)
call everforest#highlight('String', s:palette.green, s:palette.none)
call everforest#highlight('Character', s:palette.green, s:palette.none)
call everforest#highlight('Constant', s:palette.aqua, s:palette.none)
call everforest#highlight('Macro', s:palette.aqua, s:palette.none)
call everforest#highlight('Identifier', s:palette.blue, s:palette.none)
if s:configuration.disable_italic_comment
  call everforest#highlight('Comment', s:palette.grey1, s:palette.none)
  call everforest#highlight('SpecialComment', s:palette.grey1, s:palette.none)
  call everforest#highlight('Todo', s:palette.purple, s:palette.none)
else
  call everforest#highlight('Comment', s:palette.grey1, s:palette.none, 'italic')
  call everforest#highlight('SpecialComment', s:palette.grey1, s:palette.none, 'italic')
  call everforest#highlight('Todo', s:palette.purple, s:palette.none, 'italic')
endif
call everforest#highlight('Delimiter', s:palette.fg, s:palette.none)
call everforest#highlight('Ignore', s:palette.grey1, s:palette.none)
call everforest#highlight('Underlined', s:palette.none, s:palette.none, 'underline')
" }}}
" Predefined Highlight Groups: {{{
call everforest#highlight('Fg', s:palette.fg, s:palette.none)
call everforest#highlight('Grey', s:palette.grey1, s:palette.none)
call everforest#highlight('Red', s:palette.red, s:palette.none)
call everforest#highlight('Orange', s:palette.orange, s:palette.none)
call everforest#highlight('Yellow', s:palette.yellow, s:palette.none)
call everforest#highlight('Green', s:palette.green, s:palette.none)
call everforest#highlight('Aqua', s:palette.aqua, s:palette.none)
call everforest#highlight('Blue', s:palette.blue, s:palette.none)
call everforest#highlight('Purple', s:palette.purple, s:palette.none)
if s:configuration.enable_italic
  call everforest#highlight('RedItalic', s:palette.red, s:palette.none, 'italic')
  call everforest#highlight('OrangeItalic', s:palette.orange, s:palette.none, 'italic')
  call everforest#highlight('YellowItalic', s:palette.yellow, s:palette.none, 'italic')
  call everforest#highlight('GreenItalic', s:palette.green, s:palette.none, 'italic')
  call everforest#highlight('AquaItalic', s:palette.aqua, s:palette.none, 'italic')
  call everforest#highlight('BlueItalic', s:palette.blue, s:palette.none, 'italic')
  call everforest#highlight('PurpleItalic', s:palette.purple, s:palette.none, 'italic')
else
  call everforest#highlight('RedItalic', s:palette.red, s:palette.none)
  call everforest#highlight('OrangeItalic', s:palette.orange, s:palette.none)
  call everforest#highlight('YellowItalic', s:palette.yellow, s:palette.none)
  call everforest#highlight('GreenItalic', s:palette.green, s:palette.none)
  call everforest#highlight('AquaItalic', s:palette.aqua, s:palette.none)
  call everforest#highlight('BlueItalic', s:palette.blue, s:palette.none)
  call everforest#highlight('PurpleItalic', s:palette.purple, s:palette.none)
endif
if s:configuration.transparent_background || s:configuration.sign_column_background ==# 'none'
  call everforest#highlight('RedSign', s:palette.red, s:palette.none)
  call everforest#highlight('OrangeSign', s:palette.orange, s:palette.none)
  call everforest#highlight('YellowSign', s:palette.yellow, s:palette.none)
  call everforest#highlight('GreenSign', s:palette.green, s:palette.none)
  call everforest#highlight('AquaSign', s:palette.aqua, s:palette.none)
  call everforest#highlight('BlueSign', s:palette.blue, s:palette.none)
  call everforest#highlight('PurpleSign', s:palette.purple, s:palette.none)
else
  call everforest#highlight('RedSign', s:palette.red, s:palette.bg1)
  call everforest#highlight('OrangeSign', s:palette.orange, s:palette.bg1)
  call everforest#highlight('YellowSign', s:palette.yellow, s:palette.bg1)
  call everforest#highlight('GreenSign', s:palette.green, s:palette.bg1)
  call everforest#highlight('AquaSign', s:palette.aqua, s:palette.bg1)
  call everforest#highlight('BlueSign', s:palette.blue, s:palette.bg1)
  call everforest#highlight('PurpleSign', s:palette.purple, s:palette.bg1)
endif
if s:configuration.diagnostic_text_highlight
  call everforest#highlight('ErrorText', s:palette.none, s:palette.bg_red, 'undercurl', s:palette.red)
  call everforest#highlight('WarningText', s:palette.none, s:palette.bg_yellow, 'undercurl', s:palette.yellow)
  call everforest#highlight('InfoText', s:palette.none, s:palette.bg_blue, 'undercurl', s:palette.blue)
  call everforest#highlight('HintText', s:palette.none, s:palette.bg_green, 'undercurl', s:palette.green)
else
  call everforest#highlight('ErrorText', s:palette.none, s:palette.none, 'undercurl', s:palette.red)
  call everforest#highlight('WarningText', s:palette.none, s:palette.none, 'undercurl', s:palette.yellow)
  call everforest#highlight('InfoText', s:palette.none, s:palette.none, 'undercurl', s:palette.blue)
  call everforest#highlight('HintText', s:palette.none, s:palette.none, 'undercurl', s:palette.green)
endif
if s:configuration.diagnostic_line_highlight
  call everforest#highlight('ErrorLine', s:palette.none, s:palette.bg_red)
  call everforest#highlight('WarningLine', s:palette.none, s:palette.bg_yellow)
  call everforest#highlight('InfoLine', s:palette.none, s:palette.bg_blue)
  call everforest#highlight('HintLine', s:palette.none, s:palette.bg_green)
else
  highlight clear ErrorLine
  highlight clear WarningLine
  highlight clear InfoLine
  highlight clear HintLine
endif
if s:configuration.diagnostic_virtual_text ==# 'grey'
  highlight! link VirtualTextWarning Grey
  highlight! link VirtualTextError Grey
  highlight! link VirtualTextInfo Grey
  highlight! link VirtualTextHint Grey
else
  highlight! link VirtualTextWarning Yellow
  highlight! link VirtualTextError Red
  highlight! link VirtualTextInfo Blue
  highlight! link VirtualTextHint Green
endif
call everforest#highlight('ErrorFloat', s:palette.red, s:palette.bg2)
call everforest#highlight('WarningFloat', s:palette.yellow, s:palette.bg2)
call everforest#highlight('InfoFloat', s:palette.blue, s:palette.bg2)
call everforest#highlight('HintFloat', s:palette.green, s:palette.bg2)
if &diff
  call everforest#highlight('CurrentWord', s:palette.bg0, s:palette.green)
elseif s:configuration.current_word ==# 'grey background'
  call everforest#highlight('CurrentWord', s:palette.none, s:palette.bg2)
else
  call everforest#highlight('CurrentWord', s:palette.none, s:palette.none, s:configuration.current_word)
endif
" }}}
" }}}
" Terminal: {{{
if ((has('termguicolors') && &termguicolors) || has('gui_running')) && !s:configuration.disable_terminal_colors
  " Definition
  let s:terminal = {
        \ 'black':    &background ==# 'dark' ? s:palette.bg3 : s:palette.fg,
        \ 'red':      s:palette.red,
        \ 'yellow':   s:palette.yellow,
        \ 'green':    s:palette.green,
        \ 'cyan':     s:palette.aqua,
        \ 'blue':     s:palette.blue,
        \ 'purple':   s:palette.purple,
        \ 'white':    &background ==# 'dark' ? s:palette.fg : s:palette.bg3,
        \ }
  " Implementation: {{{
  if !has('nvim')
    let g:terminal_ansi_colors = [s:terminal.black[0], s:terminal.red[0], s:terminal.green[0], s:terminal.yellow[0],
          \ s:terminal.blue[0], s:terminal.purple[0], s:terminal.cyan[0], s:terminal.white[0], s:terminal.black[0], s:terminal.red[0],
          \ s:terminal.green[0], s:terminal.yellow[0], s:terminal.blue[0], s:terminal.purple[0], s:terminal.cyan[0], s:terminal.white[0]]
  else
    let g:terminal_color_0 = s:terminal.black[0]
    let g:terminal_color_1 = s:terminal.red[0]
    let g:terminal_color_2 = s:terminal.green[0]
    let g:terminal_color_3 = s:terminal.yellow[0]
    let g:terminal_color_4 = s:terminal.blue[0]
    let g:terminal_color_5 = s:terminal.purple[0]
    let g:terminal_color_6 = s:terminal.cyan[0]
    let g:terminal_color_7 = s:terminal.white[0]
    let g:terminal_color_8 = s:terminal.black[0]
    let g:terminal_color_9 = s:terminal.red[0]
    let g:terminal_color_10 = s:terminal.green[0]
    let g:terminal_color_11 = s:terminal.yellow[0]
    let g:terminal_color_12 = s:terminal.blue[0]
    let g:terminal_color_13 = s:terminal.purple[0]
    let g:terminal_color_14 = s:terminal.cyan[0]
    let g:terminal_color_15 = s:terminal.white[0]
  endif
  " }}}
endif
" }}}
" Plugins: {{{
" nvim-treesitter/nvim-treesitter {{{
call everforest#highlight('TSStrong', s:palette.none, s:palette.none, 'bold')
call everforest#highlight('TSEmphasis', s:palette.none, s:palette.none, 'italic')
call everforest#highlight('TSUnderline', s:palette.none, s:palette.none, 'underline')
call everforest#highlight('TSNote', s:palette.bg0, s:palette.blue, 'bold')
call everforest#highlight('TSWarning', s:palette.bg0, s:palette.yellow, 'bold')
call everforest#highlight('TSDanger', s:palette.bg0, s:palette.red, 'bold')
highlight! link TSAnnotation Purple
highlight! link TSAttribute Purple
highlight! link TSBoolean Purple
highlight! link TSCharacter Aqua
highlight! link TSComment Comment
highlight! link TSConditional Red
highlight! link TSConstBuiltin BlueItalic
highlight! link TSConstMacro BlueItalic
highlight! link TSConstant Fg
highlight! link TSConstructor Green
highlight! link TSException Red
highlight! link TSField Green
highlight! link TSFloat Purple
highlight! link TSFuncBuiltin Green
highlight! link TSFuncMacro Green
highlight! link TSFunction Green
highlight! link TSInclude Red
highlight! link TSKeyword Red
highlight! link TSKeywordFunction Red
highlight! link TSKeywordOperator Orange
highlight! link TSLabel Orange
highlight! link TSMethod Green
highlight! link TSNamespace YellowItalic
highlight! link TSNone Fg
highlight! link TSNumber Purple
highlight! link TSOperator Orange
highlight! link TSParameter Fg
highlight! link TSParameterReference Fg
highlight! link TSProperty Fg
highlight! link TSPunctBracket Fg
highlight! link TSPunctDelimiter Grey
highlight! link TSPunctSpecial Blue
highlight! link TSRepeat Red
highlight! link TSStorageClass Orange
highlight! link TSString Aqua
highlight! link TSStringEscape Green
highlight! link TSStringRegex Green
highlight! link TSSymbol Fg
highlight! link TSTag Orange
highlight! link TSTagDelimiter Green
highlight! link TSText Green
highlight! link TSStrike Grey
highlight! link TSMath Blue
highlight! link TSType Yellow
highlight! link TSTypeBuiltin YellowItalic
highlight! link TSURI markdownUrl
highlight! link TSVariable Fg
highlight! link TSVariableBuiltin BlueItalic
if has('nvim-0.8.0')
  highlight! link @annotation TSAnnotation
  highlight! link @attribute TSAttribute
  highlight! link @boolean TSBoolean
  highlight! link @character TSCharacter
  highlight! link @comment TSComment
  highlight! link @conditional TSConditional
  highlight! link @constant TSConstant
  highlight! link @constant.builtin TSConstBuiltin
  highlight! link @constant.macro TSConstMacro
  highlight! link @constructor TSConstructor
  highlight! link @exception TSException
  highlight! link @field TSField
  highlight! link @float TSFloat
  highlight! link @function TSFunction
  highlight! link @function.builtin TSFuncBuiltin
  highlight! link @function.macro TSFuncMacro
  highlight! link @include TSInclude
  highlight! link @keyword TSKeyword
  highlight! link @keyword.function TSKeywordFunction
  highlight! link @keyword.operator TSKeywordOperator
  highlight! link @label TSLabel
  highlight! link @method TSMethod
  highlight! link @namespace TSNamespace
  highlight! link @none TSNone
  highlight! link @number TSNumber
  highlight! link @operator TSOperator
  highlight! link @parameter TSParameter
  highlight! link @parameter.reference TSParameterReference
  highlight! link @property TSProperty
  highlight! link @punctuation.bracket TSPunctBracket
  highlight! link @punctuation.delimiter TSPunctDelimiter
  highlight! link @punctuation.special TSPunctSpecial
  highlight! link @repeat TSRepeat
  highlight! link @storageclass TSStorageClass
  highlight! link @string TSString
  highlight! link @string.escape TSStringEscape
  highlight! link @string.regex TSStringRegex
  highlight! link @symbol TSSymbol
  highlight! link @tag TSTag
  highlight! link @tag.delimiter TSTagDelimiter
  highlight! link @text TSText
  highlight! link @strike TSStrike
  highlight! link @math TSMath
  highlight! link @type TSType
  highlight! link @type.builtin TSTypeBuiltin
  highlight! link @uri TSURI
  highlight! link @variable TSVariable
  highlight! link @variable.builtin TSVariableBuiltin
endif
" }}}
" neoclide/coc.nvim {{{
call everforest#highlight('CocHoverRange', s:palette.none, s:palette.none, 'bold,underline')
call everforest#highlight('CocSearch', s:palette.green, s:palette.none, 'bold')
call everforest#highlight('CocPumSearch', s:palette.green, s:palette.none, 'bold')
call everforest#highlight('CocMarkdownHeader', s:palette.orange, s:palette.none, 'bold')
call everforest#highlight('CocMarkdownLink', s:palette.green, s:palette.none, 'underline')
highlight! link CocMarkdownCode Green
highlight! link CocPumShortcut Grey
highlight! link CocPumVirtualText Grey
highlight! link CocPumMenu Pmenu
highlight! link CocMenuSel PmenuSel
highlight! link CocDisabled Grey
highlight! link CocSnippetVisual DiffAdd
highlight! link CocInlayHint LineNr
highlight! link CocNotificationProgress Green
highlight! link CocNotificationButton PmenuSel
highlight! link CocSemClass TSType
highlight! link CocSemEnum TSType
highlight! link CocSemInterface TSType
highlight! link CocSemStruct TSType
highlight! link CocSemTypeParameter TSType
highlight! link CocSemVariable TSVariable
highlight! link CocSemEnumMember TSVariableBuiltin
highlight! link CocSemEvent TSLabel
highlight! link CocSemModifier TSOperator
highlight! link CocErrorFloat ErrorFloat
highlight! link CocWarningFloat WarningFloat
highlight! link CocInfoFloat InfoFloat
highlight! link CocHintFloat HintFloat
highlight! link CocFloatDividingLine Grey
highlight! link CocErrorHighlight ErrorText
highlight! link CocWarningHighlight WarningText
highlight! link CocInfoHighlight InfoText
highlight! link CocHintHighlight HintText
highlight! link CocHighlightText CurrentWord
highlight! link CocHoverRange CurrentWord
highlight! link CocErrorSign RedSign
highlight! link CocWarningSign YellowSign
highlight! link CocInfoSign BlueSign
highlight! link CocHintSign GreenSign
highlight! link CocWarningVirtualText VirtualTextWarning
highlight! link CocErrorVirtualText VirtualTextError
highlight! link CocInfoVirtualText VirtualTextInfo
highlight! link CocHintVirtualText VirtualTextHint
highlight! link CocErrorLine ErrorLine
highlight! link CocWarningLine WarningLine
highlight! link CocInfoLine InfoLine
highlight! link CocHintLine HintLine
highlight! link CocCodeLens Grey
highlight! link CocFadeOut Grey
highlight! link CocStrikeThrough Grey
highlight! link CocListMode StatusLine
highlight! link CocListPath StatusLine
highlight! link CocSelectedText Orange
highlight! link CocListsLine Fg
highlight! link CocListsDesc Grey
highlight! link HighlightedyankRegion Visual
highlight! link CocGitAddedSign GreenSign
highlight! link CocGitChangeRemovedSign PurpleSign
highlight! link CocGitChangedSign BlueSign
highlight! link CocGitRemovedSign RedSign
highlight! link CocGitTopRemovedSign RedSign
" }}}
" prabirshrestha/vim-lsp {{{
highlight! link LspErrorVirtual VirtualTextError
highlight! link LspWarningVirtual VirtualTextWarning
highlight! link LspInformationVirtual VirtualTextInfo
highlight! link LspHintVirtual VirtualTextHint
highlight! link LspErrorHighlight ErrorText
highlight! link LspWarningHighlight WarningText
highlight! link LspInformationHighlight InfoText
highlight! link LspHintHighlight HintText
highlight! link lspReference CurrentWord
highlight! link lspInlayHintsType LineNr
highlight! link lspInlayHintsParameter LineNr
highlight! link LspSemanticType TSType
highlight! link LspSemanticClass TSType
highlight! link LspSemanticEnum TSType
highlight! link LspSemanticInterface TSType
highlight! link LspSemanticStruct TSType
highlight! link LspSemanticTypeParameter TSType
highlight! link LspSemanticParameter TSParameter
highlight! link LspSemanticVariable TSVariable
highlight! link LspSemanticProperty TSProperty
highlight! link LspSemanticEnumMember TSVariableBuiltin
highlight! link LspSemanticEvents TSLabel
highlight! link LspSemanticFunction TSFunction
highlight! link LspSemanticMethod TSMethod
highlight! link LspSemanticKeyword TSKeyword
highlight! link LspSemanticModifier TSOperator
highlight! link LspSemanticComment TSComment
highlight! link LspSemanticString TSString
highlight! link LspSemanticNumber TSNumber
highlight! link LspSemanticRegexp TSStringRegex
highlight! link LspSemanticOperator TSOperator
" }}}
" ycm-core/YouCompleteMe {{{
highlight! link YcmErrorSign RedSign
highlight! link YcmWarningSign YellowSign
highlight! link YcmErrorLine ErrorLine
highlight! link YcmWarningLine WarningLine
highlight! link YcmErrorSection ErrorText
highlight! link YcmWarningSection WarningText
highlight! link YcmInlayHint LineNr
if !has('nvim') && has('textprop') && !exists('g:YCM_HIGHLIGHT_GROUP')
  let g:YCM_HIGHLIGHT_GROUP = {
        \ 'typeParameter': 'TSType',
        \ 'parameter': 'TSParameter',
        \ 'variable': 'TSVariable',
        \ 'property': 'TSProperty',
        \ 'enumMember': 'TSVariableBuiltin',
        \ 'event': 'TSLabel',
        \ 'member': 'TSVariable',
        \ 'method': 'TSMethod',
        \ 'class': 'TSType',
        \ 'namespace': 'TSNamespace',
        \ }
  for tokenType in keys( g:YCM_HIGHLIGHT_GROUP )
    try
      call prop_type_add( 'YCM_HL_' . tokenType,
            \ { 'highlight': g:YCM_HIGHLIGHT_GROUP[ tokenType ] } )
    catch
    endtry
  endfor
endif
" }}}
" dense-analysis/ale {{{
highlight! link ALEError ErrorText
highlight! link ALEWarning WarningText
highlight! link ALEInfo InfoText
highlight! link ALEErrorSign RedSign
highlight! link ALEWarningSign YellowSign
highlight! link ALEInfoSign BlueSign
highlight! link ALEErrorLine ErrorLine
highlight! link ALEWarningLine WarningLine
highlight! link ALEInfoLine InfoLine
highlight! link ALEVirtualTextError VirtualTextError
highlight! link ALEVirtualTextWarning VirtualTextWarning
highlight! link ALEVirtualTextInfo VirtualTextInfo
highlight! link ALEVirtualTextStyleError VirtualTextHint
highlight! link ALEVirtualTextStyleWarning VirtualTextHint
" }}}
" neomake/neomake {{{
highlight! link NeomakeError ErrorText
highlight! link NeomakeWarning WarningText
highlight! link NeomakeInfo InfoText
highlight! link NeomakeMessage HintText
highlight! link NeomakeErrorSign RedSign
highlight! link NeomakeWarningSign YellowSign
highlight! link NeomakeInfoSign BlueSign
highlight! link NeomakeMessageSign AquaSign
highlight! link NeomakeVirtualtextError VirtualTextError
highlight! link NeomakeVirtualtextWarning VirtualTextWarning
highlight! link NeomakeVirtualtextInfo VirtualTextInfo
highlight! link NeomakeVirtualtextMessag VirtualTextHint
" }}}
" vim-syntastic/syntastic {{{
highlight! link SyntasticError ErrorText
highlight! link SyntasticWarning WarningText
highlight! link SyntasticErrorSign RedSign
highlight! link SyntasticWarningSign YellowSign
highlight! link SyntasticErrorLine ErrorLine
highlight! link SyntasticWarningLine WarningLine
" }}}
" Yggdroot/LeaderF {{{
if !exists('g:Lf_StlColorscheme')
  let g:Lf_StlColorscheme = 'everforest'
endif
if !exists('g:Lf_PopupColorscheme')
  let g:Lf_PopupColorscheme = 'everforest'
endif
call everforest#highlight('Lf_hl_match', s:palette.green, s:palette.none, 'bold')
call everforest#highlight('Lf_hl_match0', s:palette.green, s:palette.none, 'bold')
call everforest#highlight('Lf_hl_match1', s:palette.aqua, s:palette.none, 'bold')
call everforest#highlight('Lf_hl_match2', s:palette.blue, s:palette.none, 'bold')
call everforest#highlight('Lf_hl_match3', s:palette.purple, s:palette.none, 'bold')
call everforest#highlight('Lf_hl_match4', s:palette.orange, s:palette.none, 'bold')
call everforest#highlight('Lf_hl_matchRefine', s:palette.red, s:palette.none, 'bold')
call everforest#highlight('Lf_hl_popup_normalMode', s:palette.bg0, s:palette.red, 'bold')
call everforest#highlight('Lf_hl_popup_inputMode', s:palette.bg0, s:palette.green, 'bold')
call everforest#highlight('Lf_hl_popup_category', s:palette.fg, s:palette.bg4)
call everforest#highlight('Lf_hl_popup_nameOnlyMode', s:palette.fg, s:palette.bg3)
call everforest#highlight('Lf_hl_popup_fullPathMode', s:palette.fg, s:palette.bg3)
call everforest#highlight('Lf_hl_popup_fuzzyMode', s:palette.fg, s:palette.bg3)
call everforest#highlight('Lf_hl_popup_regexMode', s:palette.fg, s:palette.bg3)
call everforest#highlight('Lf_hl_popup_lineInfo', s:palette.yellow, s:palette.bg4)
call everforest#highlight('Lf_hl_popup_total', s:palette.bg0, s:palette.orange)
call everforest#highlight('Lf_hl_popup_cursor', s:palette.bg0, s:palette.green)
highlight! link Lf_hl_cursorline Fg
highlight! link Lf_hl_selection DiffAdd
highlight! link Lf_hl_rgHighlight Visual
highlight! link Lf_hl_gtagsHighlight Visual
highlight! link Lf_hl_popup_inputText Pmenu
highlight! link Lf_hl_popup_window Pmenu
highlight! link Lf_hl_popup_prompt Green
highlight! link Lf_hl_popup_cwd Pmenu
highlight! link Lf_hl_popup_blank Lf_hl_popup_window
highlight! link Lf_hl_popup_spin Red
" }}}
" liuchengxu/vim-clap {{{
call everforest#highlight('ClapSelected', s:palette.red, s:palette.none, 'bold')
call everforest#highlight('ClapCurrentSelection', s:palette.none, s:palette.bg1, 'bold')
call everforest#highlight('ClapSpinner', s:palette.orange, s:palette.bg2, 'bold')
call everforest#highlight('ClapBlines', s:palette.fg, s:palette.none)
call everforest#highlight('ClapProviderId', s:palette.fg, s:palette.none, 'bold')
call everforest#highlight('ClapMatches1', s:palette.red, s:palette.none, 'bold')
call everforest#highlight('ClapMatches2', s:palette.orange, s:palette.none, 'bold')
call everforest#highlight('ClapMatches3', s:palette.yellow, s:palette.none, 'bold')
call everforest#highlight('ClapMatches4', s:palette.aqua, s:palette.none, 'bold')
call everforest#highlight('ClapMatches5', s:palette.blue, s:palette.none, 'bold')
call everforest#highlight('ClapMatches6', s:palette.purple, s:palette.none, 'bold')
call everforest#highlight('ClapFuzzyMatches', s:palette.green, s:palette.none, 'bold')
call everforest#highlight('ClapNoMatchesFound', s:palette.red, s:palette.none, 'bold')
highlight! link ClapInput Pmenu
highlight! link ClapDisplay Pmenu
highlight! link ClapPreview Pmenu
highlight! link ClapFuzzyMatches1 ClapFuzzyMatches
highlight! link ClapFuzzyMatches2 ClapFuzzyMatches
highlight! link ClapFuzzyMatches3 ClapFuzzyMatches
highlight! link ClapFuzzyMatches4 ClapFuzzyMatches
highlight! link ClapFuzzyMatches5 ClapFuzzyMatches
highlight! link ClapFuzzyMatches6 ClapFuzzyMatches
highlight! link ClapFuzzyMatches7 ClapFuzzyMatches
highlight! link ClapFuzzyMatches8 ClapFuzzyMatches
highlight! link ClapFuzzyMatches9 ClapFuzzyMatches
highlight! link ClapFuzzyMatches10 ClapFuzzyMatches
highlight! link ClapFuzzyMatches11 ClapFuzzyMatches
highlight! link ClapFuzzyMatches12 ClapFuzzyMatches
highlight! link ClapBlinesLineNr Grey
highlight! link ClapProviderColon ClapBlines
highlight! link ClapProviderAbout ClapBlines
highlight! link ClapFile Fg
highlight! link ClapSearchText ClapFuzzyMatches
" }}}
" junegunn/fzf.vim {{{
let g:fzf_colors = {
      \ 'fg':      ['fg', 'Normal'],
      \ 'bg':      ['bg', 'Normal'],
      \ 'hl':      ['fg', 'Green'],
      \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
      \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
      \ 'hl+':     ['fg', 'Aqua'],
      \ 'info':    ['fg', 'Aqua'],
      \ 'border':  ['fg', 'Grey'],
      \ 'prompt':  ['fg', 'Orange'],
      \ 'pointer': ['fg', 'Blue'],
      \ 'marker':  ['fg', 'Yellow'],
      \ 'spinner': ['fg', 'Yellow'],
      \ 'header':  ['fg', 'Grey']
      \ }
" }}}
" Shougo/denite.nvim {{{
call everforest#highlight('deniteMatchedChar', s:palette.green, s:palette.none, 'bold')
call everforest#highlight('deniteMatchedRange', s:palette.green, s:palette.none, 'bold,underline')
call everforest#highlight('deniteInput', s:palette.green, s:palette.bg3, 'bold')
call everforest#highlight('deniteStatusLineNumber', s:palette.purple, s:palette.bg3)
call everforest#highlight('deniteStatusLinePath', s:palette.fg, s:palette.bg3)
highlight! link deniteSelectedLin Green
" }}}
" kien/ctrlp.vim {{{
call everforest#highlight('CtrlPMatch', s:palette.green, s:palette.none, 'bold')
call everforest#highlight('CtrlPPrtBase', s:palette.bg3, s:palette.none)
call everforest#highlight('CtrlPLinePre', s:palette.bg3, s:palette.none)
call everforest#highlight('CtrlPMode1', s:palette.blue, s:palette.bg3, 'bold')
call everforest#highlight('CtrlPMode2', s:palette.bg0, s:palette.blue, 'bold')
call everforest#highlight('CtrlPStats', s:palette.grey1, s:palette.bg3, 'bold')
highlight! link CtrlPNoEntries Red
highlight! link CtrlPPrtCursor Blue
" }}}
" airblade/vim-gitgutter {{{
highlight! link GitGutterAdd GreenSign
highlight! link GitGutterChange BlueSign
highlight! link GitGutterDelete RedSign
highlight! link GitGutterChangeDelete PurpleSign
highlight! link GitGutterAddLine DiffAdd
highlight! link GitGutterChangeLine DiffChange
highlight! link GitGutterDeleteLine DiffDelete
highlight! link GitGutterChangeDeleteLine DiffChange
highlight! link GitGutterAddLineNr Green
highlight! link GitGutterChangeLineNr Blue
highlight! link GitGutterDeleteLineNr Red
highlight! link GitGutterChangeDeleteLineNr Purple
" }}}
" mhinz/vim-signify {{{
highlight! link SignifySignAdd GreenSign
highlight! link SignifySignChange BlueSign
highlight! link SignifySignDelete RedSign
highlight! link SignifySignChangeDelete PurpleSign
highlight! link SignifyLineAdd DiffAdd
highlight! link SignifyLineChange DiffChange
highlight! link SignifyLineChangeDelete DiffChange
highlight! link SignifyLineDelete DiffDelete
" }}}
" andymass/vim-matchup {{{
call everforest#highlight('MatchParenCur', s:palette.none, s:palette.none, 'bold')
call everforest#highlight('MatchWord', s:palette.none, s:palette.none, 'underline')
call everforest#highlight('MatchWordCur', s:palette.none, s:palette.none, 'underline')
" }}}
" easymotion/vim-easymotion {{{
highlight! link EasyMotionTarget Search
highlight! link EasyMotionShade Grey
" }}}
" justinmk/vim-sneak {{{
call everforest#highlight('SneakLabelMask', s:palette.orange, s:palette.orange)
highlight! link Sneak Search
highlight! link SneakLabel Search
highlight! link SneakScope DiffText
" }}}
" rhysd/clever-f.vim {{{
highlight! link CleverFDefaultLabel Search
" }}}
" terryma/vim-multiple-cursors {{{
highlight! link multiple_cursors_cursor Cursor
highlight! link multiple_cursors_visual Visual
" }}}
" mg979/vim-visual-multi {{{
call everforest#highlight('VMCursor', s:palette.blue, s:palette.bg_blue)
let g:VM_Mono_hl = 'VMCursor'
let g:VM_Extend_hl = 'Visual'
let g:VM_Cursor_hl = 'VMCursor'
let g:VM_Insert_hl = 'VMCursor'
" }}}
" dominikduda/vim_current_word {{{
highlight! link CurrentWordTwins CurrentWord
" }}}
" RRethy/vim-illuminate {{{
highlight! link illuminatedWord CurrentWord
highlight! link IlluminatedWordText CurrentWord
highlight! link IlluminatedWordRead CurrentWord
highlight! link IlluminatedWordWrite CurrentWord
" }}}
" itchyny/vim-cursorword {{{
highlight! link CursorWord0 CurrentWord
highlight! link CursorWord1 CurrentWord
" }}}
" Yggdroot/indentLine {{{
if s:configuration.ui_contrast ==# 'low'
  let g:indentLine_color_gui = s:palette.bg5[0]
  let g:indentLine_color_term = s:palette.bg5[1]
else
  let g:indentLine_color_gui = s:palette.grey0[0]
  let g:indentLine_color_term = s:palette.grey0[1]
endif
" }}}
" nathanaelkane/vim-indent-guides {{{
if get(g:, 'indent_guides_auto_colors', 1) == 0
  call everforest#highlight('IndentGuidesOdd', s:palette.bg0, s:palette.bg1)
  call everforest#highlight('IndentGuidesEven', s:palette.bg0, s:palette.bg2)
endif
" }}}
" thiagoalessio/rainbow_levels.vim {{{
highlight! link RainbowLevel0 Red
highlight! link RainbowLevel1 Orange
highlight! link RainbowLevel2 Yellow
highlight! link RainbowLevel3 Green
highlight! link RainbowLevel4 Aqua
highlight! link RainbowLevel5 Blue
highlight! link RainbowLevel6 Purple
highlight! link RainbowLevel7 Yellow
highlight! link RainbowLevel8 Green
" }}}
" luochen1990/rainbow {{{
if !exists('g:rbpt_colorpairs')
  let g:rbpt_colorpairs = [['blue', s:palette.blue[0]], ['magenta', s:palette.purple[0]],
        \ ['red', s:palette.red[0]], ['166', s:palette.orange[0]]]
endif

let g:rainbow_guifgs = [ s:palette.orange[0], s:palette.red[0], s:palette.purple[0], s:palette.blue[0] ]
let g:rainbow_ctermfgs = [ '166', 'red', 'magenta', 'blue' ]

if !exists('g:rainbow_conf')
  let g:rainbow_conf = {}
endif
if !has_key(g:rainbow_conf, 'guifgs')
  let g:rainbow_conf['guifgs'] = g:rainbow_guifgs
endif
if !has_key(g:rainbow_conf, 'ctermfgs')
  let g:rainbow_conf['ctermfgs'] = g:rainbow_ctermfgs
endif

let g:niji_dark_colours = g:rbpt_colorpairs
let g:niji_light_colours = g:rbpt_colorpairs
" }}}
" kshenoy/vim-signature {{{
highlight! link SignatureMarkText BlueSign
highlight! link SignatureMarkerText PurpleSign
" }}}
" ap/vim-buftabline {{{
highlight! link BufTabLineCurrent TabLineSel
highlight! link BufTabLineActive TabLine
highlight! link BufTabLineHidden TabLineFill
highlight! link BufTabLineFill TabLineFill
" }}}
" liuchengxu/vim-which-key {{{
highlight! link WhichKey Red
highlight! link WhichKeySeperator Green
highlight! link WhichKeyGroup Yellow
highlight! link WhichKeyDesc Blue
" }}}
" junegunn/limelight.vim {{{
let g:limelight_conceal_ctermfg = s:palette.grey0[1]
let g:limelight_conceal_guifg = s:palette.grey0[0]
" }}}
" unblevable/quick-scope {{{
call everforest#highlight('QuickScopePrimary', s:palette.aqua, s:palette.none, 'underline')
call everforest#highlight('QuickScopeSecondary', s:palette.blue, s:palette.none, 'underline')
" }}}
" APZelos/blamer.nvim {{{
highlight! link Blamer Grey
" }}}
" cohama/agit.vim {{{
highlight! link agitTree Grey
highlight! link agitDate Green
highlight! link agitRemote Red
highlight! link agitHead Orange
highlight! link agitRef Aqua
highlight! link agitTag Orange
highlight! link agitStatFile Blue
highlight! link agitStatRemoved Red
highlight! link agitStatAdded Green
highlight! link agitStatMessage Orange
highlight! link agitDiffRemove Red
highlight! link agitDiffAdd Green
highlight! link agitDiffHeader Purple
" }}}
" voldikss/vim-floaterm {{{
highlight! link FloatermBorder Grey
" }}}
" MattesGroeger/vim-bookmarks {{{
highlight! link BookmarkSign BlueSign
highlight! link BookmarkAnnotationSign GreenSign
highlight! link BookmarkLine DiffChange
highlight! link BookmarkAnnotationLine DiffAdd
" }}}
if has('nvim')
" hrsh7th/nvim-cmp {{{
call everforest#highlight('CmpItemAbbrMatch', s:palette.green, s:palette.none, 'bold')
call everforest#highlight('CmpItemAbbrMatchFuzzy', s:palette.green, s:palette.none, 'bold')
highlight! link CmpItemAbbr Fg
highlight! link CmpItemAbbrDeprecated Grey
highlight! link CmpItemMenu Fg
highlight! link CmpItemKind Yellow
highlight! link CmpItemKindText Fg
highlight! link CmpItemKindMethod Green
highlight! link CmpItemKindFunction Green
highlight! link CmpItemKindConstructor Green
highlight! link CmpItemKindField Green
highlight! link CmpItemKindVariable Blue
highlight! link CmpItemKindClass Yellow
highlight! link CmpItemKindInterface Yellow
highlight! link CmpItemKindModule Yellow
highlight! link CmpItemKindProperty Blue
highlight! link CmpItemKindUnit Purple
highlight! link CmpItemKindValue Purple
highlight! link CmpItemKindEnum Yellow
highlight! link CmpItemKindKeyword Red
highlight! link CmpItemKindSnippet Aqua
highlight! link CmpItemKindColor Aqua
highlight! link CmpItemKindFile Aqua
highlight! link CmpItemKindReference Aqua
highlight! link CmpItemKindFolder Aqua
highlight! link CmpItemKindEnumMember Purple
highlight! link CmpItemKindConstant Blue
highlight! link CmpItemKindStruct Yellow
highlight! link CmpItemKindEvent Orange
highlight! link CmpItemKindOperator Orange
highlight! link CmpItemKindTypeParameter Yellow
" }}}
" folke/trouble.nvim {{{
highlight! link TroubleText Fg
highlight! link TroubleSource Grey
highlight! link TroubleCode Grey
" }}}
" nvim-telescope/telescope.nvim {{{
call everforest#highlight('TelescopeMatching', s:palette.green, s:palette.none, 'bold')
highlight! link TelescopeBorder Grey
highlight! link TelescopePromptPrefix Orange
highlight! link TelescopeSelection DiffAdd
" }}}
" lewis6991/gitsigns.nvim {{{
highlight! link GitSignsAdd GreenSign
highlight! link GitSignsChange BlueSign
highlight! link GitSignsDelete RedSign
highlight! link GitSignsAddNr Green
highlight! link GitSignsChangeNr Blue
highlight! link GitSignsDeleteNr Red
highlight! link GitSignsAddLn DiffAdd
highlight! link GitSignsChangeLn DiffChange
highlight! link GitSignsDeleteLn DiffDelete
highlight! link GitSignsCurrentLineBlame Grey
" }}}
" phaazon/hop.nvim {{{
call everforest#highlight('HopNextKey', s:palette.orange, s:palette.none, 'bold')
call everforest#highlight('HopNextKey1', s:palette.green, s:palette.none, 'bold')
highlight! link HopNextKey2 Green
highlight! link HopUnmatched Grey
" }}}
" lukas-reineke/indent-blankline.nvim {{{
highlight! link IndentBlanklineContextChar Grey
highlight! link IndentBlanklineChar LineNr
highlight! link IndentBlanklineSpaceChar LineNr
highlight! link IndentBlanklineSpaceCharBlankline LineNr
" }}}
" p00f/nvim-ts-rainbow {{{
highlight! link rainbowcol1 Red
highlight! link rainbowcol2 Orange
highlight! link rainbowcol3 Yellow
highlight! link rainbowcol4 Green
highlight! link rainbowcol5 Aqua
highlight! link rainbowcol6 Blue
highlight! link rainbowcol7 Purple
" }}}
" romgrk/barbar.nvim {{{
call everforest#highlight('BufferCurrent', s:palette.fg, s:palette.bg4)
call everforest#highlight('BufferCurrentIndex', s:palette.fg, s:palette.bg4)
call everforest#highlight('BufferCurrentMod', s:palette.blue, s:palette.bg4)
call everforest#highlight('BufferCurrentSign', s:palette.statusline1, s:palette.bg4)
call everforest#highlight('BufferCurrentTarget', s:palette.red, s:palette.bg4, 'bold')
call everforest#highlight('BufferVisible', s:palette.fg, s:palette.bg2)
call everforest#highlight('BufferVisibleIndex', s:palette.fg, s:palette.bg2)
call everforest#highlight('BufferVisibleMod', s:palette.blue, s:palette.bg2)
call everforest#highlight('BufferVisibleSign', s:palette.statusline1, s:palette.bg2)
call everforest#highlight('BufferVisibleTarget', s:palette.yellow, s:palette.bg2, 'bold')
call everforest#highlight('BufferInactive', s:palette.grey1, s:palette.bg2)
call everforest#highlight('BufferInactiveIndex', s:palette.grey1, s:palette.bg2)
call everforest#highlight('BufferInactiveMod', s:palette.grey1, s:palette.bg2)
call everforest#highlight('BufferInactiveSign', s:palette.grey0, s:palette.bg2)
call everforest#highlight('BufferInactiveTarget', s:palette.yellow, s:palette.bg2, 'bold')
call everforest#highlight('BufferTabpages', s:palette.bg0, s:palette.statusline1, 'bold')
call everforest#highlight('BufferTabpageFill', s:palette.bg0, s:palette.bg0)
" }}}
" rcarriga/nvim-notify {{{
highlight! link NotifyERRORBorder Red
highlight! link NotifyWARNBorder Yellow
highlight! link NotifyINFOBorder Green
highlight! link NotifyDEBUGBorder Grey
highlight! link NotifyTRACEBorder Purple
highlight! link NotifyERRORIcon Red
highlight! link NotifyWARNIcon Yellow
highlight! link NotifyINFOIcon Green
highlight! link NotifyDEBUGIcon Grey
highlight! link NotifyTRACEIcon Purple
highlight! link NotifyERRORTitle Red
highlight! link NotifyWARNTitle Yellow
highlight! link NotifyINFOTitle Green
highlight! link NotifyDEBUGTitle Grey
highlight! link NotifyTRACETitle Purple
" }}}
" rcarriga/nvim-dap-ui {{{
call everforest#highlight('DapUIModifiedValue', s:palette.blue, s:palette.none, 'bold')
call everforest#highlight('DapUIBreakpointsCurrentLine', s:palette.blue, s:palette.none, 'bold')
highlight! link DapUIScope Blue
highlight! link DapUIType Purple
highlight! link DapUIDecoration Blue
highlight! link DapUIThread Green
highlight! link DapUIStoppedThread Blue
highlight! link DapUISource Purple
highlight! link DapUILineNumber Blue
highlight! link DapUIFloatBorder Blue
highlight! link DapUIWatchesEmpty Red
highlight! link DapUIWatchesValue Green
highlight! link DapUIWatchesError Red
highlight! link DapUIBreakpointsPath Blue
highlight! link DapUIBreakpointsInfo Green
" }}}
" glepnir/lspsaga.nvim {{{
call everforest#highlight('LspFloatWinBorder', s:palette.bg0, s:palette.bg0)
call everforest#highlight('LspSagaDiagnosticHeader', s:palette.orange, s:palette.none, 'bold')
call everforest#highlight('LspSagaCodeActionTitle', s:palette.purple, s:palette.none, 'bold')
call everforest#highlight('DefinitionPreviewTitle', s:palette.blue, s:palette.none, 'bold')
highlight! link LspSagaDiagnosticError Red
highlight! link LspSagaDiagnosticWarn Yellow
highlight! link LspSagaDiagnosticInfo Blue
highlight! link LspSagaDiagnosticHint Green
highlight! link LspSagaErrorTrunCateLine LspSagaDiagnosticError
highlight! link LspSagaWarnTrunCateLine LspSagaDiagnosticWarn
highlight! link LspSagaInfoTrunCateLine LspSagaDiagnosticInfo
highlight! link LspSagaHintTrunCateLine LspSagaDiagnosticHint
highlight! link LspSagaDiagnosticSource Orange
highlight! link LspSagaDiagnosticBorder Orange
highlight! link LspSagaRenameBorder Purple
highlight! link LspSagaRenamePromptPrefix Blue
highlight! link LspSagaCodeActionBorder Purple
highlight! link LspSagaCodeActionTruncateLine Purple
highlight! link LspSagaCodeActionContent Green
highlight! link LspSagaHoverBorder Green
highlight! link LspSagaDocTruncateLine Green
highlight! link LspSagaSignatureHelpBorder Green
highlight! link LspSagaShTruncateLine Green
highlight! link LspSagaDefPreviewBorder Blue
highlight! link DefinitionIcon Blue
highlight! link LspLinesDiagBorder Yellow
highlight! link LineDiagTuncateLine Yellow
highlight! link LspSagaAutoPreview Green
highlight! link LspSagaFinderSelection Fg
highlight! link DiagnosticWarning DiagnosticWarn
highlight! link DiagnosticInformation DiagnosticInfo
highlight! link ReferencesCount Grey
highlight! link DefinitionCount Grey
highlight! link TargetFileName Grey
" }}}
" b0o/incline.nvim {{{
call everforest#highlight('InclineNormalNC', s:palette.grey1, s:palette.bg2)
" }}}
" echasnovski/mini.nvim {{{
call everforest#highlight('MiniIndentscopePrefix', s:palette.none, s:palette.none, 'nocombine')
call everforest#highlight('MiniJump2dSpot', s:palette.orange, s:palette.none, 'bold,nocombine')
call everforest#highlight('MiniStarterCurrent', s:palette.none, s:palette.none, 'nocombine')
call everforest#highlight('MiniStatuslineDevinfo', s:palette.grey1, s:palette.bg1)
call everforest#highlight('MiniStatuslineFileinfo', s:palette.grey1, s:palette.bg1)
call everforest#highlight('MiniStatuslineModeCommand', s:palette.bg0, s:palette.aqua, 'bold')
call everforest#highlight('MiniStatuslineModeInsert', s:palette.bg0, s:palette.statusline2, 'bold')
call everforest#highlight('MiniStatuslineModeNormal', s:palette.bg0, s:palette.statusline1, 'bold')
call everforest#highlight('MiniStatuslineModeOther', s:palette.bg0, s:palette.purple, 'bold')
call everforest#highlight('MiniStatuslineModeReplace', s:palette.bg0, s:palette.orange, 'bold')
call everforest#highlight('MiniStatuslineModeVisual', s:palette.bg0, s:palette.statusline3, 'bold')
call everforest#highlight('MiniTablineCurrent', s:palette.fg, s:palette.bg4)
call everforest#highlight('MiniTablineHidden', s:palette.grey1, s:palette.bg2)
call everforest#highlight('MiniTablineModifiedCurrent', s:palette.blue, s:palette.bg4)
call everforest#highlight('MiniTablineModifiedHidden', s:palette.grey1, s:palette.bg2)
call everforest#highlight('MiniTablineModifiedVisible', s:palette.blue, s:palette.bg2)
call everforest#highlight('MiniTablineTabpagesection', s:palette.bg0, s:palette.statusline1, 'bold')
call everforest#highlight('MiniTablineVisible', s:palette.fg, s:palette.bg2)
call everforest#highlight('MiniTestEmphasis', s:palette.none, s:palette.none, 'bold')
call everforest#highlight('MiniTestFail', s:palette.red, s:palette.none, 'bold')
call everforest#highlight('MiniTestPass', s:palette.green, s:palette.none, 'bold')
call everforest#highlight('MiniTrailspace', s:palette.none, s:palette.red)
highlight! link MiniStarterItemBullet Grey
highlight! link MiniStarterItemPrefix Yellow
highlight! link MiniStarterQuery Blue
highlight! link MiniStatuslineFilename Grey
highlight! link MiniStatuslineModeInactive Grey
highlight! link MiniCompletionActiveParameter LspSignatureActiveParameter
highlight! link MiniCursorword CurrentWord
highlight! link MiniCursorwordCurrent CurrentWord
highlight! link MiniIndentscopeSymbol Grey
highlight! link MiniJump Search
highlight! link MiniStarterFooter Orange
highlight! link MiniStarterHeader Yellow
highlight! link MiniStarterInactive Comment
highlight! link MiniStarterItem Normal
highlight! link MiniStarterSection Title
highlight! link MiniSurround IncSearch
highlight! link MiniTablineFill TabLineFill
" }}}
" ggandor/lightspeed.nvim {{{
call everforest#highlight('LightspeedLabel', s:palette.red, s:palette.none, 'bold,underline')
call everforest#highlight('LightspeedLabelDistant', s:palette.blue, s:palette.none, 'bold,underline')
call everforest#highlight('LightspeedShortcut', s:palette.bg0, s:palette.red, 'bold')
call everforest#highlight('LightspeedUnlabeledMatch', s:palette.fg, s:palette.none, 'bold')
call everforest#highlight('LightspeedPendingOpArea', s:palette.bg0, s:palette.green)
highlight! link LightspeedMaskedChar Purple
highlight! link LightspeedGreyWash Grey
" }}}
endif
" }}}
" Extended File Types: {{{
" Whitelist: {{{ File type optimizations that will always be loaded.
" diff {{{
highlight! link diffAdded Green
highlight! link diffRemoved Red
highlight! link diffChanged Blue
highlight! link diffOldFile Yellow
highlight! link diffNewFile Orange
highlight! link diffFile Aqua
highlight! link diffLine Grey
highlight! link diffIndexLine Purple
" }}}
" }}}
" Generate the `after/syntax` directory based on the comment tags in this file.
" For example, the content between `syn_begin: sh/zsh` and `syn_end` will be placed in `after/syntax/sh/everforest.vim` and `after/syntax/zsh/everforest.vim`.
if everforest#syn_exists(s:path) " If the syntax files exist.
  if s:configuration.better_performance
    if !everforest#syn_newest(s:path, s:last_modified) " Regenerate if it's not up to date.
      call everforest#syn_clean(s:path, 0)
      call everforest#syn_gen(s:path, s:last_modified, 'update')
    endif
    finish
  else
    call everforest#syn_clean(s:path, 1)
  endif
else
  if s:configuration.better_performance
    call everforest#syn_gen(s:path, s:last_modified, 'generate')
    finish
  endif
endif
" syn_begin: vim-plug {{{
" https://github.com/junegunn/vim-plug
call everforest#highlight('plug1', s:palette.orange, s:palette.none, 'bold')
call everforest#highlight('plugNumber', s:palette.yellow, s:palette.none, 'bold')
highlight! link plug2 Green
highlight! link plugBracket Grey
highlight! link plugName Aqua
highlight! link plugDash Orange
highlight! link plugError Red
highlight! link plugNotLoaded Grey
highlight! link plugRelDate Grey
highlight! link plugH2 Orange
highlight! link plugMessage Orange
highlight! link plugStar Red
highlight! link plugUpdate Blue
highlight! link plugDeleted Grey
highlight! link plugEdge Yellow
highlight! link plugSha Green
" syn_end }}}
" syn_begin: packer {{{
" https://github.com/wbthomason/packer.nvim
highlight! link packerSuccess Aqua
highlight! link packerFail Red
highlight! link packerStatusSuccess Fg
highlight! link packerStatusFail Fg
highlight! link packerWorking Yellow
highlight! link packerString Yellow
highlight! link packerPackageNotLoaded Grey
highlight! link packerRelDate Grey
highlight! link packerPackageName Green
highlight! link packerOutput Orange
highlight! link packerHash Green
highlight! link packerTimeTrivial Blue
highlight! link packerTimeHigh Red
highlight! link packerTimeMedium Yellow
highlight! link packerTimeLow Green
" syn_end }}}
" syn_begin: coctree {{{
" https://github.com/neoclide/coc.nvim
highlight! link CocTreeOpenClose Aqua
highlight! link CocTreeDescription Grey
highlight! link CocSymbolFile Green
highlight! link CocSymbolModule Purple
highlight! link CocSymbolNamespace Purple
highlight! link CocSymbolPackage Purple
highlight! link CocSymbolClass Red
highlight! link CocSymbolMethod Green
highlight! link CocSymbolProperty Blue
highlight! link CocSymbolField Green
highlight! link CocSymbolConstructor Green
highlight! link CocSymbolEnum Yellow
highlight! link CocSymbolInterface Yellow
highlight! link CocSymbolFunction Green
highlight! link CocSymbolVariable Blue
highlight! link CocSymbolConstant Blue
highlight! link CocSymbolString Aqua
highlight! link CocSymbolNumber Aqua
highlight! link CocSymbolBoolean Aqua
highlight! link CocSymbolArray Aqua
highlight! link CocSymbolObject Aqua
highlight! link CocSymbolKey Red
highlight! link CocSymbolNull Aqua
highlight! link CocSymbolEnumMember Aqua
highlight! link CocSymbolStruct Yellow
highlight! link CocSymbolEvent Orange
highlight! link CocSymbolOperator Orange
highlight! link CocSymbolTypeParameter Yellow
highlight! link CocSymbolDefault Aqua
" syn_end }}}
" syn_begin: coc-explorer {{{
" https://github.com/weirongxu/coc-explorer
highlight! link CocExplorerBufferRoot Orange
highlight! link CocExplorerBufferExpandIcon Aqua
highlight! link CocExplorerBufferBufnr Purple
highlight! link CocExplorerBufferModified Yellow
highlight! link CocExplorerBufferReadonly Red
highlight! link CocExplorerBufferBufname Grey
highlight! link CocExplorerBufferFullpath Grey
highlight! link CocExplorerFileRoot Orange
highlight! link CocExplorerFileRootName Green
highlight! link CocExplorerFileExpandIcon Aqua
highlight! link CocExplorerFileFullpath Grey
highlight! link CocExplorerFileDirectory Green
highlight! link CocExplorerFileGitStaged Purple
highlight! link CocExplorerFileGitUnstaged Yellow
highlight! link CocExplorerFileGitRootStaged Purple
highlight! link CocExplorerFileGitRootUnstaged Yellow
highlight! link CocExplorerGitPathChange Fg
highlight! link CocExplorerGitContentChange Fg
highlight! link CocExplorerGitRenamed Purple
highlight! link CocExplorerGitCopied Fg
highlight! link CocExplorerGitAdded Green
highlight! link CocExplorerGitUntracked Blue
highlight! link CocExplorerGitUnmodified Fg
highlight! link CocExplorerGitUnmerged Orange
highlight! link CocExplorerGitMixed Aqua
highlight! link CocExplorerGitModified Yellow
highlight! link CocExplorerGitDeleted Red
highlight! link CocExplorerGitIgnored Grey
highlight! link CocExplorerFileSize Blue
highlight! link CocExplorerTimeAccessed Aqua
highlight! link CocExplorerTimeCreated Aqua
highlight! link CocExplorerTimeModified Aqua
highlight! link CocExplorerIndentLine Conceal
highlight! link CocExplorerHelpDescription Grey
highlight! link CocExplorerHelpHint Grey
highlight! link CocExplorerDiagnosticError Red
highlight! link CocExplorerDiagnosticWarning Yellow
highlight! link CocExplorerFileHidden Grey
" syn_end }}}
" syn_begin: tagbar {{{
" https://github.com/majutsushi/tagbar
highlight! link TagbarFoldIcon Green
highlight! link TagbarSignature Green
highlight! link TagbarKind Red
highlight! link TagbarScope Orange
highlight! link TagbarNestedKind Aqua
highlight! link TagbarVisibilityPrivate Red
highlight! link TagbarVisibilityPublic Blue
" syn_end }}}
" syn_begin: vista/vista_kind/vista_markdown {{{
" https://github.com/liuchengxu/vista.vim
highlight! link VistaBracket Grey
highlight! link VistaChildrenNr Orange
highlight! link VistaScope Red
highlight! link VistaTag Green
highlight! link VistaPrefix Grey
highlight! link VistaIcon Orange
highlight! link VistaScopeKind Yellow
highlight! link VistaColon Grey
highlight! link VistaLineNr Grey
highlight! link VistaHeadNr Fg
highlight! link VistaPublic Green
highlight! link VistaProtected Yellow
highlight! link VistaPrivate Red
" syn_end }}}
" syn_begin: Outline {{{
" https://github.com/simrat39/symbols-outline.nvim
highlight! link FocusedSymbol NormalFloat
" syn_end }}}
" syn_begin: aerial {{{
" https://github.com/stevearc/aerial.nvim
highlight! link AerialLine CursorLine
highlight! link AerialGuide LineNr
highlight! link AerialFileIcon Green
highlight! link AerialModuleIcon Purple
highlight! link AerialNamespaceIcon Purple
highlight! link AerialPackageIcon Purple
highlight! link AerialClassIcon Red
highlight! link AerialMethodIcon Green
highlight! link AerialPropertyIcon Blue
highlight! link AerialFieldIcon Green
highlight! link AerialConstructorIcon Green
highlight! link AerialEnumIcon Yellow
highlight! link AerialInterfaceIcon Yellow
highlight! link AerialFunctionIcon Green
highlight! link AerialVariableIcon Blue
highlight! link AerialConstantIcon Blue
highlight! link AerialStringIcon Aqua
highlight! link AerialNumberIcon Aqua
highlight! link AerialBooleanIcon Aqua
highlight! link AerialArrayIcon Aqua
highlight! link AerialObjectIcon Aqua
highlight! link AerialKeyIcon Red
highlight! link AerialNullIcon Aqua
highlight! link AerialEnumMemberIcon Aqua
highlight! link AerialStructIcon Yellow
highlight! link AerialEventIcon Orange
highlight! link AerialOperatorIcon Orange
highlight! link AerialTypeParameterIcon Yellow
" syn_end }}}
" syn_begin: nerdtree {{{
" https://github.com/preservim/nerdtree
highlight! link NERDTreeDir Green
highlight! link NERDTreeDirSlash Aqua
highlight! link NERDTreeOpenable Orange
highlight! link NERDTreeClosable Orange
highlight! link NERDTreeFile Fg
highlight! link NERDTreeExecFile Yellow
highlight! link NERDTreeUp Grey
highlight! link NERDTreeCWD Aqua
highlight! link NERDTreeHelp LightGrey
highlight! link NERDTreeToggleOn Green
highlight! link NERDTreeToggleOff Red
highlight! link NERDTreeFlags Orange
highlight! link NERDTreeLinkFile Grey
highlight! link NERDTreeLinkTarget Green
" syn_end }}}
" syn_begin: dirvish {{{
" https://github.com/justinmk/vim-dirvish
highlight! link DirvishPathTail Aqua
highlight! link DirvishArg Yellow
" syn_end }}}
" syn_begin: NvimTree {{{
" https://github.com/kyazdani42/nvim-tree.lua
highlight! link NvimTreeSymlink Fg
highlight! link NvimTreeFolderName Green
highlight! link NvimTreeRootFolder Grey
highlight! link NvimTreeFolderIcon Orange
highlight! link NvimTreeEmptyFolderName Green
highlight! link NvimTreeOpenedFolderName Green
highlight! link NvimTreeExecFile Fg
highlight! link NvimTreeOpenedFile Fg
highlight! link NvimTreeSpecialFile Fg
highlight! link NvimTreeImageFile Fg
highlight! link NvimTreeMarkdownFile Fg
highlight! link NvimTreeIndentMarker Grey
highlight! link NvimTreeGitDirty Yellow
highlight! link NvimTreeGitStaged Blue
highlight! link NvimTreeGitMerge Orange
highlight! link NvimTreeGitRenamed Purple
highlight! link NvimTreeGitNew Aqua
highlight! link NvimTreeGitDeleted Red
highlight! link NvimTreeLspDiagnosticsError RedSign
highlight! link NvimTreeLspDiagnosticsWarning YellowSign
highlight! link NvimTreeLspDiagnosticsInformation BlueSign
highlight! link NvimTreeLspDiagnosticsHint GreenSign
" syn_end }}}
" syn_begin: fern {{{
" https://github.com/lambdalisue/fern.vim
highlight! link FernMarkedLine Purple
highlight! link FernMarkedText Purple
highlight! link FernRootSymbol FernRootText
highlight! link FernRootText Orange
highlight! link FernLeafSymbol FernLeafText
highlight! link FernLeafText Fg
highlight! link FernBranchSymbol FernBranchText
highlight! link FernBranchText Green
highlight! link FernWindowSelectIndicator TabLineSel
highlight! link FernWindowSelectStatusLine TabLine
" syn_end }}}
" syn_begin: octo {{{
" https://github.com/pwntester/octo.nvim
call everforest#highlight('OctoViewer', s:palette.bg0, s:palette.blue)
call everforest#highlight('OctoGreenFloat', s:palette.green, s:palette.bg2)
call everforest#highlight('OctoRedFloat', s:palette.red, s:palette.bg2)
call everforest#highlight('OctoPurpleFloat', s:palette.purple, s:palette.bg2)
call everforest#highlight('OctoYellowFloat', s:palette.yellow, s:palette.bg2)
call everforest#highlight('OctoBlueFloat', s:palette.blue, s:palette.bg2)
call everforest#highlight('OctoGreyFloat', s:palette.grey1, s:palette.bg2)
call everforest#highlight('OctoBubbleGreen', s:palette.bg0, s:palette.green)
call everforest#highlight('OctoBubbleRed', s:palette.bg0, s:palette.red)
call everforest#highlight('OctoBubblePurple', s:palette.bg0, s:palette.purple)
call everforest#highlight('OctoBubbleYellow', s:palette.bg0, s:palette.yellow)
call everforest#highlight('OctoBubbleBlue', s:palette.bg0, s:palette.blue)
call everforest#highlight('OctoBubbleGrey', s:palette.bg0, s:palette.grey1)
highlight! link OctoGreen Green
highlight! link OctoRed Red
highlight! link OctoPurple Purple
highlight! link OctoYellow Yellow
highlight! link OctoBlue Blue
highlight! link OctoGrey Grey
highlight! link OctoBubbleDelimiterGreen Green
highlight! link OctoBubbleDelimiterRed Red
highlight! link OctoBubbleDelimiterPurple Purple
highlight! link OctoBubbleDelimiterYellow Yellow
highlight! link OctoBubbleDelimiterBlue Blue
highlight! link OctoBubbleDelimiterGrey Grey
" syn_end }}}
" syn_begin: netrw {{{
" https://www.vim.org/scripts/script.php?script_id=1075
highlight! link netrwDir Green
highlight! link netrwClassify Green
highlight! link netrwLink Grey
highlight! link netrwSymLink Fg
highlight! link netrwExe Yellow
highlight! link netrwComment Grey
highlight! link netrwList Aqua
highlight! link netrwHelpCmd Blue
highlight! link netrwCmdSep Grey
highlight! link netrwVersion Orange
" syn_end }}}
" syn_begin: startify/quickmenu {{{
" https://github.com/mhinz/vim-startify
" https://github.com/skywind3000/quickmenu.vim
highlight! link StartifyBracket Grey
highlight! link StartifyFile Fg
highlight! link StartifyNumber Orange
highlight! link StartifyPath Green
highlight! link StartifySlash Green
highlight! link StartifySection Yellow
highlight! link StartifyHeader Aqua
highlight! link StartifySpecial Grey
highlight! link StartifyFooter Grey
" syn_end }}}
" syn_begin: quickmenu {{{
" https://github.com/skywind3000/quickmenu.vim
highlight! link QuickmenuOption Green
highlight! link QuickmenuNumber Red
highlight! link QuickmenuBracket Grey
highlight! link QuickmenuHelp Green
highlight! link QuickmenuSpecial Purple
highlight! link QuickmenuHeader Orange
" syn_end }}}
" syn_begin: undotree {{{
" https://github.com/mbbill/undotree
call everforest#highlight('UndotreeSavedBig', s:palette.purple, s:palette.none, 'bold')
highlight! link UndotreeNode Orange
highlight! link UndotreeNodeCurrent Red
highlight! link UndotreeSeq Green
highlight! link UndotreeNext Blue
highlight! link UndotreeTimeStamp Grey
highlight! link UndotreeHead Yellow
highlight! link UndotreeBranch Yellow
highlight! link UndotreeCurrent Aqua
highlight! link UndotreeSavedSmall Purple
" syn_end }}}
" syn_begin: NeogitStatus/NeogitCommitView {{{
" https://github.com/TimUntersberger/neogit
highlight! link NeogitNotificationInfo Blue
highlight! link NeogitNotificationWarning Yellow
highlight! link NeogitNotificationError Red
highlight! link NeogitDiffAdd Green
highlight! link NeogitDiffDelete Red
highlight! link NeogitDiffContextHighlight CursorLine
highlight! link NeogitHunkHeaderHighlight TabLine
highlight! link NeogitHunkHeader TabLineFill
highlight! link NeogitCommandCodeNormal Green
highlight! link NeogitCommandCodeError Red
highlight! link NeogitCommitViewHeader diffIndexLine
highlight! link NeogitFilePath diffFile
" syn_end }}}
" syn_begin: dashboard {{{
" https://github.com/glepnir/dashboard-nvim
highlight! link DashboardHeader Yellow
highlight! link DashboardCenter Green
highlight! link DashboardShortcut Red
highlight! link DashboardFooter Orange
" syn_end }}}
" syn_begin: markdown {{{
" builtin: {{{
call everforest#highlight('markdownH1', s:palette.red, s:palette.none, 'bold')
call everforest#highlight('markdownH2', s:palette.orange, s:palette.none, 'bold')
call everforest#highlight('markdownH3', s:palette.yellow, s:palette.none, 'bold')
call everforest#highlight('markdownH4', s:palette.green, s:palette.none, 'bold')
call everforest#highlight('markdownH5', s:palette.blue, s:palette.none, 'bold')
call everforest#highlight('markdownH6', s:palette.purple, s:palette.none, 'bold')
call everforest#highlight('markdownUrl', s:palette.blue, s:palette.none, 'underline')
call everforest#highlight('markdownItalic', s:palette.none, s:palette.none, 'italic')
call everforest#highlight('markdownBold', s:palette.none, s:palette.none, 'bold')
call everforest#highlight('markdownItalicDelimiter', s:palette.grey1, s:palette.none, 'italic')
highlight! link markdownCode Green
highlight! link markdownCodeBlock Aqua
highlight! link markdownCodeDelimiter Aqua
highlight! link markdownBlockquote Grey
highlight! link markdownListMarker Red
highlight! link markdownOrderedListMarker Red
highlight! link markdownRule Purple
highlight! link markdownHeadingRule Grey
highlight! link markdownUrlDelimiter Grey
highlight! link markdownLinkDelimiter Grey
highlight! link markdownLinkTextDelimiter Grey
highlight! link markdownHeadingDelimiter Grey
highlight! link markdownLinkText Purple
highlight! link markdownUrlTitleDelimiter Green
highlight! link markdownIdDeclaration markdownLinkText
highlight! link markdownBoldDelimiter Grey
highlight! link markdownId Yellow
" }}}
" vim-markdown: https://github.com/gabrielelana/vim-markdown {{{
call everforest#highlight('mkdURL', s:palette.blue, s:palette.none, 'underline')
call everforest#highlight('mkdInlineURL', s:palette.purple, s:palette.none, 'underline')
call everforest#highlight('mkdItalic', s:palette.grey1, s:palette.none, 'italic')
highlight! link mkdCodeDelimiter Aqua
highlight! link mkdBold Grey
highlight! link mkdLink Purple
highlight! link mkdHeading Grey
highlight! link mkdListItem Red
highlight! link mkdRule Purple
highlight! link mkdDelimiter Grey
highlight! link mkdId Yellow
" }}}
" syn_end }}}
" syn_begin: vimwiki {{{
call everforest#highlight('VimwikiHeader1', s:palette.red, s:palette.none, 'bold')
call everforest#highlight('VimwikiHeader2', s:palette.orange, s:palette.none, 'bold')
call everforest#highlight('VimwikiHeader3', s:palette.yellow, s:palette.none, 'bold')
call everforest#highlight('VimwikiHeader4', s:palette.green, s:palette.none, 'bold')
call everforest#highlight('VimwikiHeader5', s:palette.blue, s:palette.none, 'bold')
call everforest#highlight('VimwikiHeader6', s:palette.purple, s:palette.none, 'bold')
call everforest#highlight('VimwikiLink', s:palette.blue, s:palette.none, 'underline')
call everforest#highlight('VimwikiItalic', s:palette.none, s:palette.none, 'italic')
call everforest#highlight('VimwikiBold', s:palette.none, s:palette.none, 'bold')
call everforest#highlight('VimwikiUnderline', s:palette.none, s:palette.none, 'underline')
highlight! link VimwikiList Red
highlight! link VimwikiTag Aqua
highlight! link VimwikiCode Green
highlight! link VimwikiHR Yellow
highlight! link VimwikiHeaderChar Grey
highlight! link VimwikiMarkers Grey
highlight! link VimwikiPre Green
highlight! link VimwikiPreDelim Green
highlight! link VimwikiNoExistsLink Red
" syn_end }}}
" syn_begin: rst {{{
" builtin: https://github.com/marshallward/vim-restructuredtext {{{
call everforest#highlight('rstStandaloneHyperlink', s:palette.purple, s:palette.none, 'underline')
highlight! link rstSubstitutionReference Blue
highlight! link rstInterpretedTextOrHyperlinkReference Aqua
highlight! link rstTableLines Grey
" }}}
" syn_end }}}
" syn_begin: tex {{{
" builtin: http://www.drchip.org/astronaut/vim/index.html#SYNTAX_TEX {{{
highlight! link texStatement Green
highlight! link texOnlyMath Grey
highlight! link texDefName Yellow
highlight! link texNewCmd Orange
highlight! link texCmdName Blue
highlight! link texBeginEnd Red
highlight! link texBeginEndName Blue
highlight! link texDocType Purple
highlight! link texDocTypeArgs Orange
" }}}
" vimtex: https://github.com/lervag/vimtex {{{
highlight! link texCmd Green
highlight! link texCmdClass Purple
highlight! link texCmdTitle Purple
highlight! link texCmdAuthor Purple
highlight! link texCmdPart Purple
highlight! link texCmdBib Purple
highlight! link texCmdPackage Yellow
highlight! link texCmdNew Yellow
highlight! link texArgNew Orange
highlight! link texPartArgTitle BlueItalic
highlight! link texFileArg BlueItalic
highlight! link texEnvArgName BlueItalic
highlight! link texMathEnvArgName BlueItalic
highlight! link texTitleArg BlueItalic
highlight! link texAuthorArg BlueItalic
" }}}
" syn_end }}}
" syn_begin: html/markdown/javascriptreact/typescriptreact {{{
" builtin: https://notabug.org/jorgesumle/vim-html-syntax {{{
call everforest#highlight('htmlH1', s:palette.red, s:palette.none, 'bold')
call everforest#highlight('htmlH2', s:palette.orange, s:palette.none, 'bold')
call everforest#highlight('htmlH3', s:palette.yellow, s:palette.none, 'bold')
call everforest#highlight('htmlH4', s:palette.green, s:palette.none, 'bold')
call everforest#highlight('htmlH5', s:palette.blue, s:palette.none, 'bold')
call everforest#highlight('htmlH6', s:palette.purple, s:palette.none, 'bold')
call everforest#highlight('htmlLink', s:palette.none, s:palette.none, 'underline')
call everforest#highlight('htmlBold', s:palette.none, s:palette.none, 'bold')
call everforest#highlight('htmlBoldUnderline', s:palette.none, s:palette.none, 'bold,underline')
call everforest#highlight('htmlBoldItalic', s:palette.none, s:palette.none, 'bold,italic')
call everforest#highlight('htmlBoldUnderlineItalic', s:palette.none, s:palette.none, 'bold,underline,italic')
call everforest#highlight('htmlUnderline', s:palette.none, s:palette.none, 'underline')
call everforest#highlight('htmlUnderlineItalic', s:palette.none, s:palette.none, 'underline,italic')
call everforest#highlight('htmlItalic', s:palette.none, s:palette.none, 'italic')
highlight! link htmlTag Green
highlight! link htmlEndTag Blue
highlight! link htmlTagN OrangeItalic
highlight! link htmlTagName OrangeItalic
highlight! link htmlArg Aqua
highlight! link htmlScriptTag Purple
highlight! link htmlSpecialTagName RedItalic
" }}}
" syn_end }}}
" syn_begin: xml {{{
" builtin: https://github.com/chrisbra/vim-xml-ftplugin {{{
highlight! link xmlTag Green
highlight! link xmlEndTag Blue
highlight! link xmlTagName OrangeItalic
highlight! link xmlEqual Orange
highlight! link xmlAttrib Aqua
highlight! link xmlEntity Red
highlight! link xmlEntityPunct Red
highlight! link xmlDocTypeDecl Grey
highlight! link xmlDocTypeKeyword PurpleItalic
highlight! link xmlCdataStart Grey
highlight! link xmlCdataCdata Purple
" }}}
" syn_end }}}
" syn_begin: css/scss/sass/less {{{
" builtin: https://github.com/JulesWang/css.vim {{{
highlight! link cssAttrComma Fg
highlight! link cssBraces Fg
highlight! link cssTagName PurpleItalic
highlight! link cssClassNameDot Red
highlight! link cssClassName RedItalic
highlight! link cssFunctionName Yellow
highlight! link cssAttr Orange
highlight! link cssProp Aqua
highlight! link cssCommonAttr Yellow
highlight! link cssPseudoClassId Blue
highlight! link cssPseudoClassFn Green
highlight! link cssPseudoClass Purple
highlight! link cssImportant RedItalic
highlight! link cssSelectorOp Orange
highlight! link cssSelectorOp2 Orange
highlight! link cssColor Green
highlight! link cssAttributeSelector Aqua
highlight! link cssUnitDecorators Orange
highlight! link cssValueLength Green
highlight! link cssValueInteger Green
highlight! link cssValueNumber Green
highlight! link cssValueAngle Green
highlight! link cssValueTime Green
highlight! link cssValueFrequency Green
highlight! link cssVendor Grey
highlight! link cssNoise Grey
" }}}
" syn_end }}}
" syn_begin: scss {{{
" scss-syntax: https://github.com/cakebaker/scss-syntax.vim {{{
highlight! link scssMixinName Yellow
highlight! link scssSelectorChar Red
highlight! link scssSelectorName RedItalic
highlight! link scssInterpolationDelimiter Green
highlight! link scssVariableValue Green
highlight! link scssNull Purple
highlight! link scssBoolean Purple
highlight! link scssVariableAssignment Grey
highlight! link scssForKeyword PurpleItalic
highlight! link scssAttribute Orange
highlight! link scssFunctionName Yellow
" }}}
" syn_end }}}
" syn_begin: sass {{{
" builtin: {{{
highlight! link sassProperty Aqua
highlight! link sassAmpersand Orange
highlight! link sassClass RedItalic
highlight! link sassClassChar Red
highlight! link sassMixing PurpleItalic
highlight! link sassMixinName Orange
highlight! link sassCssAttribute Yellow
highlight! link sassInterpolationDelimiter Green
highlight! link sassFunction Yellow
highlight! link sassControl RedItalic
highlight! link sassFor RedItalic
highlight! link sassFunctionName Green
" }}}
" syn_end }}}
" syn_begin: less {{{
" vim-less: https://github.com/groenewege/vim-less {{{
highlight! link lessMixinChar Grey
highlight! link lessClass RedItalic
highlight! link lessVariable Blue
highlight! link lessAmpersandChar Orange
highlight! link lessFunction Yellow
" }}}
" syn_end }}}
" syn_begin: javascript/javascriptreact {{{
" builtin: http://www.fleiner.com/vim/syntax/javascript.vim {{{
highlight! link javaScriptNull Aqua
highlight! link javaScriptNumber Number
highlight! link javaScriptIdentifier Orange
highlight! link javaScriptGlobal Purple
highlight! link javaScriptMessage Yellow
highlight! link javaScriptFunction Keyword
highlight! link javaScriptOperator Orange
highlight! link javaScriptMember Aqua
" }}}
" vim-javascript: https://github.com/pangloss/vim-javascript {{{
highlight! link jsString Aqua
highlight! link jsTemplateString jsString
highlight! link jsThis Purple
highlight! link jsUndefined Aqua
highlight! link jsNull Aqua
highlight! link jsNan Aqua
highlight! link jsSuper Purple
highlight! link jsPrototype Purple
highlight! link jsFunction Keyword
highlight! link jsGlobalNodeObjects Include
highlight! link jsGlobalObjects Yellow
highlight! link jsArrowFunction Purple
highlight! link jsArrowFuncArgs Blue
highlight! link jsFuncArgs Identifier
highlight! link jsBlockLabel Aqua
highlight! link jsClassDefinition Type
highlight! link jsClassStringKey Aqua
highlight! link jsDot Grey
highlight! link jsObjectColon Grey
highlight! link jsDestructuringBlock Blue
highlight! link jsModuleKeyword Yellow
highlight! link jsTemplateExpression Yellow
highlight! link jsTemplateBraces Yellow
highlight! link jsClassMethodType Orange
" }}}
" nvim-treesitter/nvim-treesitter {{{
highlight! link javascriptTSInclude Purple
highlight! link javascriptTSConstructor Yellow
if has('nvim-0.8.0')
  highlight! link @include.javascript javascriptTSInclude
  highlight! link @constructor.javascript javascriptTSConstructor
endif
" }}}
" yajs: https://github.com/othree/yajs.vim {{{
highlight! link javascriptEndColons Fg
highlight! link javascriptOpSymbol Orange
highlight! link javascriptOpSymbols Orange
highlight! link javascriptVariable Orange
highlight! link javascriptObjectLabel Fg
highlight! link javascriptObjectLabelColon Grey
highlight! link javascriptPropertyNameString Aqua
highlight! link javascriptFuncArg Blue
highlight! link javascriptIdentifier Purple
highlight! link javascriptArrowFunc Purple
highlight! link javascriptTemplate Yellow
highlight! link javascriptTemplateSubstitution Yellow
highlight! link javascriptTemplateSB Yellow
highlight! link javascriptNodeGlobal PurpleItalic
highlight! link javascriptDocTags PurpleItalic
highlight! link javascriptDocNotation Purple
highlight! link javascriptClassSuper Purple
highlight! link javascriptClassName Yellow
highlight! link javascriptClassSuperName Yellow
highlight! link javascriptBrackets Fg
highlight! link javascriptBraces Fg
highlight! link javascriptLabel Purple
highlight! link javascriptDotNotation Grey
highlight! link javascriptGlobalArrayDot Grey
highlight! link javascriptGlobalBigIntDot Grey
highlight! link javascriptGlobalDateDot Grey
highlight! link javascriptGlobalJSONDot Grey
highlight! link javascriptGlobalMathDot Grey
highlight! link javascriptGlobalNumberDot Grey
highlight! link javascriptGlobalObjectDot Grey
highlight! link javascriptGlobalPromiseDot Grey
highlight! link javascriptGlobalRegExpDot Grey
highlight! link javascriptGlobalStringDot Grey
highlight! link javascriptGlobalSymbolDot Grey
highlight! link javascriptGlobalURLDot Grey
highlight! link javascriptMethod Green
highlight! link javascriptMethodName Green
highlight! link javascriptObjectMethodName Green
highlight! link javascriptGlobalMethod Green
highlight! link javascriptDOMStorageMethod Green
highlight! link javascriptFileMethod Green
highlight! link javascriptFileReaderMethod Green
highlight! link javascriptFileListMethod Green
highlight! link javascriptBlobMethod Green
highlight! link javascriptURLStaticMethod Green
highlight! link javascriptNumberStaticMethod Green
highlight! link javascriptNumberMethod Green
highlight! link javascriptDOMNodeMethod Green
highlight! link javascriptES6BigIntStaticMethod Green
highlight! link javascriptBOMWindowMethod Green
highlight! link javascriptHeadersMethod Green
highlight! link javascriptRequestMethod Green
highlight! link javascriptResponseMethod Green
highlight! link javascriptES6SetMethod Green
highlight! link javascriptReflectMethod Green
highlight! link javascriptPaymentMethod Green
highlight! link javascriptPaymentResponseMethod Green
highlight! link javascriptTypedArrayStaticMethod Green
highlight! link javascriptGeolocationMethod Green
highlight! link javascriptES6MapMethod Green
highlight! link javascriptServiceWorkerMethod Green
highlight! link javascriptCacheMethod Green
highlight! link javascriptFunctionMethod Green
highlight! link javascriptXHRMethod Green
highlight! link javascriptBOMNavigatorMethod Green
highlight! link javascriptServiceWorkerMethod Green
highlight! link javascriptDOMEventTargetMethod Green
highlight! link javascriptDOMEventMethod Green
highlight! link javascriptIntlMethod Green
highlight! link javascriptDOMDocMethod Green
highlight! link javascriptStringStaticMethod Green
highlight! link javascriptStringMethod Green
highlight! link javascriptSymbolStaticMethod Green
highlight! link javascriptRegExpMethod Green
highlight! link javascriptObjectStaticMethod Green
highlight! link javascriptObjectMethod Green
highlight! link javascriptBOMLocationMethod Green
highlight! link javascriptJSONStaticMethod Green
highlight! link javascriptGeneratorMethod Green
highlight! link javascriptEncodingMethod Green
highlight! link javascriptPromiseStaticMethod Green
highlight! link javascriptPromiseMethod Green
highlight! link javascriptBOMHistoryMethod Green
highlight! link javascriptDOMFormMethod Green
highlight! link javascriptClipboardMethod Green
highlight! link javascriptTypedArrayStaticMethod Green
highlight! link javascriptBroadcastMethod Green
highlight! link javascriptDateStaticMethod Green
highlight! link javascriptDateMethod Green
highlight! link javascriptConsoleMethod Green
highlight! link javascriptArrayStaticMethod Green
highlight! link javascriptArrayMethod Green
highlight! link javascriptMathStaticMethod Green
highlight! link javascriptSubtleCryptoMethod Green
highlight! link javascriptCryptoMethod Green
highlight! link javascriptProp Aqua
highlight! link javascriptBOMWindowProp Aqua
highlight! link javascriptDOMStorageProp Aqua
highlight! link javascriptFileReaderProp Aqua
highlight! link javascriptURLUtilsProp Aqua
highlight! link javascriptNumberStaticProp Aqua
highlight! link javascriptDOMNodeProp Aqua
highlight! link javascriptRequestProp Aqua
highlight! link javascriptResponseProp Aqua
highlight! link javascriptES6SetProp Aqua
highlight! link javascriptPaymentProp Aqua
highlight! link javascriptPaymentResponseProp Aqua
highlight! link javascriptPaymentAddressProp Aqua
highlight! link javascriptPaymentShippingOptionProp Aqua
highlight! link javascriptTypedArrayStaticProp Aqua
highlight! link javascriptServiceWorkerProp Aqua
highlight! link javascriptES6MapProp Aqua
highlight! link javascriptRegExpStaticProp Aqua
highlight! link javascriptRegExpProp Aqua
highlight! link javascriptXHRProp Aqua
highlight! link javascriptBOMNavigatorProp Green
highlight! link javascriptDOMEventProp Aqua
highlight! link javascriptBOMNetworkProp Aqua
highlight! link javascriptDOMDocProp Aqua
highlight! link javascriptSymbolStaticProp Aqua
highlight! link javascriptSymbolProp Aqua
highlight! link javascriptBOMLocationProp Aqua
highlight! link javascriptEncodingProp Aqua
highlight! link javascriptCryptoProp Aqua
highlight! link javascriptBOMHistoryProp Aqua
highlight! link javascriptDOMFormProp Aqua
highlight! link javascriptDataViewProp Aqua
highlight! link javascriptBroadcastProp Aqua
highlight! link javascriptMathStaticProp Aqua
" }}}
" vim-jsx-pretty: https://github.com/maxmellon/vim-jsx-pretty {{{
highlight! link jsxTagName OrangeItalic
highlight! link jsxOpenPunct Green
highlight! link jsxClosePunct Blue
highlight! link jsxEscapeJs Blue
highlight! link jsxAttrib Aqua
" }}}
" syn_end }}}
" syn_begin: typescript/typescriptreact {{{
" vim-typescript: https://github.com/leafgarland/typescript-vim {{{
highlight! link typescriptSource PurpleItalic
highlight! link typescriptMessage Yellow
highlight! link typescriptGlobalObjects Aqua
highlight! link typescriptInterpolation Yellow
highlight! link typescriptInterpolationDelimiter Yellow
highlight! link typescriptBraces Fg
highlight! link typescriptParens Fg
" }}}
" yats: https:github.com/HerringtonDarkholme/yats.vim {{{
highlight! link typescriptMethodAccessor OrangeItalic
highlight! link typescriptVariable Orange
highlight! link typescriptVariableDeclaration Blue
highlight! link typescriptTypeReference Yellow
highlight! link typescriptBraces Fg
highlight! link typescriptEnumKeyword RedItalic
highlight! link typescriptEnum Yellow
highlight! link typescriptIdentifierName Aqua
highlight! link typescriptProp Aqua
highlight! link typescriptCall Blue
highlight! link typescriptInterfaceName Yellow
highlight! link typescriptEndColons Fg
highlight! link typescriptMember Aqua
highlight! link typescriptMemberOptionality Orange
highlight! link typescriptObjectLabel Aqua
highlight! link typescriptArrowFunc Purple
highlight! link typescriptAbstract Orange
highlight! link typescriptObjectColon Grey
highlight! link typescriptTypeAnnotation Grey
highlight! link typescriptAssign Orange
highlight! link typescriptBinaryOp Orange
highlight! link typescriptUnaryOp Orange
highlight! link typescriptFuncComma Fg
highlight! link typescriptClassName Yellow
highlight! link typescriptClassHeritage Yellow
highlight! link typescriptInterfaceHeritage Yellow
highlight! link typescriptIdentifier Purple
highlight! link typescriptGlobal Purple
highlight! link typescriptOperator RedItalic
highlight! link typescriptNodeGlobal PurpleItalic
highlight! link typescriptExport PurpleItalic
highlight! link typescriptDefaultParam Orange
highlight! link typescriptImport PurpleItalic
highlight! link typescriptTypeParameter Yellow
highlight! link typescriptReadonlyModifier Orange
highlight! link typescriptAccessibilityModifier Orange
highlight! link typescriptAmbientDeclaration RedItalic
highlight! link typescriptTemplateSubstitution Yellow
highlight! link typescriptTemplateSB Yellow
highlight! link typescriptExceptions RedItalic
highlight! link typescriptCastKeyword RedItalic
highlight! link typescriptOptionalMark Orange
highlight! link typescriptNull Aqua
highlight! link typescriptMappedIn RedItalic
highlight! link typescriptFuncTypeArrow Purple
highlight! link typescriptTernaryOp Orange
highlight! link typescriptParenExp Blue
highlight! link typescriptIndexExpr Blue
highlight! link typescriptDotNotation Grey
highlight! link typescriptGlobalNumberDot Grey
highlight! link typescriptGlobalStringDot Grey
highlight! link typescriptGlobalArrayDot Grey
highlight! link typescriptGlobalObjectDot Grey
highlight! link typescriptGlobalSymbolDot Grey
highlight! link typescriptGlobalMathDot Grey
highlight! link typescriptGlobalDateDot Grey
highlight! link typescriptGlobalJSONDot Grey
highlight! link typescriptGlobalRegExpDot Grey
highlight! link typescriptGlobalPromiseDot Grey
highlight! link typescriptGlobalURLDot Grey
highlight! link typescriptGlobalMethod Green
highlight! link typescriptDOMStorageMethod Green
highlight! link typescriptFileMethod Green
highlight! link typescriptFileReaderMethod Green
highlight! link typescriptFileListMethod Green
highlight! link typescriptBlobMethod Green
highlight! link typescriptURLStaticMethod Green
highlight! link typescriptNumberStaticMethod Green
highlight! link typescriptNumberMethod Green
highlight! link typescriptDOMNodeMethod Green
highlight! link typescriptPaymentMethod Green
highlight! link typescriptPaymentResponseMethod Green
highlight! link typescriptHeadersMethod Green
highlight! link typescriptRequestMethod Green
highlight! link typescriptResponseMethod Green
highlight! link typescriptES6SetMethod Green
highlight! link typescriptReflectMethod Green
highlight! link typescriptBOMWindowMethod Green
highlight! link typescriptGeolocationMethod Green
highlight! link typescriptServiceWorkerMethod Green
highlight! link typescriptCacheMethod Green
highlight! link typescriptES6MapMethod Green
highlight! link typescriptFunctionMethod Green
highlight! link typescriptRegExpMethod Green
highlight! link typescriptXHRMethod Green
highlight! link typescriptBOMNavigatorMethod Green
highlight! link typescriptServiceWorkerMethod Green
highlight! link typescriptIntlMethod Green
highlight! link typescriptDOMEventTargetMethod Green
highlight! link typescriptDOMEventMethod Green
highlight! link typescriptDOMDocMethod Green
highlight! link typescriptStringStaticMethod Green
highlight! link typescriptStringMethod Green
highlight! link typescriptSymbolStaticMethod Green
highlight! link typescriptObjectStaticMethod Green
highlight! link typescriptObjectMethod Green
highlight! link typescriptJSONStaticMethod Green
highlight! link typescriptEncodingMethod Green
highlight! link typescriptBOMLocationMethod Green
highlight! link typescriptPromiseStaticMethod Green
highlight! link typescriptPromiseMethod Green
highlight! link typescriptSubtleCryptoMethod Green
highlight! link typescriptCryptoMethod Green
highlight! link typescriptBOMHistoryMethod Green
highlight! link typescriptDOMFormMethod Green
highlight! link typescriptConsoleMethod Green
highlight! link typescriptDateStaticMethod Green
highlight! link typescriptDateMethod Green
highlight! link typescriptArrayStaticMethod Green
highlight! link typescriptArrayMethod Green
highlight! link typescriptMathStaticMethod Green
highlight! link typescriptStringProperty Aqua
highlight! link typescriptDOMStorageProp Aqua
highlight! link typescriptFileReaderProp Aqua
highlight! link typescriptURLUtilsProp Aqua
highlight! link typescriptNumberStaticProp Aqua
highlight! link typescriptDOMNodeProp Aqua
highlight! link typescriptBOMWindowProp Aqua
highlight! link typescriptRequestProp Aqua
highlight! link typescriptResponseProp Aqua
highlight! link typescriptPaymentProp Aqua
highlight! link typescriptPaymentResponseProp Aqua
highlight! link typescriptPaymentAddressProp Aqua
highlight! link typescriptPaymentShippingOptionProp Aqua
highlight! link typescriptES6SetProp Aqua
highlight! link typescriptServiceWorkerProp Aqua
highlight! link typescriptES6MapProp Aqua
highlight! link typescriptRegExpStaticProp Aqua
highlight! link typescriptRegExpProp Aqua
highlight! link typescriptBOMNavigatorProp Green
highlight! link typescriptXHRProp Aqua
highlight! link typescriptDOMEventProp Aqua
highlight! link typescriptDOMDocProp Aqua
highlight! link typescriptBOMNetworkProp Aqua
highlight! link typescriptSymbolStaticProp Aqua
highlight! link typescriptEncodingProp Aqua
highlight! link typescriptBOMLocationProp Aqua
highlight! link typescriptCryptoProp Aqua
highlight! link typescriptDOMFormProp Aqua
highlight! link typescriptBOMHistoryProp Aqua
highlight! link typescriptMathStaticProp Aqua
" }}}
" syn_end }}}
" syn_begin: dart {{{
" dart-lang: https://github.com/dart-lang/dart-vim-plugin {{{
highlight! link dartCoreClasses Aqua
highlight! link dartTypeName Aqua
highlight! link dartInterpolation Blue
highlight! link dartTypeDef RedItalic
highlight! link dartClassDecl RedItalic
highlight! link dartLibrary PurpleItalic
highlight! link dartMetadata Blue
" }}}
" syn_end }}}
" syn_begin: coffee {{{
" vim-coffee-script: https://github.com/kchmck/vim-coffee-script {{{
highlight! link coffeeExtendedOp Orange
highlight! link coffeeSpecialOp Fg
highlight! link coffeeDotAccess Grey
highlight! link coffeeCurly Fg
highlight! link coffeeParen Fg
highlight! link coffeeBracket Fg
highlight! link coffeeParens Blue
highlight! link coffeeBrackets Blue
highlight! link coffeeCurlies Blue
highlight! link coffeeOperator RedItalic
highlight! link coffeeStatement Orange
highlight! link coffeeSpecialIdent Purple
highlight! link coffeeObject Purple
highlight! link coffeeObjAssign Aqua
" }}}
" syn_end }}}
" syn_begin: purescript {{{
" purescript-vim: https://github.com/purescript-contrib/purescript-vim {{{
highlight! link purescriptModuleKeyword PurpleItalic
highlight! link purescriptModule Aqua
highlight! link purescriptModuleParams Blue
highlight! link purescriptAsKeyword OrangeItalic
highlight! link purescriptHidingKeyword OrangeItalic
highlight! link purescriptWhere OrangeItalic
highlight! link purescriptIdentifier Blue
highlight! link purescriptFunction Yellow
highlight! link purescriptType Aqua
" }}}
" syn_end }}}
" syn_begin: c/cpp/objc/objcpp {{{
" vim-cpp-enhanced-highlight: https://github.com/octol/vim-cpp-enhanced-highlight {{{
highlight! link cppSTLnamespace Purple
highlight! link cppSTLtype Yellow
highlight! link cppAccess PurpleItalic
highlight! link cppStructure RedItalic
highlight! link cppSTLios Aqua
highlight! link cppSTLiterator PurpleItalic
highlight! link cppSTLexception Purple
" }}}
" vim-cpp-modern: https://github.com/bfrg/vim-cpp-modern {{{
highlight! link cppSTLVariable Aqua
" }}}
" chromatica: https://github.com/arakashic/chromatica.nvim {{{
highlight! link Member TSVariable
highlight! link Variable TSVariable
highlight! link Namespace TSNamespace
highlight! link EnumConstant TSNumber
highlight! link chromaticaException TSException
highlight! link chromaticaCast TSLabel
highlight! link OperatorOverload TSOperator
highlight! link AccessQual TSOperator
highlight! link Linkage TSOperator
highlight! link AutoType TSType
" }}}
" vim-lsp-cxx-highlight https://github.com/jackguo380/vim-lsp-cxx-highlight {{{
highlight! link LspCxxHlSkippedRegion Grey
highlight! link LspCxxHlSkippedRegionBeginEnd TSKeyword
highlight! link LspCxxHlGroupEnumConstant BlueItalic
highlight! link LspCxxHlGroupNamespace TSNamespace
highlight! link LspCxxHlGroupMemberVariable TSVariable
" }}}
" syn_end }}}
" syn_begin: objc {{{
" builtin: {{{
highlight! link objcModuleImport PurpleItalic
highlight! link objcException RedItalic
highlight! link objcProtocolList Aqua
highlight! link objcObjDef PurpleItalic
highlight! link objcDirective RedItalic
highlight! link objcPropertyAttribute Orange
highlight! link objcHiddenArgument Aqua
" }}}
" syn_end }}}
" syn_begin: cs {{{
" builtin: https://github.com/nickspoons/vim-cs {{{
highlight! link csUnspecifiedStatement PurpleItalic
highlight! link csStorage RedItalic
highlight! link csClass RedItalic
highlight! link csNewType Aqua
highlight! link csContextualStatement PurpleItalic
highlight! link csInterpolationDelimiter Yellow
highlight! link csInterpolation Yellow
highlight! link csEndColon Fg
" }}}
" syn_end }}}
" syn_begin: python {{{
" builtin: {{{
highlight! link pythonBuiltin Yellow
highlight! link pythonExceptions Purple
highlight! link pythonDecoratorName Blue
" }}}
" python-syntax: https://github.com/vim-python/python-syntax {{{
highlight! link pythonExClass Purple
highlight! link pythonBuiltinType Yellow
highlight! link pythonBuiltinObj Blue
highlight! link pythonDottedName PurpleItalic
highlight! link pythonBuiltinFunc Green
highlight! link pythonFunction Aqua
highlight! link pythonDecorator Orange
highlight! link pythonInclude Include
highlight! link pythonImport PreProc
highlight! link pythonRun Blue
highlight! link pythonCoding Grey
highlight! link pythonOperator Orange
highlight! link pythonConditional RedItalic
highlight! link pythonRepeat RedItalic
highlight! link pythonException RedItalic
highlight! link pythonNone Aqua
highlight! link pythonDot Grey
" }}}
" semshi: https://github.com/numirias/semshi {{{
call everforest#highlight('semshiUnresolved', s:palette.yellow, s:palette.none, 'undercurl')
highlight! link semshiImported TSInclude
highlight! link semshiParameter TSParameter
highlight! link semshiParameterUnused Grey
highlight! link semshiSelf TSVariableBuiltin
highlight! link semshiGlobal TSType
highlight! link semshiBuiltin TSTypeBuiltin
highlight! link semshiAttribute TSAttribute
highlight! link semshiLocal TSKeyword
highlight! link semshiFree TSKeyword
highlight! link semshiSelected CurrentWord
highlight! link semshiErrorSign RedSign
highlight! link semshiErrorChar RedSign
" }}}
" syn_end }}}
" syn_begin: lua {{{
" builtin: {{{
highlight! link luaFunc Green
highlight! link luaFunction Aqua
highlight! link luaTable Fg
highlight! link luaIn RedItalic
" }}}
" nvim-treesitter/nvim-treesitter {{{
highlight! link luaTSField Fg
highlight! link luaTSConstructor TSPunctBracket
if has('nvim-0.8.0')
  highlight! link @field.lua luaTSField
  highlight! link @constructor.lua luaTSConstructor
endif
" }}}
" vim-lua: https://github.com/tbastos/vim-lua {{{
highlight! link luaFuncCall Green
highlight! link luaLocal Orange
highlight! link luaSpecialValue Green
highlight! link luaBraces Fg
highlight! link luaBuiltIn Purple
highlight! link luaNoise Grey
highlight! link luaLabel Purple
highlight! link luaFuncTable Yellow
highlight! link luaFuncArgName Blue
highlight! link luaEllipsis Orange
highlight! link luaDocTag Green
" }}}
" syn_end }}}
" syn_begin: moon {{{
" moonscript-vim: https://github.com/leafo/moonscript-vim {{{
highlight! link moonInterpDelim Yellow
highlight! link moonInterp Blue
highlight! link moonFunction Green
highlight! link moonLuaFunc Aqua
highlight! link moonSpecialVar Purple
highlight! link moonObject Yellow
highlight! link moonDotAccess Grey
" }}}
" syn_end }}}
" syn_begin: java {{{
" builtin: {{{
highlight! link javaClassDecl RedItalic
highlight! link javaMethodDecl RedItalic
highlight! link javaVarArg Green
highlight! link javaAnnotation Blue
highlight! link javaUserLabel Purple
highlight! link javaTypedef Aqua
highlight! link javaParen Fg
highlight! link javaParen1 Fg
highlight! link javaParen2 Fg
highlight! link javaParen3 Fg
highlight! link javaParen4 Fg
highlight! link javaParen5 Fg
" }}}
" syn_end }}}
" syn_begin: kotlin {{{
" kotlin-vim: https://github.com/udalov/kotlin-vim {{{
highlight! link ktSimpleInterpolation Yellow
highlight! link ktComplexInterpolation Yellow
highlight! link ktComplexInterpolationBrace Yellow
highlight! link ktStructure RedItalic
highlight! link ktKeyword Aqua
" }}}
" syn_end }}}
" syn_begin: scala {{{
" builtin: https://github.com/derekwyatt/vim-scala {{{
highlight! link scalaNameDefinition Aqua
highlight! link scalaInterpolationBoundary Yellow
highlight! link scalaInterpolation Blue
highlight! link scalaTypeOperator Orange
highlight! link scalaOperator Orange
highlight! link scalaKeywordModifier Orange
" }}}
" syn_end }}}
" syn_begin: go {{{
" builtin: https://github.com/fatih/vim-go {{{
highlight! link goPackage Define
highlight! link goImport Include
highlight! link goVar OrangeItalic
highlight! link goConst goVar
highlight! link goType Yellow
highlight! link goSignedInts goType
highlight! link goUnsignedInts goType
highlight! link goFloats goType
highlight! link goComplexes goType
highlight! link goVarDefs Aqua
highlight! link goDeclType OrangeItalic
highlight! link goFunctionCall Function
highlight! link goPredefinedIdentifiers Aqua
highlight! link goBuiltins Function
highlight! link goVarArgs Grey
" }}}
" nvim-treesitter/nvim-treesitter {{{
highlight! link goTSInclude Purple
highlight! link goTSNamespace Fg
highlight! link goTSProperty Identifier
highlight! link goTSConstBuiltin AquaItalic
if has('nvim-0.8.0')
  highlight! link @include.go goTSInclude
  highlight! link @namespace.go goTSNamespace
  highlight! link @property.go goTSProperty
  highlight! link @constant.builtin.go goTSConstBuiltin
endif
" }}}
" syn_end }}}
" syn_begin: rust {{{
" builtin: https://github.com/rust-lang/rust.vim {{{
highlight! link rustStructure Orange
highlight! link rustIdentifier Purple
highlight! link rustModPath Orange
highlight! link rustModPathSep Grey
highlight! link rustSelf Blue
highlight! link rustSuper Blue
highlight! link rustDeriveTrait PurpleItalic
highlight! link rustEnumVariant Purple
highlight! link rustMacroVariable Blue
highlight! link rustAssert Aqua
highlight! link rustPanic Aqua
highlight! link rustPubScopeCrate PurpleItalic
" }}}
" coc-rust-analyzer: https://github.com/fannheyward/coc-rust-analyzer {{{
highlight! link CocRustChainingHint Grey
highlight! link CocRustTypeHint Grey
" }}}
" syn_end }}}
" syn_begin: swift {{{
" swift.vim: https://github.com/keith/swift.vim {{{
highlight! link swiftInterpolatedWrapper Yellow
highlight! link swiftInterpolatedString Blue
highlight! link swiftProperty Aqua
highlight! link swiftTypeDeclaration Orange
highlight! link swiftClosureArgument Purple
" }}}
" syn_end }}}
" syn_begin: php {{{
" builtin: https://jasonwoof.com/gitweb/?p=vim-syntax.git;a=blob;f=php.vim;hb=HEAD {{{
highlight! link phpVarSelector Blue
highlight! link phpDefine OrangeItalic
highlight! link phpStructure RedItalic
highlight! link phpSpecialFunction Green
highlight! link phpInterpSimpleCurly Yellow
highlight! link phpComparison Orange
highlight! link phpMethodsVar Aqua
highlight! link phpMemberSelector Green
" }}}
" php.vim: https://github.com/StanAngeloff/php.vim {{{
highlight! link phpParent Fg
highlight! link phpNowDoc Green
highlight! link phpFunction Green
highlight! link phpMethod Green
highlight! link phpClass Orange
highlight! link phpSuperglobals Purple
" }}}
" syn_end }}}
" syn_begin: ruby {{{
" builtin: https://github.com/vim-ruby/vim-ruby {{{
highlight! link rubyKeywordAsMethod Green
highlight! link rubyInterpolation Yellow
highlight! link rubyInterpolationDelimiter Yellow
highlight! link rubyStringDelimiter Green
highlight! link rubyBlockParameterList Blue
highlight! link rubyDefine RedItalic
highlight! link rubyModuleName Purple
highlight! link rubyAccess Orange
highlight! link rubyAttribute Yellow
highlight! link rubyMacro RedItalic
" }}}
" syn_end }}}
" syn_begin: haskell {{{
" haskell-vim: https://github.com/neovimhaskell/haskell-vim {{{
highlight! link haskellBrackets Blue
highlight! link haskellIdentifier Yellow
highlight! link haskellAssocType Aqua
highlight! link haskellQuotedType Aqua
highlight! link haskellType Aqua
highlight! link haskellDeclKeyword RedItalic
highlight! link haskellWhere RedItalic
highlight! link haskellDeriving PurpleItalic
highlight! link haskellForeignKeywords PurpleItalic
" }}}
" syn_end }}}
" syn_begin: perl/pod {{{
" builtin: https://github.com/vim-perl/vim-perl {{{
highlight! link perlStatementPackage PurpleItalic
highlight! link perlStatementInclude PurpleItalic
highlight! link perlStatementStorage Orange
highlight! link perlStatementList Orange
highlight! link perlMatchStartEnd Orange
highlight! link perlVarSimpleMemberName Aqua
highlight! link perlVarSimpleMember Fg
highlight! link perlMethod Green
highlight! link podVerbatimLine Green
highlight! link podCmdText Yellow
" }}}
" syn_end }}}
" syn_begin: ocaml {{{
" builtin: https://github.com/rgrinberg/vim-ocaml {{{
highlight! link ocamlArrow Orange
highlight! link ocamlEqual Orange
highlight! link ocamlOperator Orange
highlight! link ocamlKeyChar Orange
highlight! link ocamlModPath Green
highlight! link ocamlFullMod Green
highlight! link ocamlModule Purple
highlight! link ocamlConstructor Aqua
highlight! link ocamlFuncWith Yellow
highlight! link ocamlWith Yellow
highlight! link ocamlModParam Fg
highlight! link ocamlModParam1 Fg
highlight! link ocamlAnyVar Blue
highlight! link ocamlPpxEncl Orange
highlight! link ocamlPpxIdentifier Blue
highlight! link ocamlSigEncl Orange
highlight! link ocamlStructEncl Aqua
highlight! link ocamlModParam1 Blue
" }}}
" syn_end }}}
" syn_begin: erlang {{{
" builtin: https://github.com/vim-erlang/vim-erlang-runtime {{{
highlight! link erlangAtom Aqua
highlight! link erlangLocalFuncRef Green
highlight! link erlangLocalFuncCall Green
highlight! link erlangGlobalFuncRef Green
highlight! link erlangGlobalFuncCall Green
highlight! link erlangAttribute PurpleItalic
highlight! link erlangPipe Orange
" }}}
" syn_end }}}
" syn_begin: elixir {{{
" vim-elixir: https://github.com/elixir-editors/vim-elixir {{{
highlight! link elixirStringDelimiter Green
highlight! link elixirKeyword Orange
highlight! link elixirInterpolation Yellow
highlight! link elixirInterpolationDelimiter Yellow
highlight! link elixirSelf Purple
highlight! link elixirPseudoVariable Purple
highlight! link elixirModuleDefine PurpleItalic
highlight! link elixirBlockDefinition RedItalic
highlight! link elixirDefine RedItalic
highlight! link elixirPrivateDefine RedItalic
highlight! link elixirGuard RedItalic
highlight! link elixirPrivateGuard RedItalic
highlight! link elixirProtocolDefine RedItalic
highlight! link elixirImplDefine RedItalic
highlight! link elixirRecordDefine RedItalic
highlight! link elixirPrivateRecordDefine RedItalic
highlight! link elixirMacroDefine RedItalic
highlight! link elixirPrivateMacroDefine RedItalic
highlight! link elixirDelegateDefine RedItalic
highlight! link elixirOverridableDefine RedItalic
highlight! link elixirExceptionDefine RedItalic
highlight! link elixirCallbackDefine RedItalic
highlight! link elixirStructDefine RedItalic
highlight! link elixirExUnitMacro RedItalic
" }}}
" syn_end }}}
" syn_begin: lisp {{{
" builtin: http://www.drchip.org/astronaut/vim/index.html#SYNTAX_LISP {{{
highlight! link lispAtomMark Green
highlight! link lispKey Aqua
highlight! link lispFunc OrangeItalic
" }}}
" syn_end }}}
" syn_begin: clojure {{{
" builtin: https://github.com/guns/vim-clojure-static {{{
highlight! link clojureMacro PurpleItalic
highlight! link clojureFunc Aqua
highlight! link clojureConstant Yellow
highlight! link clojureSpecial RedItalic
highlight! link clojureDefine RedItalic
highlight! link clojureKeyword Orange
highlight! link clojureVariable Blue
highlight! link clojureMeta Yellow
highlight! link clojureDeref Yellow
" }}}
" syn_end }}}
" syn_begin: matlab {{{
" builtin: {{{
highlight! link matlabSemicolon Fg
highlight! link matlabFunction RedItalic
highlight! link matlabImplicit Green
highlight! link matlabDelimiter Fg
highlight! link matlabOperator Green
highlight! link matlabArithmeticOperator Orange
highlight! link matlabArithmeticOperator Orange
highlight! link matlabRelationalOperator Orange
highlight! link matlabRelationalOperator Orange
highlight! link matlabLogicalOperator Orange
" }}}
" syn_end }}}
" syn_begin: octave {{{
" vim-octave: https://github.com/McSinyx/vim-octave{{{
highlight! link octaveDelimiter Fg
highlight! link octaveSemicolon Grey
highlight! link octaveOperator Orange
highlight! link octaveVariable YellowItalic
highlight! link octaveVarKeyword YellowItalic
" }}}
" syn_end }}}
" syn_begin: sh/zsh {{{
" builtin: http://www.drchip.org/astronaut/vim/index.html#SYNTAX_SH {{{
highlight! link shRange Fg
highlight! link shTestOpr Orange
highlight! link shOption Aqua
highlight! link bashStatement Orange
highlight! link shOperator Orange
highlight! link shQuote Green
highlight! link shSet Orange
highlight! link shSetList Blue
highlight! link shSnglCase Orange
highlight! link shVariable Blue
highlight! link shVarAssign Orange
highlight! link shCmdSubRegion Green
highlight! link shCommandSub Orange
highlight! link shFunctionOne Green
highlight! link shFunctionKey RedItalic
" }}}
" syn_end }}}
" syn_begin: zsh {{{
" builtin: https://github.com/chrisbra/vim-zsh {{{
highlight! link zshOptStart PurpleItalic
highlight! link zshOption Blue
highlight! link zshSubst Yellow
highlight! link zshFunction Green
highlight! link zshDeref Blue
highlight! link zshTypes Orange
highlight! link zshVariableDef Blue
" }}}
" syn_end }}}
" syn_begin: fish {{{
" vim-fish: https://github.com/georgewitteman/vim-fish {{{
highlight! link fishStatement Orange
highlight! link fishLabel RedItalic
highlight! link fishCommandSub Yellow
" }}}
" syn_end }}}
" syn_begin: ps1 {{{
" vim-ps1: https://github.com/PProvost/vim-ps1 {{{
highlight! link ps1FunctionInvocation Aqua
highlight! link ps1FunctionDeclaration Aqua
highlight! link ps1InterpolationDelimiter Yellow
highlight! link ps1BuiltIn Yellow
" }}}
" syn_end }}}
" syn_begin: vim {{{
call everforest#highlight('vimCommentTitle', s:palette.grey1, s:palette.none, 'bold')
highlight! link vimLet Orange
highlight! link vimFunction Green
highlight! link vimIsCommand Fg
highlight! link vimUserFunc Green
highlight! link vimFuncName Green
highlight! link vimMap PurpleItalic
highlight! link vimNotation Aqua
highlight! link vimMapLhs Green
highlight! link vimMapRhs Green
highlight! link vimSetEqual Yellow
highlight! link vimSetSep Fg
highlight! link vimOption Aqua
highlight! link vimUserAttrbKey Yellow
highlight! link vimUserAttrb Green
highlight! link vimAutoCmdSfxList Aqua
highlight! link vimSynType Orange
highlight! link vimHiBang Orange
highlight! link vimSet Yellow
highlight! link vimSetSep Grey
highlight! link vimContinue Grey
" syn_end }}}
" syn_begin: make {{{
highlight! link makeIdent Aqua
highlight! link makeSpecTarget Yellow
highlight! link makeTarget Blue
highlight! link makeCommands Orange
" syn_end }}}
" syn_begin: cmake {{{
highlight! link cmakeCommand Orange
highlight! link cmakeKWconfigure_package_config_file Yellow
highlight! link cmakeKWwrite_basic_package_version_file Yellow
highlight! link cmakeKWExternalProject Aqua
highlight! link cmakeKWadd_compile_definitions Aqua
highlight! link cmakeKWadd_compile_options Aqua
highlight! link cmakeKWadd_custom_command Aqua
highlight! link cmakeKWadd_custom_target Aqua
highlight! link cmakeKWadd_definitions Aqua
highlight! link cmakeKWadd_dependencies Aqua
highlight! link cmakeKWadd_executable Aqua
highlight! link cmakeKWadd_library Aqua
highlight! link cmakeKWadd_link_options Aqua
highlight! link cmakeKWadd_subdirectory Aqua
highlight! link cmakeKWadd_test Aqua
highlight! link cmakeKWbuild_command Aqua
highlight! link cmakeKWcmake_host_system_information Aqua
highlight! link cmakeKWcmake_minimum_required Aqua
highlight! link cmakeKWcmake_parse_arguments Aqua
highlight! link cmakeKWcmake_policy Aqua
highlight! link cmakeKWconfigure_file Aqua
highlight! link cmakeKWcreate_test_sourcelist Aqua
highlight! link cmakeKWctest_build Aqua
highlight! link cmakeKWctest_configure Aqua
highlight! link cmakeKWctest_coverage Aqua
highlight! link cmakeKWctest_memcheck Aqua
highlight! link cmakeKWctest_run_script Aqua
highlight! link cmakeKWctest_start Aqua
highlight! link cmakeKWctest_submit Aqua
highlight! link cmakeKWctest_test Aqua
highlight! link cmakeKWctest_update Aqua
highlight! link cmakeKWctest_upload Aqua
highlight! link cmakeKWdefine_property Aqua
highlight! link cmakeKWdoxygen_add_docs Aqua
highlight! link cmakeKWenable_language Aqua
highlight! link cmakeKWenable_testing Aqua
highlight! link cmakeKWexec_program Aqua
highlight! link cmakeKWexecute_process Aqua
highlight! link cmakeKWexport Aqua
highlight! link cmakeKWexport_library_dependencies Aqua
highlight! link cmakeKWfile Aqua
highlight! link cmakeKWfind_file Aqua
highlight! link cmakeKWfind_library Aqua
highlight! link cmakeKWfind_package Aqua
highlight! link cmakeKWfind_path Aqua
highlight! link cmakeKWfind_program Aqua
highlight! link cmakeKWfltk_wrap_ui Aqua
highlight! link cmakeKWforeach Aqua
highlight! link cmakeKWfunction Aqua
highlight! link cmakeKWget_cmake_property Aqua
highlight! link cmakeKWget_directory_property Aqua
highlight! link cmakeKWget_filename_component Aqua
highlight! link cmakeKWget_property Aqua
highlight! link cmakeKWget_source_file_property Aqua
highlight! link cmakeKWget_target_property Aqua
highlight! link cmakeKWget_test_property Aqua
highlight! link cmakeKWif Aqua
highlight! link cmakeKWinclude Aqua
highlight! link cmakeKWinclude_directories Aqua
highlight! link cmakeKWinclude_external_msproject Aqua
highlight! link cmakeKWinclude_guard Aqua
highlight! link cmakeKWinstall Aqua
highlight! link cmakeKWinstall_files Aqua
highlight! link cmakeKWinstall_programs Aqua
highlight! link cmakeKWinstall_targets Aqua
highlight! link cmakeKWlink_directories Aqua
highlight! link cmakeKWlist Aqua
highlight! link cmakeKWload_cache Aqua
highlight! link cmakeKWload_command Aqua
highlight! link cmakeKWmacro Aqua
highlight! link cmakeKWmark_as_advanced Aqua
highlight! link cmakeKWmath Aqua
highlight! link cmakeKWmessage Aqua
highlight! link cmakeKWoption Aqua
highlight! link cmakeKWproject Aqua
highlight! link cmakeKWqt_wrap_cpp Aqua
highlight! link cmakeKWqt_wrap_ui Aqua
highlight! link cmakeKWremove Aqua
highlight! link cmakeKWseparate_arguments Aqua
highlight! link cmakeKWset Aqua
highlight! link cmakeKWset_directory_properties Aqua
highlight! link cmakeKWset_property Aqua
highlight! link cmakeKWset_source_files_properties Aqua
highlight! link cmakeKWset_target_properties Aqua
highlight! link cmakeKWset_tests_properties Aqua
highlight! link cmakeKWsource_group Aqua
highlight! link cmakeKWstring Aqua
highlight! link cmakeKWsubdirs Aqua
highlight! link cmakeKWtarget_compile_definitions Aqua
highlight! link cmakeKWtarget_compile_features Aqua
highlight! link cmakeKWtarget_compile_options Aqua
highlight! link cmakeKWtarget_include_directories Aqua
highlight! link cmakeKWtarget_link_directories Aqua
highlight! link cmakeKWtarget_link_libraries Aqua
highlight! link cmakeKWtarget_link_options Aqua
highlight! link cmakeKWtarget_precompile_headers Aqua
highlight! link cmakeKWtarget_sources Aqua
highlight! link cmakeKWtry_compile Aqua
highlight! link cmakeKWtry_run Aqua
highlight! link cmakeKWunset Aqua
highlight! link cmakeKWuse_mangled_mesa Aqua
highlight! link cmakeKWvariable_requires Aqua
highlight! link cmakeKWvariable_watch Aqua
highlight! link cmakeKWwrite_file Aqua
" syn_end }}}
" syn_begin: json {{{
" builtin {{{
highlight! link jsonKeyword Green
highlight! link jsonString Fg
highlight! link jsonQuote Grey
" }}}
" nvim-treesitter/nvim-treesitter {{{
highlight! link jsonTSLabel jsonKeyword
highlight! link jsonTSString jsonString
highlight! link jsonTSStringEscape SpecialChar
if has('nvim-0.8.0')
  highlight! link @label.json jsonTSLabel
  highlight! link @string.json jsonTSString
  highlight! link @string.escape jsonTSStringEscape
endif
" }}}
" syn_end }}}
" syn_begin: yaml {{{
" builtin {{{
highlight! link yamlBlockMappingKey Green
highlight! link yamlString Fg
highlight! link yamlConstant OrangeItalic
highlight! link yamlKeyValueDelimiter Grey
" }}}
" nvim-treesitter/nvim-treesitter {{{
highlight! link yamlTSField yamlBlockMappingKey
highlight! link yamlTSString yamlString
highlight! link yamlTSStringEscape SpecialChar
highlight! link yamlTSBoolean yamlConstant
highlight! link yamlTSConstBuiltin yamlConstant
if has('nvim-0.8.0')
  highlight! link @field.yaml yamlTSField
  highlight! link @string.yaml yamlTSString
  highlight! link @string.escape.yaml yamlTSStringEscape
  highlight! link @boolean.yaml yamlTSBoolean
  highlight! link @constant.builtin.yaml yamlTSConstBuiltin
endif
highlight! link yamlKey yamlBlockMappingKey  " stephpy/vim-yaml
" }}}
" syn_end }}}
" syn_begin: toml {{{
" builtin: https://github.com/cespare/vim-toml {{{
call everforest#highlight('tomlTable', s:palette.orange, s:palette.none, 'bold')
highlight! link tomlKey Green
highlight! link tomlString Fg
highlight! link tomlDate Special
highlight! link tomlBoolean Aqua
highlight! link tomlTableArray tomlTable
" }}}
" nvim-treesitter/nvim-treesitter {{{
highlight! link tomlTSProperty tomlKey
highlight! link tomlTSString tomlString
if has('nvim-0.8.0')
  highlight! link @property.toml tomlTSProperty
  highlight! link @string.toml tomlTSString
endif
" }}}
" syn_end }}}
" syn_begin: gitcommit {{{
highlight! link gitcommitSummary Green
highlight! link gitcommitUntracked Grey
highlight! link gitcommitDiscarded Grey
highlight! link gitcommitSelected Grey
highlight! link gitcommitUnmerged Grey
highlight! link gitcommitOnBranch Grey
highlight! link gitcommitArrow Grey
highlight! link gitcommitFile Green
" syn_end }}}
" syn_begin: dosini {{{
call everforest#highlight('dosiniHeader', s:palette.red, s:palette.none, 'bold')
highlight! link dosiniLabel Yellow
highlight! link dosiniValue Green
highlight! link dosiniNumber Green
" syn_end }}}
" syn_begin: help {{{
call everforest#highlight('helpNote', s:palette.purple, s:palette.none, 'bold')
call everforest#highlight('helpHeadline', s:palette.red, s:palette.none, 'bold')
call everforest#highlight('helpHeader', s:palette.orange, s:palette.none, 'bold')
call everforest#highlight('helpURL', s:palette.green, s:palette.none, 'underline')
call everforest#highlight('helpHyperTextEntry', s:palette.yellow, s:palette.none, 'bold')
highlight! link helpHyperTextJump Yellow
highlight! link helpCommand Aqua
highlight! link helpExample Green
highlight! link helpSpecial Blue
highlight! link helpSectionDelim Grey
" syn_end }}}
" }}}

" vim: set sw=2 ts=2 sts=2 et tw=80 ft=vim fdm=marker fmr={{{,}}}:
