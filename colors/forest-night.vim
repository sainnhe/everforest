" -----------------------------------------------------------------------------
" Name:         Forest Night
" Description:  Comfortable & Pleasant Color Scheme for Vim
" Author:       sainnhe <sainnhe@gmail.com>
" Website:      https://github.com/sainnhe/forest-night
" License:      MIT
" -----------------------------------------------------------------------------

" Initialization: {{{
highlight clear
if exists('syntax_on')
  syntax reset
endif

let g:colors_name = 'forest-night'

if !(has('termguicolors') && &termguicolors) && !has('gui_running') && &t_Co != 256
  finish
endif

let s:configuration = forest_night#get_configuration()
let s:palette = forest_night#get_palette()
let s:path = expand('<sfile>:p') " the path of this script
let s:last_modified = 'Tue Oct  6 07:47:21 AM UTC 2020'
let g:forest_night_loaded_file_types = []
" }}}
" Common Highlight Groups: {{{
" UI: {{{
if s:configuration.transparent_background
  call forest_night#highlight('Normal', s:palette.fg, s:palette.none)
  call forest_night#highlight('Terminal', s:palette.fg, s:palette.none)
  call forest_night#highlight('EndOfBuffer', s:palette.bg0, s:palette.none)
  call forest_night#highlight('FoldColumn', s:palette.grey0, s:palette.none)
  call forest_night#highlight('Folded', s:palette.grey1, s:palette.none)
  call forest_night#highlight('SignColumn', s:palette.fg, s:palette.none)
  call forest_night#highlight('ToolbarLine', s:palette.fg, s:palette.none)
else
  call forest_night#highlight('Normal', s:palette.fg, s:palette.bg0)
  call forest_night#highlight('Terminal', s:palette.fg, s:palette.bg0)
  call forest_night#highlight('EndOfBuffer', s:palette.bg0, s:palette.bg0)
  call forest_night#highlight('Folded', s:palette.grey1, s:palette.bg1)
  call forest_night#highlight('ToolbarLine', s:palette.fg, s:palette.bg2)
  if s:configuration.sign_column_background ==# 'default'
    call forest_night#highlight('SignColumn', s:palette.fg, s:palette.bg1)
    call forest_night#highlight('FoldColumn', s:palette.grey1, s:palette.bg1)
  else
    call forest_night#highlight('SignColumn', s:palette.fg, s:palette.none)
    call forest_night#highlight('FoldColumn', s:palette.grey0, s:palette.none)
  endif
endif
call forest_night#highlight('IncSearch', s:palette.bg0, s:palette.red)
call forest_night#highlight('Search', s:palette.bg0, s:palette.green)
call forest_night#highlight('ColorColumn', s:palette.none, s:palette.bg1)
call forest_night#highlight('Conceal', s:palette.grey1, s:palette.none)
if s:configuration.cursor ==# 'auto'
  call forest_night#highlight('Cursor', s:palette.none, s:palette.none, 'reverse')
else
  call forest_night#highlight('Cursor', s:palette.bg0, s:palette[s:configuration.cursor])
endif
highlight! link vCursor Cursor
highlight! link iCursor Cursor
highlight! link lCursor Cursor
highlight! link CursorIM Cursor
call forest_night#highlight('CursorColumn', s:palette.none, s:palette.bg1)
call forest_night#highlight('CursorLine', s:palette.none, s:palette.bg1)
call forest_night#highlight('LineNr', s:palette.grey0, s:palette.none)
if (&relativenumber == 1 && &cursorline == 0) || s:configuration.sign_column_background !=# 'default'
  call forest_night#highlight('CursorLineNr', s:palette.fg, s:palette.none)
else
  call forest_night#highlight('CursorLineNr', s:palette.fg, s:palette.bg1)
endif
call forest_night#highlight('DiffAdd', s:palette.none, s:palette.bg_green)
call forest_night#highlight('DiffChange', s:palette.none, s:palette.bg_blue)
call forest_night#highlight('DiffDelete', s:palette.none, s:palette.bg_red)
call forest_night#highlight('DiffText', s:palette.bg0, s:palette.fg)
call forest_night#highlight('Directory', s:palette.green, s:palette.none)
call forest_night#highlight('ErrorMsg', s:palette.red, s:palette.none, 'bold,underline')
call forest_night#highlight('WarningMsg', s:palette.yellow, s:palette.none, 'bold')
call forest_night#highlight('ModeMsg', s:palette.fg, s:palette.none, 'bold')
call forest_night#highlight('MoreMsg', s:palette.yellow, s:palette.none, 'bold')
call forest_night#highlight('MatchParen', s:palette.none, s:palette.bg4)
call forest_night#highlight('NonText', s:palette.bg4, s:palette.none)
call forest_night#highlight('Whitespace', s:palette.bg3, s:palette.none)
call forest_night#highlight('SpecialKey', s:palette.bg3, s:palette.none)
call forest_night#highlight('Pmenu', s:palette.fg, s:palette.bg2)
call forest_night#highlight('PmenuSbar', s:palette.none, s:palette.bg2)
call forest_night#highlight('PmenuSel', s:palette.bg0, s:palette.green)
highlight! link WildMenu PmenuSel
call forest_night#highlight('PmenuThumb', s:palette.none, s:palette.grey1)
call forest_night#highlight('Question', s:palette.yellow, s:palette.none)
call forest_night#highlight('SpellBad', s:palette.red, s:palette.none, 'undercurl', s:palette.red)
call forest_night#highlight('SpellCap', s:palette.blue, s:palette.none, 'undercurl', s:palette.blue)
call forest_night#highlight('SpellLocal', s:palette.aqua, s:palette.none, 'undercurl', s:palette.aqua)
call forest_night#highlight('SpellRare', s:palette.purple, s:palette.none, 'undercurl', s:palette.purple)
call forest_night#highlight('StatusLine', s:palette.grey1, s:palette.bg1)
call forest_night#highlight('StatusLineTerm', s:palette.grey1, s:palette.bg1)
call forest_night#highlight('StatusLineNC', s:palette.grey1, s:palette.bg0)
call forest_night#highlight('StatusLineTermNC', s:palette.grey1, s:palette.bg0)
call forest_night#highlight('TabLine', s:palette.grey2, s:palette.bg3)
call forest_night#highlight('TabLineFill', s:palette.grey1, s:palette.bg1)
call forest_night#highlight('TabLineSel', s:palette.bg0, s:palette.green)
call forest_night#highlight('VertSplit', s:palette.bg4, s:palette.none)
call forest_night#highlight('Visual', s:palette.none, s:palette.bg_visual)
call forest_night#highlight('VisualNOS', s:palette.none, s:palette.bg_visual)
call forest_night#highlight('QuickFixLine', s:palette.purple, s:palette.none, 'bold')
call forest_night#highlight('Debug', s:palette.orange, s:palette.none)
call forest_night#highlight('debugPC', s:palette.bg0, s:palette.green)
call forest_night#highlight('debugBreakpoint', s:palette.bg0, s:palette.red)
call forest_night#highlight('ToolbarButton', s:palette.bg0, s:palette.green)
if has('nvim')
  call forest_night#highlight('Substitute', s:palette.bg0, s:palette.yellow)
  highlight! link TermCursor Cursor
  highlight! link healthError Red
  highlight! link healthSuccess Green
  highlight! link healthWarning Yellow
  highlight! link LspDiagnosticsError Grey
  highlight! link LspDiagnosticsWarning Grey
  highlight! link LspDiagnosticsInformation Grey
  highlight! link LspDiagnosticsHint Grey
  highlight! link LspReferenceText CurrentWord
  highlight! link LspReferenceRead CurrentWord
  highlight! link LspReferenceWrite CurrentWord
endif
" }}}
" Syntax: {{{
call forest_night#highlight('Boolean', s:palette.purple, s:palette.none)
call forest_night#highlight('Number', s:palette.purple, s:palette.none)
call forest_night#highlight('Float', s:palette.purple, s:palette.none)
if s:configuration.enable_italic
  call forest_night#highlight('PreProc', s:palette.purple, s:palette.none, 'italic')
  call forest_night#highlight('PreCondit', s:palette.purple, s:palette.none, 'italic')
  call forest_night#highlight('Include', s:palette.purple, s:palette.none, 'italic')
  call forest_night#highlight('Define', s:palette.purple, s:palette.none, 'italic')
  call forest_night#highlight('Conditional', s:palette.red, s:palette.none, 'italic')
  call forest_night#highlight('Repeat', s:palette.red, s:palette.none, 'italic')
  call forest_night#highlight('Keyword', s:palette.red, s:palette.none, 'italic')
  call forest_night#highlight('Typedef', s:palette.red, s:palette.none, 'italic')
  call forest_night#highlight('Exception', s:palette.red, s:palette.none, 'italic')
  call forest_night#highlight('Statement', s:palette.red, s:palette.none, 'italic')
else
  call forest_night#highlight('PreProc', s:palette.purple, s:palette.none)
  call forest_night#highlight('PreCondit', s:palette.purple, s:palette.none)
  call forest_night#highlight('Include', s:palette.purple, s:palette.none)
  call forest_night#highlight('Define', s:palette.purple, s:palette.none)
  call forest_night#highlight('Conditional', s:palette.red, s:palette.none)
  call forest_night#highlight('Repeat', s:palette.red, s:palette.none)
  call forest_night#highlight('Keyword', s:palette.red, s:palette.none)
  call forest_night#highlight('Typedef', s:palette.red, s:palette.none)
  call forest_night#highlight('Exception', s:palette.red, s:palette.none)
  call forest_night#highlight('Statement', s:palette.red, s:palette.none)
endif
call forest_night#highlight('Error', s:palette.red, s:palette.none)
call forest_night#highlight('StorageClass', s:palette.orange, s:palette.none)
call forest_night#highlight('Tag', s:palette.orange, s:palette.none)
call forest_night#highlight('Label', s:palette.orange, s:palette.none)
call forest_night#highlight('Structure', s:palette.orange, s:palette.none)
call forest_night#highlight('Operator', s:palette.orange, s:palette.none)
call forest_night#highlight('Title', s:palette.orange, s:palette.none, 'bold')
call forest_night#highlight('Special', s:palette.yellow, s:palette.none)
call forest_night#highlight('SpecialChar', s:palette.yellow, s:palette.none)
call forest_night#highlight('Type', s:palette.yellow, s:palette.none)
call forest_night#highlight('Function', s:palette.green, s:palette.none)
call forest_night#highlight('String', s:palette.green, s:palette.none)
call forest_night#highlight('Character', s:palette.green, s:palette.none)
call forest_night#highlight('Constant', s:palette.aqua, s:palette.none)
call forest_night#highlight('Macro', s:palette.aqua, s:palette.none)
call forest_night#highlight('Identifier', s:palette.blue, s:palette.none)
if s:configuration.disable_italic_comment
  call forest_night#highlight('Comment', s:palette.grey1, s:palette.none)
  call forest_night#highlight('SpecialComment', s:palette.grey1, s:palette.none)
  call forest_night#highlight('Todo', s:palette.purple, s:palette.none)
else
  call forest_night#highlight('Comment', s:palette.grey1, s:palette.none, 'italic')
  call forest_night#highlight('SpecialComment', s:palette.grey1, s:palette.none, 'italic')
  call forest_night#highlight('Todo', s:palette.purple, s:palette.none, 'italic')
endif
call forest_night#highlight('Delimiter', s:palette.fg, s:palette.none)
call forest_night#highlight('Ignore', s:palette.grey1, s:palette.none)
call forest_night#highlight('Underlined', s:palette.none, s:palette.none, 'underline')
" }}}
" Predefined Highlight Groups: {{{
call forest_night#highlight('Fg', s:palette.fg, s:palette.none)
call forest_night#highlight('Grey', s:palette.grey1, s:palette.none)
call forest_night#highlight('Red', s:palette.red, s:palette.none)
call forest_night#highlight('Orange', s:palette.orange, s:palette.none)
call forest_night#highlight('Yellow', s:palette.yellow, s:palette.none)
call forest_night#highlight('Green', s:palette.green, s:palette.none)
call forest_night#highlight('Aqua', s:palette.aqua, s:palette.none)
call forest_night#highlight('Blue', s:palette.blue, s:palette.none)
call forest_night#highlight('Purple', s:palette.purple, s:palette.none)
if s:configuration.enable_italic
  call forest_night#highlight('RedItalic', s:palette.red, s:palette.none, 'italic')
  call forest_night#highlight('OrangeItalic', s:palette.orange, s:palette.none, 'italic')
  call forest_night#highlight('YellowItalic', s:palette.yellow, s:palette.none, 'italic')
  call forest_night#highlight('GreenItalic', s:palette.green, s:palette.none, 'italic')
  call forest_night#highlight('AquaItalic', s:palette.aqua, s:palette.none, 'italic')
  call forest_night#highlight('BlueItalic', s:palette.blue, s:palette.none, 'italic')
  call forest_night#highlight('PurpleItalic', s:palette.purple, s:palette.none, 'italic')
else
  call forest_night#highlight('RedItalic', s:palette.red, s:palette.none)
  call forest_night#highlight('OrangeItalic', s:palette.orange, s:palette.none)
  call forest_night#highlight('YellowItalic', s:palette.yellow, s:palette.none)
  call forest_night#highlight('GreenItalic', s:palette.green, s:palette.none)
  call forest_night#highlight('AquaItalic', s:palette.aqua, s:palette.none)
  call forest_night#highlight('BlueItalic', s:palette.blue, s:palette.none)
  call forest_night#highlight('PurpleItalic', s:palette.purple, s:palette.none)
endif
if s:configuration.transparent_background || s:configuration.sign_column_background !=# 'default'
  call forest_night#highlight('RedSign', s:palette.red, s:palette.none)
  call forest_night#highlight('OrangeSign', s:palette.orange, s:palette.none)
  call forest_night#highlight('YellowSign', s:palette.yellow, s:palette.none)
  call forest_night#highlight('GreenSign', s:palette.green, s:palette.none)
  call forest_night#highlight('AquaSign', s:palette.aqua, s:palette.none)
  call forest_night#highlight('BlueSign', s:palette.blue, s:palette.none)
  call forest_night#highlight('PurpleSign', s:palette.purple, s:palette.none)
else
  call forest_night#highlight('RedSign', s:palette.red, s:palette.bg1)
  call forest_night#highlight('OrangeSign', s:palette.orange, s:palette.bg1)
  call forest_night#highlight('YellowSign', s:palette.yellow, s:palette.bg1)
  call forest_night#highlight('GreenSign', s:palette.green, s:palette.bg1)
  call forest_night#highlight('AquaSign', s:palette.aqua, s:palette.bg1)
  call forest_night#highlight('BlueSign', s:palette.blue, s:palette.bg1)
  call forest_night#highlight('PurpleSign', s:palette.purple, s:palette.bg1)
endif
if s:configuration.diagnostic_line_highlight
  call forest_night#highlight('ErrorLine', s:palette.none, s:palette.bg_red)
  call forest_night#highlight('WarningLine', s:palette.none, s:palette.bg_yellow)
  call forest_night#highlight('InfoLine', s:palette.none, s:palette.bg_blue)
  call forest_night#highlight('HintLine', s:palette.none, s:palette.bg_green)
else
  highlight clear ErrorLine
  highlight clear WarningLine
  highlight clear InfoLine
  highlight clear HintLine
endif
if s:configuration.current_word ==# 'grey background'
  call forest_night#highlight('CurrentWord', s:palette.none, s:palette.bg2)
else
  call forest_night#highlight('CurrentWord', s:palette.none, s:palette.none, s:configuration.current_word)
endif
" }}}
" }}}
" Terminal: {{{
if (has('termguicolors') && &termguicolors) || has('gui_running')
  " Definition
  let s:terminal = {
        \ 'black':    s:palette.bg3,
        \ 'red':      s:palette.red,
        \ 'yellow':   s:palette.yellow,
        \ 'green':    s:palette.green,
        \ 'cyan':     s:palette.aqua,
        \ 'blue':     s:palette.blue,
        \ 'purple':   s:palette.purple,
        \ 'white':    s:palette.fg
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
highlight! link TSPunctDelimiter Grey
highlight! link TSPunctBracket Fg
highlight! link TSPunctSpecial Fg
highlight! link TSConstant PurpleItalic
highlight! link TSConstBuiltin PurpleItalic
highlight! link TSConstMacro Purple
highlight! link TSString Yellow
highlight! link TSStringRegex Green
highlight! link TSStringEscape Green
highlight! link TSCharacter Yellow
highlight! link TSNumber Purple
highlight! link TSBoolean Purple
highlight! link TSFloat Purple
highlight! link TSFunction Green
highlight! link TSFuncBuiltin Green
highlight! link TSFuncMacro Green
highlight! link TSParameter Fg
highlight! link TSMethod Green
highlight! link TSField Green
highlight! link TSProperty Green
highlight! link TSConstructor Fg
highlight! link TSConditional Red
highlight! link TSRepeat Red
highlight! link TSLabel Orange
highlight! link TSOperator Orange
highlight! link TSKeyword Red
highlight! link TSException Red
highlight! link TSType Aqua
highlight! link TSTypeBuiltin BlueItalic
highlight! link TSStructure Orange
highlight! link TSInclude PurpleItalic
" }}}
" neoclide/coc.nvim {{{
call forest_night#highlight('CocHoverRange', s:palette.none, s:palette.none, 'bold,underline')
call forest_night#highlight('CocErrorHighlight', s:palette.none, s:palette.none, 'undercurl', s:palette.red)
call forest_night#highlight('CocWarningHighlight', s:palette.none, s:palette.none, 'undercurl', s:palette.yellow)
call forest_night#highlight('CocInfoHighlight', s:palette.none, s:palette.none, 'undercurl', s:palette.blue)
call forest_night#highlight('CocHintHighlight', s:palette.none, s:palette.none, 'undercurl', s:palette.aqua)
call forest_night#highlight('CocErrorFloat', s:palette.red, s:palette.bg2)
call forest_night#highlight('CocWarningFloat', s:palette.yellow, s:palette.bg2)
call forest_night#highlight('CocInfoFloat', s:palette.blue, s:palette.bg2)
call forest_night#highlight('CocHintFloat', s:palette.aqua, s:palette.bg2)
highlight! link CocHighlightText CurrentWord
highlight! link CocErrorSign RedSign
highlight! link CocWarningSign YellowSign
highlight! link CocInfoSign BlueSign
highlight! link CocHintSign AquaSign
highlight! link CocWarningVirtualText Grey
highlight! link CocErrorVirtualText Grey
highlight! link CocInfoVirtualText Grey
highlight! link CocHintVirtualText Grey
highlight! link CocErrorLine ErrorLine
highlight! link CocWarningLine WarningLine
highlight! link CocInfoLine InfoLine
highlight! link CocHintLine HintLine
highlight! link CocCodeLens Grey
highlight! link HighlightedyankRegion Visual
highlight! link CocGitAddedSign GreenSign
highlight! link CocGitChangeRemovedSign PurpleSign
highlight! link CocGitChangedSign BlueSign
highlight! link CocGitRemovedSign RedSign
highlight! link CocGitTopRemovedSign RedSign
highlight! link CocExplorerBufferRoot Orange
highlight! link CocExplorerBufferExpandIcon Aqua
highlight! link CocExplorerBufferBufnr Purple
highlight! link CocExplorerBufferModified Red
highlight! link CocExplorerBufferBufname Grey
highlight! link CocExplorerBufferFullpath Grey
highlight! link CocExplorerFileRoot Orange
highlight! link CocExplorerFileExpandIcon Aqua
highlight! link CocExplorerFileFullpath Grey
highlight! link CocExplorerFileDirectory Green
highlight! link CocExplorerFileGitStage Purple
highlight! link CocExplorerFileGitUnstage Yellow
highlight! link CocExplorerFileSize Blue
highlight! link CocExplorerTimeAccessed Aqua
highlight! link CocExplorerTimeCreated Aqua
highlight! link CocExplorerTimeModified Aqua
" }}}
" prabirshrestha/vim-lsp {{{
highlight! link LspErrorVirtual Grey
highlight! link LspWarningVirtual Grey
highlight! link LspInformationVirtual Grey
highlight! link LspHintVirtual Grey
highlight! link LspErrorHighlight CocErrorHighlight
highlight! link LspWarningHighlight CocWarningHighlight
highlight! link LspInformationHighlight CocInfoHighlight
highlight! link LspHintHighlight CocHintHighlight
highlight! link lspReference CurrentWord
" }}}
" ycm-core/YouCompleteMe {{{
highlight! link YcmErrorSign RedSign
highlight! link YcmWarningSign YellowSign
highlight! link YcmErrorLine ErrorLine
highlight! link YcmWarningLine WarningLine
highlight! link YcmErrorSection CocErrorHighlight
highlight! link YcmWarningSection CocWarningHighlight
" }}}
" dense-analysis/ale {{{
highlight! link ALEError CocErrorHighlight
highlight! link ALEWarning CocWarningHighlight
highlight! link ALEInfo CocInfoHighlight
highlight! link ALEErrorSign RedSign
highlight! link ALEWarningSign YellowSign
highlight! link ALEInfoSign BlueSign
highlight! link ALEErrorLine ErrorLine
highlight! link ALEWarningLine WarningLine
highlight! link ALEInfoLine InfoLine
highlight! link ALEVirtualTextError Grey
highlight! link ALEVirtualTextWarning Grey
highlight! link ALEVirtualTextInfo Grey
highlight! link ALEVirtualTextStyleError Grey
highlight! link ALEVirtualTextStyleWarning Grey
" }}}
" neomake/neomake {{{
highlight! link NeomakeError ALEError
highlight! link NeomakeErrorSign RedSign
highlight! link NeomakeWarning ALEWarning
highlight! link NeomakeWarningSign YellowSign
highlight! link NeomakeInfo ALEInfo
highlight! link NeomakeInfoSign BlueSign
highlight! link NeomakeMessage Aqua
highlight! link NeomakeMessageSign AquaSign
highlight! link NeomakeVirtualtextError Grey
highlight! link NeomakeVirtualtextWarning Grey
highlight! link NeomakeVirtualtextInfo Grey
highlight! link NeomakeVirtualtextMessag Grey
" }}}
" vim-syntastic/syntastic {{{
highlight! link SyntasticError ALEError
highlight! link SyntasticWarning ALEWarning
highlight! link SyntasticErrorSign RedSign
highlight! link SyntasticWarningSign YellowSign
highlight! link SyntasticErrorLine ErrorLine
highlight! link SyntasticWarningLine WarningLine
" }}}
" Yggdroot/LeaderF {{{
if !exists('g:Lf_StlColorscheme')
  let g:Lf_StlColorscheme = 'forest_night'
endif
if !exists('g:Lf_PopupColorscheme')
  let g:Lf_PopupColorscheme = 'forest_night'
endif
call forest_night#highlight('Lf_hl_match', s:palette.green, s:palette.none, 'bold')
call forest_night#highlight('Lf_hl_match0', s:palette.green, s:palette.none, 'bold')
call forest_night#highlight('Lf_hl_match1', s:palette.aqua, s:palette.none, 'bold')
call forest_night#highlight('Lf_hl_match2', s:palette.blue, s:palette.none, 'bold')
call forest_night#highlight('Lf_hl_match3', s:palette.purple, s:palette.none, 'bold')
call forest_night#highlight('Lf_hl_match4', s:palette.orange, s:palette.none, 'bold')
call forest_night#highlight('Lf_hl_matchRefine', s:palette.red, s:palette.none, 'bold')
highlight! link Lf_hl_cursorline Fg
highlight! link Lf_hl_selection DiffAdd
highlight! link Lf_hl_rgHighlight Visual
highlight! link Lf_hl_gtagsHighlight Visual
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
      \ 'prompt':  ['fg', 'Orange'],
      \ 'pointer': ['fg', 'Blue'],
      \ 'marker':  ['fg', 'Yellow'],
      \ 'spinner': ['fg', 'Yellow'],
      \ 'header':  ['fg', 'Grey']
      \ }
" }}}
" Shougo/denite.nvim {{{
call forest_night#highlight('deniteMatchedChar', s:palette.green, s:palette.none, 'bold')
call forest_night#highlight('deniteMatchedRange', s:palette.green, s:palette.none, 'bold,underline')
call forest_night#highlight('deniteInput', s:palette.green, s:palette.bg3, 'bold')
call forest_night#highlight('deniteStatusLineNumber', s:palette.purple, s:palette.bg3)
call forest_night#highlight('deniteStatusLinePath', s:palette.fg, s:palette.bg3)
highlight! link deniteSelectedLin Green
" }}}
" kien/ctrlp.vim {{{
call forest_night#highlight('CtrlPMatch', s:palette.green, s:palette.none, 'bold')
call forest_night#highlight('CtrlPPrtBase', s:palette.bg3, s:palette.none)
call forest_night#highlight('CtrlPLinePre', s:palette.bg3, s:palette.none)
call forest_night#highlight('CtrlPMode1', s:palette.blue, s:palette.bg3, 'bold')
call forest_night#highlight('CtrlPMode2', s:palette.bg0, s:palette.blue, 'bold')
call forest_night#highlight('CtrlPStats', s:palette.grey1, s:palette.bg3, 'bold')
highlight! link CtrlPNoEntries Red
highlight! link CtrlPPrtCursor Blue
" }}}
" airblade/vim-gitgutter {{{
highlight! link GitGutterAdd GreenSign
highlight! link GitGutterChange BlueSign
highlight! link GitGutterDelete RedSign
highlight! link GitGutterChangeDelete PurpleSign
" }}}
" mhinz/vim-signify {{{
highlight! link SignifySignAdd GreenSign
highlight! link SignifySignChange BlueSign
highlight! link SignifySignDelete RedSign
highlight! link SignifySignChangeDelete PurpleSign
" }}}
" andymass/vim-matchup {{{
call forest_night#highlight('MatchParenCur', s:palette.none, s:palette.none, 'bold')
call forest_night#highlight('MatchWord', s:palette.none, s:palette.none, 'underline')
call forest_night#highlight('MatchWordCur', s:palette.none, s:palette.none, 'underline')
" }}}
" easymotion/vim-easymotion {{{
highlight! link EasyMotionTarget Search
highlight! link EasyMotionShade Grey
" }}}
" justinmk/vim-sneak {{{
call forest_night#highlight('SneakLabelMask', s:palette.orange, s:palette.orange)
highlight! link Sneak Search
highlight! link SneakLabel Search
highlight! link SneakScope DiffText
" }}}
" terryma/vim-multiple-cursors {{{
highlight! link multiple_cursors_cursor Cursor
highlight! link multiple_cursors_visual Visual
" }}}
" mg979/vim-visual-multi {{{
let g:VM_Mono_hl = 'Cursor'
let g:VM_Extend_hl = 'Visual'
let g:VM_Cursor_hl = 'Cursor'
let g:VM_Insert_hl = 'Cursor'
" }}}
" dominikduda/vim_current_word {{{
highlight! link CurrentWord CurrentWord
highlight! link CurrentWordTwins CurrentWord
" }}}
" RRethy/vim-illuminate {{{
highlight! link illuminatedWord CurrentWord
" }}}
" itchyny/vim-cursorword {{{
highlight! link CursorWord0 CurrentWord
highlight! link CursorWord1 CurrentWord
" }}}
" Yggdroot/indentLine {{{
let g:indentLine_color_gui = s:palette.grey1[0]
let g:indentLine_color_term = s:palette.grey1[1]
" }}}
" nathanaelkane/vim-indent-guides {{{
if get(g:, 'indent_guides_auto_colors', 1) == 0
  call forest_night#highlight('IndentGuidesOdd', s:palette.bg0, s:palette.bg1)
  call forest_night#highlight('IndentGuidesEven', s:palette.bg0, s:palette.bg2)
endif
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
" unblevable/quick-scope {{{
call forest_night#highlight('QuickScopePrimary', s:palette.aqua, s:palette.none, 'underline')
call forest_night#highlight('QuickScopeSecondary', s:palette.blue, s:palette.none, 'underline')
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
" netrw {{{
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
" }}}
" }}}
" Extended File Types: {{{
" Note: To ensure that the `s:last_modified` variable is always up to date, you need to copy `.githooks/pre-commit` to `.git/hooks/pre-commit`.
" Generate the `after/ftplugin` directory based on the comment tags in this file.
" For example, the content between `ft_begin: sh/zsh` and `ft_end` will be placed in `after/ftplugin/sh/forest_night.vim` and `after/ftplugin/zsh/forest_night.vim`.
if forest_night#ft_exists(s:path) " If the ftplugin exists.
  if s:configuration.better_performance
    if !forest_night#ft_newest(s:path, s:last_modified) " Regenerate if it's not up to date.
      call forest_night#ft_clean(s:path, 0)
      call forest_night#ft_gen(s:path, s:last_modified, 'update')
    endif
    finish
  elseif !has('nvim') " Only clean the `after/ftplugin` directory when in vim. This code will produce a bug in neovim.
    call forest_night#ft_clean(s:path, 1)
  endif
else
  if s:configuration.better_performance
    call forest_night#ft_gen(s:path, s:last_modified, 'generate')
    finish
  endif
endif
" ft_begin: vim-plug {{{
" https://github.com/junegunn/vim-plug
call forest_night#highlight('plug1', s:palette.orange, s:palette.none, 'bold')
call forest_night#highlight('plugNumber', s:palette.yellow, s:palette.none, 'bold')
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
" ft_end }}}
" ft_begin: tagbar {{{
" https://github.com/majutsushi/tagbar
highlight! link TagbarFoldIcon Green
highlight! link TagbarSignature Green
highlight! link TagbarKind Red
highlight! link TagbarScope Orange
highlight! link TagbarNestedKind Aqua
highlight! link TagbarVisibilityPrivate Red
highlight! link TagbarVisibilityPublic Blue
" ft_end }}}
" ft_begin: vista/vista_kind/vista_markdown {{{
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
" ft_end }}}
" ft_begin: nerdtree {{{
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
" ft_end }}}
" ft_begin: dirvish {{{
" https://github.com/justinmk/vim-dirvish
highlight! link DirvishPathTail Aqua
highlight! link DirvishArg Yellow
" ft_end }}}
" ft_begin: startify/quickmenu {{{
" https://github.com/mhinz/vim-startify
" https://github.com/skywind3000/quickmenu.vim
highlight! link StartifyBracket Grey
highlight! link StartifyFile Fg
highlight! link StartifyNumber Red
highlight! link StartifyPath Green
highlight! link StartifySlash Green
highlight! link StartifySection Blue
highlight! link StartifyHeader Orange
highlight! link StartifySpecial Grey
highlight! link StartifyFooter Grey
" ft_end }}}
" ft_begin: quickmenu {{{
" https://github.com/skywind3000/quickmenu.vim
highlight! link QuickmenuOption Green
highlight! link QuickmenuNumber Red
highlight! link QuickmenuBracket Grey
highlight! link QuickmenuHelp Green
highlight! link QuickmenuSpecial Purple
highlight! link QuickmenuHeader Orange
" ft_end }}}
" ft_begin: undotree {{{
" https://github.com/mbbill/undotree
call forest_night#highlight('UndotreeSavedBig', s:palette.purple, s:palette.none, 'bold')
highlight! link UndotreeNode Orange
highlight! link UndotreeNodeCurrent Red
highlight! link UndotreeSeq Green
highlight! link UndotreeNext Blue
highlight! link UndotreeTimeStamp Grey
highlight! link UndotreeHead Yellow
highlight! link UndotreeBranch Yellow
highlight! link UndotreeCurrent Aqua
highlight! link UndotreeSavedSmall Purple
" ft_end }}}
" ft_begin: markdown {{{
" builtin: {{{
call forest_night#highlight('markdownH1', s:palette.red, s:palette.none, 'bold')
call forest_night#highlight('markdownH2', s:palette.orange, s:palette.none, 'bold')
call forest_night#highlight('markdownH3', s:palette.yellow, s:palette.none, 'bold')
call forest_night#highlight('markdownH4', s:palette.green, s:palette.none, 'bold')
call forest_night#highlight('markdownH5', s:palette.blue, s:palette.none, 'bold')
call forest_night#highlight('markdownH6', s:palette.purple, s:palette.none, 'bold')
call forest_night#highlight('markdownUrl', s:palette.blue, s:palette.none, 'underline')
call forest_night#highlight('markdownItalic', s:palette.none, s:palette.none, 'italic')
call forest_night#highlight('markdownBold', s:palette.none, s:palette.none, 'bold')
call forest_night#highlight('markdownItalicDelimiter', s:palette.grey1, s:palette.none, 'italic')
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
call forest_night#highlight('mkdURL', s:palette.blue, s:palette.none, 'underline')
call forest_night#highlight('mkdInlineURL', s:palette.purple, s:palette.none, 'underline')
call forest_night#highlight('mkdItalic', s:palette.grey1, s:palette.none, 'italic')
highlight! link mkdCodeDelimiter Aqua
highlight! link mkdBold Grey
highlight! link mkdLink Purple
highlight! link mkdHeading Grey
highlight! link mkdListItem Red
highlight! link mkdRule Purple
highlight! link mkdDelimiter Grey
highlight! link mkdId Yellow
" }}}
" ft_end }}}
" ft_begin: rst {{{
" builtin: https://github.com/marshallward/vim-restructuredtext {{{
call forest_night#highlight('rstStandaloneHyperlink', s:palette.purple, s:palette.none, 'underline')
highlight! link rstSubstitutionReference Blue
highlight! link rstInterpretedTextOrHyperlinkReference Aqua
highlight! link rstTableLines Grey
" }}}
" ft_end }}}
" ft_begin: tex {{{
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
" ft_end }}}
" ft_begin: html/markdown/javascriptreact/typescriptreact {{{
" builtin: https://notabug.org/jorgesumle/vim-html-syntax {{{
call forest_night#highlight('htmlH1', s:palette.red, s:palette.none, 'bold')
call forest_night#highlight('htmlH2', s:palette.orange, s:palette.none, 'bold')
call forest_night#highlight('htmlH3', s:palette.yellow, s:palette.none, 'bold')
call forest_night#highlight('htmlH4', s:palette.green, s:palette.none, 'bold')
call forest_night#highlight('htmlH5', s:palette.blue, s:palette.none, 'bold')
call forest_night#highlight('htmlH6', s:palette.purple, s:palette.none, 'bold')
call forest_night#highlight('htmlLink', s:palette.none, s:palette.none, 'underline')
call forest_night#highlight('htmlBold', s:palette.none, s:palette.none, 'bold')
call forest_night#highlight('htmlBoldUnderline', s:palette.none, s:palette.none, 'bold,underline')
call forest_night#highlight('htmlBoldItalic', s:palette.none, s:palette.none, 'bold,italic')
call forest_night#highlight('htmlBoldUnderlineItalic', s:palette.none, s:palette.none, 'bold,underline,italic')
call forest_night#highlight('htmlUnderline', s:palette.none, s:palette.none, 'underline')
call forest_night#highlight('htmlUnderlineItalic', s:palette.none, s:palette.none, 'underline,italic')
call forest_night#highlight('htmlItalic', s:palette.none, s:palette.none, 'italic')
highlight! link htmlTag Green
highlight! link htmlEndTag Blue
highlight! link htmlTagN OrangeItalic
highlight! link htmlTagName OrangeItalic
highlight! link htmlArg Aqua
highlight! link htmlScriptTag Purple
highlight! link htmlSpecialTagName RedItalic
" }}}
" ft_end }}}
" ft_begin: xml {{{
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
" ft_end }}}
" ft_begin: css/scss/sass/less {{{
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
" ft_end }}}
" ft_begin: scss {{{
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
" ft_end }}}
" ft_begin: sass {{{
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
" ft_end }}}
" ft_begin: less {{{
" vim-less: https://github.com/groenewege/vim-less {{{
highlight! link lessMixinChar Grey
highlight! link lessClass RedItalic
highlight! link lessVariable Blue
highlight! link lessAmpersandChar Orange
highlight! link lessFunction Yellow
" }}}
" ft_end }}}
" ft_begin: javascript/javascriptreact {{{
" builtin: http://www.fleiner.com/vim/syntax/javascript.vim {{{
highlight! link javaScriptNull Aqua
highlight! link javaScriptIdentifier Orange
highlight! link javaScriptParens Fg
highlight! link javaScriptBraces Fg
highlight! link javaScriptGlobal Purple
highlight! link javaScriptMessage Yellow
highlight! link javaScriptFunction RedItalic
highlight! link javaScriptOperator Orange
highlight! link javaScriptMember Aqua
" }}}
" vim-javascript: https://github.com/pangloss/vim-javascript {{{
highlight! link jsThis Purple
highlight! link jsUndefined Aqua
highlight! link jsNull Aqua
highlight! link jsNan Aqua
highlight! link jsSuper Purple
highlight! link jsPrototype Purple
highlight! link jsFunction RedItalic
highlight! link jsGlobalNodeObjects PurpleItalic
highlight! link jsGlobalObjects Yellow
highlight! link jsArrowFunction Purple
highlight! link jsArrowFuncArgs Blue
highlight! link jsFuncArgs Blue
highlight! link jsObjectProp Aqua
highlight! link jsVariableDef Blue
highlight! link jsObjectKey Aqua
highlight! link jsParen Blue
highlight! link jsParenIfElse Blue
highlight! link jsParenRepeat Blue
highlight! link jsParenSwitch Blue
highlight! link jsParenCatch Blue
highlight! link jsBracket Blue
highlight! link jsBlockLabel Aqua
highlight! link jsFunctionKey Green
highlight! link jsClassDefinition Yellow
highlight! link jsDot Grey
highlight! link jsDestructuringBlock Blue
highlight! link jsSpreadExpression Purple
highlight! link jsSpreadOperator Green
highlight! link jsModuleKeyword Yellow
highlight! link jsObjectValue Blue
highlight! link jsTemplateExpression Yellow
highlight! link jsTemplateBraces Yellow
highlight! link jsClassMethodType Orange
" }}}
" yajs: https://github.com/othree/yajs.vim {{{
highlight! link javascriptEndColons Fg
highlight! link javascriptOpSymbol Orange
highlight! link javascriptOpSymbols Orange
highlight! link javascriptIdentifierName Blue
highlight! link javascriptVariable Orange
highlight! link javascriptObjectLabel Aqua
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
" ft_end }}}
" ft_begin: typescript/typescriptreact {{{
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
" ft_end }}}
" ft_begin: dart {{{
" dart-lang: https://github.com/dart-lang/dart-vim-plugin {{{
highlight! link dartCoreClasses Aqua
highlight! link dartTypeName Aqua
highlight! link dartInterpolation Blue
highlight! link dartTypeDef RedItalic
highlight! link dartClassDecl RedItalic
highlight! link dartLibrary PurpleItalic
highlight! link dartMetadata Blue
" }}}
" ft_end }}}
" ft_begin: coffee {{{
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
" ft_end }}}
" ft_begin: purescript {{{
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
" ft_end }}}
" ft_begin: c/cpp/objc/objcpp {{{
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
highlight! link Member Aqua
highlight! link Variable Blue
highlight! link Namespace Purple
highlight! link EnumConstant Aqua
highlight! link chromaticaException RedItalic
highlight! link chromaticaCast Orange
highlight! link OperatorOverload Orange
highlight! link AccessQual Orange
highlight! link Linkage Orange
highlight! link AutoType Yellow
" }}}
" vim-lsp-cxx-highlight https://github.com/jackguo380/vim-lsp-cxx-highlight {{{
highlight! link LspCxxHlSkippedRegion Grey
highlight! link LspCxxHlSkippedRegionBeginEnd PurpleItalic
highlight! link LspCxxHlGroupEnumConstant Aqua
highlight! link LspCxxHlGroupNamespace Purple
highlight! link LspCxxHlGroupMemberVariable Aqua
" }}}
" ft_end }}}
" ft_begin: objc {{{
" builtin: {{{
highlight! link objcModuleImport PurpleItalic
highlight! link objcException RedItalic
highlight! link objcProtocolList Aqua
highlight! link objcObjDef PurpleItalic
highlight! link objcDirective RedItalic
highlight! link objcPropertyAttribute Orange
highlight! link objcHiddenArgument Aqua
" }}}
" ft_end }}}
" ft_begin: cs {{{
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
" ft_end }}}
" ft_begin: python {{{
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
call forest_night#highlight('semshiUnresolved', s:palette.yellow, s:palette.none, 'undercurl')
highlight! link semshiImported Purple
highlight! link semshiParameter Blue
highlight! link semshiParameterUnused Grey
highlight! link semshiSelf PurpleItalic
highlight! link semshiGlobal Yellow
highlight! link semshiBuiltin Yellow
highlight! link semshiAttribute Aqua
highlight! link semshiLocal Red
highlight! link semshiFree Red
highlight! link semshiSelected CurrentWord
highlight! link semshiErrorSign RedSign
highlight! link semshiErrorChar RedSign
" }}}
" ft_end }}}
" ft_begin: lua {{{
" builtin: {{{
highlight! link luaFunc Green
highlight! link luaFunction Aqua
highlight! link luaTable Fg
highlight! link luaIn RedItalic
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
" ft_end }}}
" ft_begin: moon {{{
" moonscript-vim: https://github.com/leafo/moonscript-vim {{{
highlight! link moonInterpDelim Yellow
highlight! link moonInterp Blue
highlight! link moonFunction Green
highlight! link moonLuaFunc Aqua
highlight! link moonSpecialVar Purple
highlight! link moonObject Yellow
highlight! link moonDotAccess Grey
" }}}
" ft_end }}}
" ft_begin: java {{{
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
" ft_end }}}
" ft_begin: kotlin {{{
" kotlin-vim: https://github.com/udalov/kotlin-vim {{{
highlight! link ktSimpleInterpolation Yellow
highlight! link ktComplexInterpolation Yellow
highlight! link ktComplexInterpolationBrace Yellow
highlight! link ktStructure RedItalic
highlight! link ktKeyword Aqua
" }}}
" ft_end }}}
" ft_begin: scala {{{
" builtin: https://github.com/derekwyatt/vim-scala {{{
highlight! link scalaNameDefinition Aqua
highlight! link scalaInterpolationBoundary Yellow
highlight! link scalaInterpolation Blue
highlight! link scalaTypeOperator Orange
highlight! link scalaOperator Orange
highlight! link scalaKeywordModifier Orange
" }}}
" ft_end }}}
" ft_begin: go {{{
" builtin: https://github.com/google/vim-ft-go {{{
highlight! link goDirective PurpleItalic
highlight! link goConstants Aqua
highlight! link goDeclType OrangeItalic
" }}}
" polyglot: {{{
highlight! link goPackage PurpleItalic
highlight! link goImport PurpleItalic
highlight! link goVarArgs Blue
highlight! link goBuiltins Green
highlight! link goPredefinedIdentifiers Aqua
highlight! link goVar Orange
" }}}
" ft_end }}}
" ft_begin: rust {{{
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
" ft_end }}}
" ft_begin: swift {{{
" swift.vim: https://github.com/keith/swift.vim {{{
highlight! link swiftInterpolatedWrapper Yellow
highlight! link swiftInterpolatedString Blue
highlight! link swiftProperty Aqua
highlight! link swiftTypeDeclaration Orange
highlight! link swiftClosureArgument Purple
" }}}
" ft_end }}}
" ft_begin: php {{{
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
" ft_end }}}
" ft_begin: ruby {{{
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
" ft_end }}}
" ft_begin: haskell {{{
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
" ft_end }}}
" ft_begin: perl/pod {{{
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
" ft_end }}}
" ft_begin: ocaml {{{
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
" ft_end }}}
" ft_begin: erlang {{{
" builtin: https://github.com/vim-erlang/vim-erlang-runtime {{{
highlight! link erlangAtom Aqua
highlight! link erlangLocalFuncRef Green
highlight! link erlangLocalFuncCall Green
highlight! link erlangGlobalFuncRef Green
highlight! link erlangGlobalFuncCall Green
highlight! link erlangAttribute PurpleItalic
highlight! link erlangPipe Orange
" }}}
" ft_end }}}
" ft_begin: elixir {{{
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
" ft_end }}}
" ft_begin: lisp {{{
" builtin: http://www.drchip.org/astronaut/vim/index.html#SYNTAX_LISP {{{
highlight! link lispAtomMark Green
highlight! link lispKey Aqua
highlight! link lispFunc OrangeItalic
" }}}
" ft_end }}}
" ft_begin: clojure {{{
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
" ft_end }}}
" ft_begin: matlab {{{
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
" ft_end }}}
" ft_begin: sh/zsh {{{
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
" ft_end }}}
" ft_begin: zsh {{{
" builtin: https://github.com/chrisbra/vim-zsh {{{
highlight! link zshOptStart PurpleItalic
highlight! link zshOption Blue
highlight! link zshSubst Yellow
highlight! link zshFunction Green
highlight! link zshDeref Blue
highlight! link zshTypes Orange
highlight! link zshVariableDef Blue
" }}}
" ft_end }}}
" ft_begin: fish {{{
" vim-fish: https://github.com/georgewitteman/vim-fish {{{
highlight! link fishStatement Orange
highlight! link fishLabel RedItalic
highlight! link fishCommandSub Yellow
" }}}
" ft_end }}}
" ft_begin: ps1 {{{
" vim-ps1: https://github.com/PProvost/vim-ps1 {{{
highlight! link ps1FunctionInvocation Aqua
highlight! link ps1FunctionDeclaration Aqua
highlight! link ps1InterpolationDelimiter Yellow
highlight! link ps1BuiltIn Yellow
" }}}
" ft_end }}}
" ft_begin: vim {{{
call forest_night#highlight('vimCommentTitle', s:palette.grey1, s:palette.none, 'bold')
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
" ft_end }}}
" ft_begin: make {{{
highlight! link makeIdent Aqua
highlight! link makeSpecTarget Yellow
highlight! link makeTarget Blue
highlight! link makeCommands Orange
" ft_end }}}
" ft_begin: cmake {{{
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
" ft_end }}}
" ft_begin: json {{{
highlight! link jsonKeyword Orange
highlight! link jsonQuote Grey
highlight! link jsonBraces Fg
" ft_end }}}
" ft_begin: yaml {{{
highlight! link yamlKey Orange
highlight! link yamlConstant Purple
" ft_end }}}
" ft_begin: toml {{{
call forest_night#highlight('tomlTable', s:palette.purple, s:palette.none, 'bold')
highlight! link tomlKey Orange
highlight! link tomlBoolean Aqua
highlight! link tomlTableArray tomlTable
" ft_end }}}
" ft_begin: diff/git {{{
highlight! link diffAdded Green
highlight! link diffRemoved Red
highlight! link diffChanged Blue
highlight! link diffOldFile Yellow
highlight! link diffNewFile Orange
highlight! link diffFile Aqua
highlight! link diffLine Grey
highlight! link diffIndexLine Purple
" ft_end }}}
" ft_begin: gitcommit {{{
highlight! link gitcommitSummary Red
highlight! link gitcommitUntracked Grey
highlight! link gitcommitDiscarded Grey
highlight! link gitcommitSelected Grey
highlight! link gitcommitUnmerged Grey
highlight! link gitcommitOnBranch Grey
highlight! link gitcommitArrow Grey
highlight! link gitcommitFile Green
" ft_end }}}
" ft_begin: dosini {{{
call forest_night#highlight('dosiniHeader', s:palette.red, s:palette.none, 'bold')
highlight! link dosiniLabel Yellow
highlight! link dosiniValue Green
highlight! link dosiniNumber Green
" ft_end }}}
" ft_begin: help {{{
call forest_night#highlight('helpNote', s:palette.purple, s:palette.none, 'bold')
call forest_night#highlight('helpHeadline', s:palette.red, s:palette.none, 'bold')
call forest_night#highlight('helpHeader', s:palette.orange, s:palette.none, 'bold')
call forest_night#highlight('helpURL', s:palette.green, s:palette.none, 'underline')
call forest_night#highlight('helpHyperTextEntry', s:palette.yellow, s:palette.none, 'bold')
highlight! link helpHyperTextJump Yellow
highlight! link helpCommand Aqua
highlight! link helpExample Green
highlight! link helpSpecial Blue
highlight! link helpSectionDelim Grey
" ft_end }}}
" }}}

" vim: set sw=2 ts=2 sts=2 et tw=80 ft=vim fdm=marker fmr={{{,}}}:
