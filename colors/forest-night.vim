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
set background=dark

let s:t_Co = exists('&t_Co') && !empty(&t_Co) && &t_Co > 1 ? &t_Co : 2

let g:colors_name = 'forest-night'
" }}}
" Configuration: {{{
let s:configuration = {}
let s:configuration.palette = get(g:, 'forest_night_palette', 'soft')
let s:configuration.transparent_background = get(g:, 'forest_night_transparent_background', 0)
let s:configuration.disable_italic_comment = get(g:, 'forest_night_disable_italic_comment', 0)
let s:configuration.enable_italic = get(g:, 'forest_night_enable_italic', 0)
let s:configuration.cursor = get(g:, 'forest_night_cursor', 'auto')
let s:configuration.current_word = get(g:, 'forest_night_current_word', get(g:, 'forest_night_transparent_background', 0) == 0 ? 'grey background' : 'bold')
" }}}
" Palette: {{{
let s:palette = {
      \ 'bg0':        ['#323d43',   '235',  'Black'],
      \ 'bg1':        ['#3c474d',   '236',  'DarkGrey'],
      \ 'bg2':        ['#465258',   '237',  'DarkGrey'],
      \ 'bg3':        ['#505a60',   '238',  'DarkGrey'],
      \ 'bg4':        ['#576268',   '239',  'Grey'],
      \ 'bg_red':     ['#392f32',   '52',   'DarkRed'],
      \ 'bg_green':   ['#333b2f',   '22',   'DarkGreen'],
      \ 'bg_blue':    ['#203a41',   '17',   'DarkBlue'],
      \ 'fg':         ['#d8caac',   '223',  'White'],
      \ 'red':        ['#e68183',   '167',  'Red'],
      \ 'orange':     ['#e39b7b',   '208',  'Red'],
      \ 'yellow':     ['#d9bb80',   '214',  'Yellow'],
      \ 'green':      ['#a7c080',   '142',  'Green'],
      \ 'cyan':       ['#87c095',   '108',   'Cyan'],
      \ 'blue':       ['#89beba',   '109',  'Blue'],
      \ 'purple':     ['#d3a0bc',   '175',  'Magenta'],
      \ 'grey':       ['#868d80',   '245',  'LightGrey'],
      \ 'none':       ['NONE',      'NONE', 'NONE']
      \ }
" }}}
" Function: {{{
" call s:HL(group, foreground, background)
" call s:HL(group, foreground, background, gui, guisp)
"
" E.g.:
" call s:HL('Normal', s:palette.fg, s:palette.bg0)

if (has('termguicolors') && &termguicolors) || has('gui_running')  " guifg guibg gui cterm guisp
  function! s:HL(group, fg, bg, ...)
    let hl_string = [
          \ 'highlight', a:group,
          \ 'guifg=' . a:fg[0],
          \ 'guibg=' . a:bg[0],
          \ ]
    if a:0 >= 1
      if a:1 ==# 'undercurl'
        call add(hl_string, 'gui=undercurl')
        call add(hl_string, 'cterm=underline')
      else
        call add(hl_string, 'gui=' . a:1)
        call add(hl_string, 'cterm=' . a:1)
      endif
    else
      call add(hl_string, 'gui=NONE')
      call add(hl_string, 'cterm=NONE')
    endif
    if a:0 >= 2
      call add(hl_string, 'guisp=' . a:2[0])
    endif
    execute join(hl_string, ' ')
  endfunction
elseif s:t_Co >= 256  " ctermfg ctermbg cterm
  function! s:HL(group, fg, bg, ...)
    let hl_string = [
          \ 'highlight', a:group,
          \ 'ctermfg=' . a:fg[1],
          \ 'ctermbg=' . a:bg[1],
          \ ]
    if a:0 >= 1
      if a:1 ==# 'undercurl'
        call add(hl_string, 'cterm=underline')
      else
        call add(hl_string, 'cterm=' . a:1)
      endif
    else
      call add(hl_string, 'cterm=NONE')
    endif
    execute join(hl_string, ' ')
  endfunction
else  " ctermfg ctermbg cterm
  function! s:HL(group, fg, bg, ...)
    let hl_string = [
          \ 'highlight', a:group,
          \ 'ctermfg=' . a:fg[2],
          \ 'ctermbg=' . a:bg[2],
          \ ]
    if a:0 >= 1
      if a:1 ==# 'undercurl'
        call add(hl_string, 'cterm=underline')
      else
        call add(hl_string, 'cterm=' . a:1)
      endif
    else
      call add(hl_string, 'cterm=NONE')
    endif
    execute join(hl_string, ' ')
  endfunction
endif
" }}}

" Common Highlight Groups: {{{
" UI: {{{
if s:configuration.transparent_background
  call s:HL('Normal', s:palette.fg, s:palette.none)
  call s:HL('Terminal', s:palette.fg, s:palette.none)
  call s:HL('EndOfBuffer', s:palette.bg0, s:palette.none)
  call s:HL('FoldColumn', s:palette.grey, s:palette.none)
  call s:HL('Folded', s:palette.grey, s:palette.none)
  call s:HL('SignColumn', s:palette.fg, s:palette.none)
else
  call s:HL('Normal', s:palette.fg, s:palette.bg0)
  call s:HL('Terminal', s:palette.fg, s:palette.bg0)
  call s:HL('EndOfBuffer', s:palette.bg0, s:palette.bg0)
  call s:HL('FoldColumn', s:palette.grey, s:palette.bg1)
  call s:HL('Folded', s:palette.grey, s:palette.bg1)
  call s:HL('SignColumn', s:palette.fg, s:palette.bg1)
endif
call s:HL('ColorColumn', s:palette.none, s:palette.bg1)
call s:HL('Conceal', s:palette.grey, s:palette.none)
if s:configuration.cursor ==# 'auto'
  call s:HL('Cursor', s:palette.none, s:palette.none, 'reverse')
  call s:HL('lCursor', s:palette.none, s:palette.none, 'reverse')
elseif s:configuration.cursor ==# 'red'
  call s:HL('Cursor', s:palette.bg0, s:palette.red)
  call s:HL('lCursor', s:palette.bg0, s:palette.red)
elseif s:configuration.cursor ==# 'green'
  call s:HL('Cursor', s:palette.bg0, s:palette.green)
  call s:HL('lCursor', s:palette.bg0, s:palette.green)
elseif s:configuration.cursor ==# 'blue'
  call s:HL('Cursor', s:palette.bg0, s:palette.blue)
  call s:HL('lCursor', s:palette.bg0, s:palette.blue)
elseif s:configuration.cursor ==# 'purple'
  call s:HL('Cursor', s:palette.bg0, s:palette.purple)
  call s:HL('lCursor', s:palette.bg0, s:palette.purple)
endif
call s:HL('CursorColumn', s:palette.none, s:palette.bg1)
call s:HL('CursorLine', s:palette.none, s:palette.bg1)
call s:HL('LineNr', s:palette.grey, s:palette.none)
if &relativenumber == 1 && &cursorline == 0
  call s:HL('CursorLineNr', s:palette.fg, s:palette.none)
else
  call s:HL('CursorLineNr', s:palette.fg, s:palette.bg1)
endif
call s:HL('DiffAdd', s:palette.none, s:palette.bg_green)
call s:HL('DiffChange', s:palette.none, s:palette.bg_blue)
call s:HL('DiffDelete', s:palette.none, s:palette.bg_red)
call s:HL('DiffText', s:palette.none, s:palette.bg0, 'reverse')
call s:HL('Directory', s:palette.green, s:palette.none)
call s:HL('ErrorMsg', s:palette.red, s:palette.none, 'bold,underline')
call s:HL('WarningMsg', s:palette.yellow, s:palette.none, 'bold')
call s:HL('ModeMsg', s:palette.fg, s:palette.none, 'bold')
call s:HL('MoreMsg', s:palette.blue, s:palette.none, 'bold')
call s:HL('IncSearch', s:palette.none, s:palette.none, 'reverse')
call s:HL('Search', s:palette.none, s:palette.bg3)
call s:HL('MatchParen', s:palette.none, s:palette.bg4)
call s:HL('NonText', s:palette.grey, s:palette.none)
call s:HL('Pmenu', s:palette.fg, s:palette.bg2)
call s:HL('PmenuSbar', s:palette.none, s:palette.bg2)
call s:HL('PmenuThumb', s:palette.none, s:palette.grey)
call s:HL('PmenuSel', s:palette.bg0, s:palette.fg)
call s:HL('WildMenu', s:palette.bg0, s:palette.fg)
call s:HL('Question', s:palette.yellow, s:palette.none)
call s:HL('SpellBad', s:palette.red, s:palette.none, 'undercurl', s:palette.red)
call s:HL('SpellCap', s:palette.yellow, s:palette.none, 'undercurl', s:palette.yellow)
call s:HL('SpellLocal', s:palette.blue, s:palette.none, 'undercurl', s:palette.blue)
call s:HL('SpellRare', s:palette.purple, s:palette.none, 'undercurl', s:palette.purple)
call s:HL('StatusLine', s:palette.fg, s:palette.bg3)
call s:HL('StatusLineTerm', s:palette.fg, s:palette.bg3)
call s:HL('StatusLineNC', s:palette.grey, s:palette.bg1)
call s:HL('StatusLineTermNC', s:palette.grey, s:palette.bg1)
call s:HL('TabLine', s:palette.fg, s:palette.bg4)
call s:HL('TabLineFill', s:palette.grey, s:palette.bg1)
call s:HL('TabLineSel', s:palette.bg0, s:palette.green)
call s:HL('VertSplit', s:palette.bg4, s:palette.none)
call s:HL('Visual', s:palette.none, s:palette.bg3)
call s:HL('VisualNOS', s:palette.none, s:palette.bg3, 'underline')
call s:HL('CursorIM', s:palette.none, s:palette.fg)
call s:HL('ToolbarLine', s:palette.none, s:palette.grey)
call s:HL('ToolbarButton', s:palette.fg, s:palette.bg0, 'bold')
call s:HL('QuickFixLine', s:palette.blue, s:palette.bg1)
call s:HL('Debug', s:palette.yellow, s:palette.none)
" }}}
" Syntax: {{{
call s:HL('Boolean', s:palette.purple, s:palette.none)
call s:HL('Number', s:palette.purple, s:palette.none)
call s:HL('Float', s:palette.purple, s:palette.none)
if s:configuration.enable_italic
  call s:HL('PreProc', s:palette.purple, s:palette.none, 'italic')
  call s:HL('PreCondit', s:palette.purple, s:palette.none, 'italic')
  call s:HL('Include', s:palette.purple, s:palette.none, 'italic')
  call s:HL('Define', s:palette.purple, s:palette.none, 'italic')
  call s:HL('Conditional', s:palette.red, s:palette.none, 'italic')
  call s:HL('Repeat', s:palette.red, s:palette.none, 'italic')
  call s:HL('Keyword', s:palette.red, s:palette.none, 'italic')
  call s:HL('Typedef', s:palette.red, s:palette.none, 'italic')
  call s:HL('Exception', s:palette.red, s:palette.none, 'italic')
  call s:HL('Statement', s:palette.red, s:palette.none, 'italic')
else
  call s:HL('PreProc', s:palette.purple, s:palette.none)
  call s:HL('PreCondit', s:palette.purple, s:palette.none)
  call s:HL('Include', s:palette.purple, s:palette.none)
  call s:HL('Define', s:palette.purple, s:palette.none)
  call s:HL('Conditional', s:palette.red, s:palette.none)
  call s:HL('Repeat', s:palette.red, s:palette.none)
  call s:HL('Keyword', s:palette.red, s:palette.none)
  call s:HL('Typedef', s:palette.red, s:palette.none)
  call s:HL('Exception', s:palette.red, s:palette.none)
  call s:HL('Statement', s:palette.red, s:palette.none)
endif
call s:HL('Error', s:palette.red, s:palette.none)
call s:HL('StorageClass', s:palette.orange, s:palette.none)
call s:HL('Tag', s:palette.orange, s:palette.none)
call s:HL('Label', s:palette.orange, s:palette.none)
call s:HL('Structure', s:palette.orange, s:palette.none)
call s:HL('Operator', s:palette.orange, s:palette.none)
call s:HL('Title', s:palette.orange, s:palette.none, 'bold')
call s:HL('Special', s:palette.yellow, s:palette.none)
call s:HL('SpecialChar', s:palette.yellow, s:palette.none)
call s:HL('Type', s:palette.yellow, s:palette.none)
call s:HL('Function', s:palette.green, s:palette.none)
call s:HL('String', s:palette.green, s:palette.none)
call s:HL('Character', s:palette.green, s:palette.none)
call s:HL('Constant', s:palette.cyan, s:palette.none)
call s:HL('Macro', s:palette.cyan, s:palette.none)
call s:HL('Identifier', s:palette.blue, s:palette.none)
call s:HL('SpecialKey', s:palette.blue, s:palette.none)
if s:configuration.disable_italic_comment
  call s:HL('Comment', s:palette.grey, s:palette.none)
  call s:HL('SpecialComment', s:palette.grey, s:palette.none)
  call s:HL('Todo', s:palette.purple, s:palette.none)
else
  call s:HL('Comment', s:palette.grey, s:palette.none, 'italic')
  call s:HL('SpecialComment', s:palette.grey, s:palette.none, 'italic')
  call s:HL('Todo', s:palette.purple, s:palette.none, 'italic')
endif
call s:HL('Delimiter', s:palette.fg, s:palette.none)
call s:HL('Ignore', s:palette.grey, s:palette.none)
call s:HL('Underlined', s:palette.none, s:palette.none, 'underline')
" }}}
" Predefined Highlight Groups: {{{
call s:HL('Fg', s:palette.fg, s:palette.none)
call s:HL('Grey', s:palette.grey, s:palette.none)
call s:HL('Yellow', s:palette.yellow, s:palette.none)
call s:HL('Blue', s:palette.blue, s:palette.none)
if s:configuration.enable_italic
  call s:HL('RedItalic', s:palette.red, s:palette.none, 'italic')
  call s:HL('OrangeItalic', s:palette.orange, s:palette.none, 'italic')
  call s:HL('PurpleItalic', s:palette.purple, s:palette.none, 'italic')
else
  call s:HL('RedItalic', s:palette.red, s:palette.none)
  call s:HL('OrangeItalic', s:palette.orange, s:palette.none)
  call s:HL('PurpleItalic', s:palette.purple, s:palette.none)
endif
call s:HL('Red', s:palette.red, s:palette.none)
call s:HL('Orange', s:palette.orange, s:palette.none)
call s:HL('Purple', s:palette.purple, s:palette.none)
call s:HL('Green', s:palette.green, s:palette.none)
call s:HL('Cyan', s:palette.cyan, s:palette.none)
if s:configuration.transparent_background
  call s:HL('RedSign', s:palette.red, s:palette.none)
  call s:HL('OrangeSign', s:palette.orange, s:palette.none)
  call s:HL('YellowSign', s:palette.yellow, s:palette.none)
  call s:HL('GreenSign', s:palette.green, s:palette.none)
  call s:HL('CyanSign', s:palette.cyan, s:palette.none)
  call s:HL('BlueSign', s:palette.blue, s:palette.none)
  call s:HL('PurpleSign', s:palette.purple, s:palette.none)
else
  call s:HL('RedSign', s:palette.red, s:palette.bg1)
  call s:HL('OrangeSign', s:palette.orange, s:palette.bg1)
  call s:HL('YellowSign', s:palette.yellow, s:palette.bg1)
  call s:HL('GreenSign', s:palette.green, s:palette.bg1)
  call s:HL('CyanSign', s:palette.cyan, s:palette.bg1)
  call s:HL('BlueSign', s:palette.blue, s:palette.bg1)
  call s:HL('PurpleSign', s:palette.purple, s:palette.bg1)
endif
" }}}
" }}}
" Extended File Types: {{{
" Markdown: {{{
" builtin: {{{
call s:HL('markdownH1', s:palette.red, s:palette.none, 'bold')
call s:HL('markdownH2', s:palette.orange, s:palette.none, 'bold')
call s:HL('markdownH3', s:palette.yellow, s:palette.none, 'bold')
call s:HL('markdownH4', s:palette.green, s:palette.none, 'bold')
call s:HL('markdownH5', s:palette.blue, s:palette.none, 'bold')
call s:HL('markdownH6', s:palette.purple, s:palette.none, 'bold')
call s:HL('markdownUrl', s:palette.blue, s:palette.none, 'underline')
call s:HL('markdownItalic', s:palette.none, s:palette.none, 'italic')
call s:HL('markdownBold', s:palette.none, s:palette.none, 'bold')
call s:HL('markdownItalicDelimiter', s:palette.grey, s:palette.none, 'italic')
highlight! link markdownCode Green
highlight! link markdownCodeBlock Cyan
highlight! link markdownCodeDelimiter Cyan
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
" vim-markdown: https://github.com/gabrielelana/vim-markdown{{{
call s:HL('mkdURL', s:palette.blue, s:palette.none, 'underline')
call s:HL('mkdInlineURL', s:palette.purple, s:palette.none, 'underline')
call s:HL('mkdItalic', s:palette.grey, s:palette.none, 'italic')
highlight! link mkdCodeDelimiter Cyan
highlight! link mkdBold Grey
highlight! link mkdLink Purple
highlight! link mkdHeading Grey
highlight! link mkdListItem Red
highlight! link mkdRule Purple
highlight! link mkdDelimiter Grey
highlight! link mkdId Yellow
" }}}
" }}}
" ReStructuredText: {{{
" builtin: https://github.com/marshallward/vim-restructuredtext{{{
call s:HL('rstStandaloneHyperlink', s:palette.purple, s:palette.none, 'underline')
highlight! link rstSubstitutionReference Blue
highlight! link rstInterpretedTextOrHyperlinkReference Cyan
highlight! link rstTableLines Grey
" }}}
" }}}
" LaTex: {{{
" builtin: http://www.drchip.org/astronaut/vim/index.html#SYNTAX_TEX{{{
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
" }}}
" Html: {{{
" builtin: https://notabug.org/jorgesumle/vim-html-syntax{{{
call s:HL('htmlH1', s:palette.red, s:palette.none, 'bold')
call s:HL('htmlH2', s:palette.orange, s:palette.none, 'bold')
call s:HL('htmlH3', s:palette.yellow, s:palette.none, 'bold')
call s:HL('htmlH4', s:palette.green, s:palette.none, 'bold')
call s:HL('htmlH5', s:palette.blue, s:palette.none, 'bold')
call s:HL('htmlH6', s:palette.purple, s:palette.none, 'bold')
call s:HL('htmlLink', s:palette.none, s:palette.none, 'underline')
call s:HL('htmlBold', s:palette.none, s:palette.none, 'bold')
call s:HL('htmlBoldUnderline', s:palette.none, s:palette.none, 'bold,underline')
call s:HL('htmlBoldItalic', s:palette.none, s:palette.none, 'bold,italic')
call s:HL('htmlBoldUnderlineItalic', s:palette.none, s:palette.none, 'bold,underline,italic')
call s:HL('htmlUnderline', s:palette.none, s:palette.none, 'underline')
call s:HL('htmlUnderlineItalic', s:palette.none, s:palette.none, 'underline,italic')
call s:HL('htmlItalic', s:palette.none, s:palette.none, 'italic')
highlight! link htmlTag Green
highlight! link htmlEndTag Blue
highlight! link htmlTagN OrangeItalic
highlight! link htmlTagName OrangeItalic
highlight! link htmlArg Cyan
highlight! link htmlScriptTag Purple
highlight! link htmlSpecialTagName RedItalic
" }}}
" }}}
" Xml: {{{
" builtin: https://github.com/chrisbra/vim-xml-ftplugin{{{
highlight! link xmlTag Green
highlight! link xmlEndTag Blue
highlight! link xmlTagName OrangeItalic
highlight! link xmlEqual Orange
highlight! link xmlAttrib Cyan
highlight! link xmlEntity Red
highlight! link xmlEntityPunct Red
highlight! link xmlDocTypeDecl Grey
highlight! link xmlDocTypeKeyword PurpleItalic
highlight! link xmlCdataStart Grey
highlight! link xmlCdataCdata Purple
" }}}
" }}}
" CSS: {{{
" builtin: https://github.com/JulesWang/css.vim{{{
highlight! link cssAttrComma Fg
highlight! link cssBraces Fg
highlight! link cssTagName PurpleItalic
highlight! link cssClassNameDot Red
highlight! link cssClassName RedItalic
highlight! link cssFunctionName Yellow
highlight! link cssAttr Orange
highlight! link cssProp Cyan
highlight! link cssCommonAttr Yellow
highlight! link cssPseudoClassId Blue
highlight! link cssPseudoClassFn Green
highlight! link cssPseudoClass Purple
highlight! link cssImportant RedItalic
highlight! link cssSelectorOp Orange
highlight! link cssSelectorOp2 Orange
highlight! link cssColor Green
highlight! link cssAttributeSelector Cyan
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
" }}}
" SASS: {{{
" builtin: {{{
highlight! link sassProperty Cyan
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
" scss-syntax: https://github.com/cakebaker/scss-syntax.vim{{{
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
" }}}
" LESS: {{{
" vim-less: https://github.com/groenewege/vim-less{{{
highlight! link lessMixinChar Grey
highlight! link lessClass RedItalic
highlight! link lessVariable Blue
highlight! link lessAmpersandChar Orange
highlight! link lessFunction Yellow
" }}}
" }}}
" JavaScript: {{{
" builtin: http://www.fleiner.com/vim/syntax/javascript.vim{{{
highlight! link javaScriptNull Cyan
highlight! link javaScriptIdentifier Orange
highlight! link javaScriptParens Fg
highlight! link javaScriptBraces Fg
highlight! link javaScriptGlobal Purple
highlight! link javaScriptMessage Yellow
highlight! link javaScriptFunction RedItalic
highlight! link javaScriptOperator Orange
highlight! link javaScriptMember Cyan
" }}}
" vim-javascript: https://github.com/pangloss/vim-javascript{{{
highlight! link jsThis Purple
highlight! link jsUndefined Cyan
highlight! link jsNull Cyan
highlight! link jsNan Cyan
highlight! link jsSuper Purple
highlight! link jsPrototype Purple
highlight! link jsFunction RedItalic
highlight! link jsGlobalNodeObjects PurpleItalic
highlight! link jsGlobalObjects Yellow
highlight! link jsArrowFunction Purple
highlight! link jsArrowFuncArgs Blue
highlight! link jsFuncArgs Blue
highlight! link jsObjectProp Cyan
highlight! link jsVariableDef Blue
highlight! link jsObjectKey Cyan
highlight! link jsParen Blue
highlight! link jsParenIfElse Blue
highlight! link jsParenRepeat Blue
highlight! link jsParenSwitch Blue
highlight! link jsParenCatch Blue
highlight! link jsBracket Blue
highlight! link jsBlockLabel Cyan
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
" yajs: https://github.com/othree/yajs.vim{{{
highlight! link javascriptEndColons Fg
highlight! link javascriptOpSymbol Orange
highlight! link javascriptOpSymbols Orange
highlight! link javascriptIdentifierName Blue
highlight! link javascriptVariable Orange
highlight! link javascriptObjectLabel Cyan
highlight! link javascriptObjectLabelColon Grey
highlight! link javascriptPropertyNameString Cyan
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
highlight! link javascriptProp Cyan
highlight! link javascriptBOMWindowProp Cyan
highlight! link javascriptDOMStorageProp Cyan
highlight! link javascriptFileReaderProp Cyan
highlight! link javascriptURLUtilsProp Cyan
highlight! link javascriptNumberStaticProp Cyan
highlight! link javascriptDOMNodeProp Cyan
highlight! link javascriptRequestProp Cyan
highlight! link javascriptResponseProp Cyan
highlight! link javascriptES6SetProp Cyan
highlight! link javascriptPaymentProp Cyan
highlight! link javascriptPaymentResponseProp Cyan
highlight! link javascriptPaymentAddressProp Cyan
highlight! link javascriptPaymentShippingOptionProp Cyan
highlight! link javascriptTypedArrayStaticProp Cyan
highlight! link javascriptServiceWorkerProp Cyan
highlight! link javascriptES6MapProp Cyan
highlight! link javascriptRegExpStaticProp Cyan
highlight! link javascriptRegExpProp Cyan
highlight! link javascriptXHRProp Cyan
highlight! link javascriptBOMNavigatorProp Green
highlight! link javascriptDOMEventProp Cyan
highlight! link javascriptBOMNetworkProp Cyan
highlight! link javascriptDOMDocProp Cyan
highlight! link javascriptSymbolStaticProp Cyan
highlight! link javascriptSymbolProp Cyan
highlight! link javascriptBOMLocationProp Cyan
highlight! link javascriptEncodingProp Cyan
highlight! link javascriptCryptoProp Cyan
highlight! link javascriptBOMHistoryProp Cyan
highlight! link javascriptDOMFormProp Cyan
highlight! link javascriptDataViewProp Cyan
highlight! link javascriptBroadcastProp Cyan
highlight! link javascriptMathStaticProp Cyan
" }}}
" }}}
" JavaScript React: {{{
" vim-jsx-pretty: https://github.com/maxmellon/vim-jsx-pretty{{{
highlight! link jsxTagName OrangeItalic
highlight! link jsxOpenPunct Green
highlight! link jsxClosePunct Blue
highlight! link jsxEscapeJs Blue
highlight! link jsxAttrib Cyan
" }}}
" }}}
" TypeScript: {{{
" vim-typescript: https://github.com/leafgarland/typescript-vim{{{
highlight! link typescriptSource PurpleItalic
highlight! link typescriptMessage Yellow
highlight! link typescriptGlobalObjects Cyan
highlight! link typescriptInterpolation Yellow
highlight! link typescriptInterpolationDelimiter Yellow
highlight! link typescriptBraces Fg
highlight! link typescriptParens Fg
" }}}
" yats: https:github.com/HerringtonDarkholme/yats.vim{{{
highlight! link typescriptMethodAccessor OrangeItalic
highlight! link typescriptVariable Orange
highlight! link typescriptVariableDeclaration Blue
highlight! link typescriptTypeReference Yellow
highlight! link typescriptBraces Fg
highlight! link typescriptEnumKeyword RedItalic
highlight! link typescriptEnum Yellow
highlight! link typescriptIdentifierName Cyan
highlight! link typescriptProp Cyan
highlight! link typescriptCall Blue
highlight! link typescriptInterfaceName Yellow
highlight! link typescriptEndColons Fg
highlight! link typescriptMember Cyan
highlight! link typescriptMemberOptionality Orange
highlight! link typescriptObjectLabel Cyan
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
highlight! link typescriptNull Cyan
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
highlight! link typescriptStringProperty Cyan
highlight! link typescriptDOMStorageProp Cyan
highlight! link typescriptFileReaderProp Cyan
highlight! link typescriptURLUtilsProp Cyan
highlight! link typescriptNumberStaticProp Cyan
highlight! link typescriptDOMNodeProp Cyan
highlight! link typescriptBOMWindowProp Cyan
highlight! link typescriptRequestProp Cyan
highlight! link typescriptResponseProp Cyan
highlight! link typescriptPaymentProp Cyan
highlight! link typescriptPaymentResponseProp Cyan
highlight! link typescriptPaymentAddressProp Cyan
highlight! link typescriptPaymentShippingOptionProp Cyan
highlight! link typescriptES6SetProp Cyan
highlight! link typescriptServiceWorkerProp Cyan
highlight! link typescriptES6MapProp Cyan
highlight! link typescriptRegExpStaticProp Cyan
highlight! link typescriptRegExpProp Cyan
highlight! link typescriptBOMNavigatorProp Green
highlight! link typescriptXHRProp Cyan
highlight! link typescriptDOMEventProp Cyan
highlight! link typescriptDOMDocProp Cyan
highlight! link typescriptBOMNetworkProp Cyan
highlight! link typescriptSymbolStaticProp Cyan
highlight! link typescriptEncodingProp Cyan
highlight! link typescriptBOMLocationProp Cyan
highlight! link typescriptCryptoProp Cyan
highlight! link typescriptDOMFormProp Cyan
highlight! link typescriptBOMHistoryProp Cyan
highlight! link typescriptMathStaticProp Cyan
" }}}
" }}}
" Dart: {{{
" dart-lang: https://github.com/dart-lang/dart-vim-plugin{{{
highlight! link dartCoreClasses Cyan
highlight! link dartTypeName Cyan
highlight! link dartInterpolation Blue
highlight! link dartTypeDef RedItalic
highlight! link dartClassDecl RedItalic
highlight! link dartLibrary PurpleItalic
highlight! link dartMetadata Blue
" }}}
" }}}
" CoffeeScript: {{{
" vim-coffee-script: https://github.com/kchmck/vim-coffee-script{{{
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
highlight! link coffeeObjAssign Cyan
" }}}
" }}}
" PureScript: {{{
" purescript-vim: https://github.com/purescript-contrib/purescript-vim{{{
highlight! link purescriptModuleKeyword PurpleItalic
highlight! link purescriptModule Cyan
highlight! link purescriptModuleParams Blue
highlight! link purescriptAsKeyword OrangeItalic
highlight! link purescriptHidingKeyword OrangeItalic
highlight! link purescriptWhere OrangeItalic
highlight! link purescriptIdentifier Blue
highlight! link purescriptFunction Yellow
highlight! link purescriptType Cyan
" }}}
" }}}
" C/C++: {{{
" vim-cpp-enhanced-highlight: https://github.com/octol/vim-cpp-enhanced-highlight{{{
highlight! link cppSTLnamespace Purple
highlight! link cppSTLtype Yellow
highlight! link cppAccess PurpleItalic
highlight! link cppStructure RedItalic
highlight! link cppSTLios Cyan
highlight! link cppSTLiterator PurpleItalic
highlight! link cppSTLexception Purple
" }}}
" vim-cpp-modern: https://github.com/bfrg/vim-cpp-modern{{{
highlight! link cppSTLVariable Cyan
" }}}
" }}}
" ObjectiveC: {{{
" builtin: {{{
highlight! link objcModuleImport PurpleItalic
highlight! link objcException RedItalic
highlight! link objcProtocolList Cyan
highlight! link objcObjDef PurpleItalic
highlight! link objcDirective RedItalic
highlight! link objcPropertyAttribute Orange
highlight! link objcHiddenArgument Cyan
" }}}
" }}}
" C#: {{{
" builtin: https://github.com/nickspoons/vim-cs{{{
highlight! link csUnspecifiedStatement PurpleItalic
highlight! link csStorage RedItalic
highlight! link csClass RedItalic
highlight! link csNewType Cyan
highlight! link csContextualStatement PurpleItalic
highlight! link csInterpolationDelimiter Yellow
highlight! link csInterpolation Yellow
highlight! link csEndColon Fg
" }}}
" }}}
" Python: {{{
" builtin: {{{
highlight! link pythonBuiltin Yellow
highlight! link pythonExceptions Purple
highlight! link pythonDecoratorName Blue
" }}}
" python-syntax: https://github.com/vim-python/python-syntax{{{
highlight! link pythonExClass Purple
highlight! link pythonBuiltinType Yellow
highlight! link pythonBuiltinObj Blue
highlight! link pythonDottedName PurpleItalic
highlight! link pythonBuiltinFunc Green
highlight! link pythonFunction Cyan
highlight! link pythonDecorator Orange
highlight! link pythonInclude Include
highlight! link pythonImport PreProc
highlight! link pythonRun Blue
highlight! link pythonCoding Grey
highlight! link pythonOperator Orange
highlight! link pythonConditional RedItalic
highlight! link pythonRepeat RedItalic
highlight! link pythonException RedItalic
highlight! link pythonNone Cyan
highlight! link pythonDot Grey
" }}}
" }}}
" Lua: {{{
" builtin: {{{
highlight! link luaFunc Green
highlight! link luaFunction Cyan
highlight! link luaTable Fg
highlight! link luaIn RedItalic
" }}}
" vim-lua: https://github.com/tbastos/vim-lua{{{
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
" }}}
" Moonscript: {{{
" moonscript-vim: https://github.com/leafo/moonscript-vim{{{
highlight! link moonInterpDelim Yellow
highlight! link moonInterp Blue
highlight! link moonFunction Green
highlight! link moonLuaFunc Cyan
highlight! link moonSpecialVar Purple
highlight! link moonObject Yellow
highlight! link moonDotAccess Grey
" }}}
" }}}
" Java: {{{
" builtin: {{{
highlight! link javaClassDecl RedItalic
highlight! link javaMethodDecl RedItalic
highlight! link javaVarArg Green
highlight! link javaAnnotation Blue
highlight! link javaUserLabel Purple
highlight! link javaTypedef Cyan
highlight! link javaParen Fg
highlight! link javaParen1 Fg
highlight! link javaParen2 Fg
highlight! link javaParen3 Fg
highlight! link javaParen4 Fg
highlight! link javaParen5 Fg
" }}}
" }}}
" Kotlin: {{{
" kotlin-vim: https://github.com/udalov/kotlin-vim{{{
highlight! link ktSimpleInterpolation Yellow
highlight! link ktComplexInterpolation Yellow
highlight! link ktComplexInterpolationBrace Yellow
highlight! link ktStructure RedItalic
highlight! link ktKeyword Cyan
" }}}
" }}}
" Scala: {{{
" builtin: https://github.com/derekwyatt/vim-scala{{{
highlight! link scalaNameDefinition Cyan
highlight! link scalaInterpolationBoundary Yellow
highlight! link scalaInterpolation Blue
highlight! link scalaTypeOperator Orange
highlight! link scalaOperator Orange
highlight! link scalaKeywordModifier Orange
" }}}
" }}}
" Go: {{{
" builtin: https://github.com/google/vim-ft-go{{{
highlight! link goDirective PurpleItalic
highlight! link goConstants Cyan
highlight! link goDeclType OrangeItalic
" }}}
" polyglot: {{{
highlight! link goPackage PurpleItalic
highlight! link goImport PurpleItalic
highlight! link goVarArgs Blue
highlight! link goBuiltins Green
highlight! link goPredefinedIdentifiers Cyan
highlight! link goVar Orange
" }}}
" }}}
" Rust: {{{
" builtin: https://github.com/rust-lang/rust.vim{{{
highlight! link rustStructure Orange
highlight! link rustIdentifier Purple
highlight! link rustModPath Orange
highlight! link rustModPathSep Grey
highlight! link rustSelf Blue
highlight! link rustSuper Blue
highlight! link rustDeriveTrait PurpleItalic
highlight! link rustEnumVariant Purple
highlight! link rustMacroVariable Blue
highlight! link rustAssert Cyan
highlight! link rustPanic Cyan
highlight! link rustPubScopeCrate PurpleItalic
" }}}
" }}}
" Swift: {{{
" swift.vim: https://github.com/keith/swift.vim{{{
highlight! link swiftInterpolatedWrapper Yellow
highlight! link swiftInterpolatedString Blue
highlight! link swiftProperty Cyan
highlight! link swiftTypeDeclaration Orange
highlight! link swiftClosureArgument Purple
" }}}
" }}}
" PHP: {{{
" builtin: https://jasonwoof.com/gitweb/?p=vim-syntax.git;a=blob;f=php.vim;hb=HEAD{{{
highlight! link phpVarSelector Blue
highlight! link phpDefine OrangeItalic
highlight! link phpStructure RedItalic
highlight! link phpSpecialFunction Green
highlight! link phpInterpSimpleCurly Yellow
highlight! link phpComparison Orange
highlight! link phpMethodsVar Cyan
highlight! link phpMemberSelector Green
" }}}
" php.vim: https://github.com/StanAngeloff/php.vim{{{
highlight! link phpParent Fg
highlight! link phpNowDoc Green
highlight! link phpFunction Green
highlight! link phpMethod Green
highlight! link phpClass Orange
highlight! link phpSuperglobals Purple
" }}}
" }}}
" Ruby: {{{
" builtin: https://github.com/vim-ruby/vim-ruby{{{
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
" }}}
" Haskell: {{{
" haskell-vim: https://github.com/neovimhaskell/haskell-vim{{{
highlight! link haskellBrackets Blue
highlight! link haskellIdentifier Yellow
highlight! link haskellAssocType Cyan
highlight! link haskellQuotedType Cyan
highlight! link haskellType Cyan
highlight! link haskellDeclKeyword RedItalic
highlight! link haskellWhere RedItalic
highlight! link haskellDeriving PurpleItalic
highlight! link haskellForeignKeywords PurpleItalic
" }}}
" }}}
" Perl: {{{
" builtin: https://github.com/vim-perl/vim-perl{{{
highlight! link perlStatementPackage PurpleItalic
highlight! link perlStatementInclude PurpleItalic
highlight! link perlStatementStorage Orange
highlight! link perlStatementList Orange
highlight! link perlMatchStartEnd Orange
highlight! link perlVarSimpleMemberName Cyan
highlight! link perlVarSimpleMember Fg
highlight! link perlMethod Green
highlight! link podVerbatimLine Green
highlight! link podCmdText Yellow
" }}}
" }}}
" OCaml: {{{
" builtin: https://github.com/rgrinberg/vim-ocaml{{{
highlight! link ocamlArrow Orange
highlight! link ocamlEqual Orange
highlight! link ocamlOperator Orange
highlight! link ocamlKeyChar Orange
highlight! link ocamlModPath Green
highlight! link ocamlFullMod Green
highlight! link ocamlModule Purple
highlight! link ocamlConstructor Cyan
highlight! link ocamlFuncWith Yellow
highlight! link ocamlWith Yellow
highlight! link ocamlModParam Fg
highlight! link ocamlModParam1 Fg
highlight! link ocamlAnyVar Blue
highlight! link ocamlPpxEncl Orange
highlight! link ocamlPpxIdentifier Blue
highlight! link ocamlSigEncl Orange
highlight! link ocamlStructEncl Cyan
highlight! link ocamlModParam1 Blue
" }}}
" }}}
" Erlang: {{{
" builtin: https://github.com/vim-erlang/vim-erlang-runtime{{{
highlight! link erlangAtom Cyan
highlight! link erlangLocalFuncRef Green
highlight! link erlangLocalFuncCall Green
highlight! link erlangGlobalFuncRef Green
highlight! link erlangGlobalFuncCall Green
highlight! link erlangAttribute PurpleItalic
highlight! link erlangPipe Orange
" }}}
" }}}
" Elixir: {{{
" vim-elixir: https://github.com/elixir-editors/vim-elixir{{{
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
" }}}
" Common Lisp: {{{
" builtin: http://www.drchip.org/astronaut/vim/index.html#SYNTAX_LISP{{{
highlight! link lispAtomMark Green
highlight! link lispKey Cyan
highlight! link lispFunc OrangeItalic
" }}}
" }}}
" Clojure: {{{
" builtin: https://github.com/guns/vim-clojure-static{{{
highlight! link clojureMacro PurpleItalic
highlight! link clojureFunc Cyan
highlight! link clojureConstant Yellow
highlight! link clojureSpecial RedItalic
highlight! link clojureDefine RedItalic
highlight! link clojureKeyword Orange
highlight! link clojureVariable Blue
highlight! link clojureMeta Yellow
highlight! link clojureDeref Yellow
" }}}
" }}}
" Shell: {{{
" builtin: http://www.drchip.org/astronaut/vim/index.html#SYNTAX_SH{{{
highlight! link shRange Fg
highlight! link shTestOpr Orange
highlight! link shOption Cyan
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
" }}}
" Zsh: {{{
" builtin: https://github.com/chrisbra/vim-zsh{{{
highlight! link zshOptStart PurpleItalic
highlight! link zshOption Blue
highlight! link zshSubst Yellow
highlight! link zshFunction Green
highlight! link zshDeref Blue
highlight! link zshTypes Orange
highlight! link zshVariableDef Blue
" }}}
" }}}
" Fish: {{{
" vim-fish: https://github.com/georgewitteman/vim-fish{{{
highlight! link fishStatement Orange
highlight! link fishLabel RedItalic
highlight! link fishCommandSub Yellow
" }}}
" }}}
" PowerShell: {{{
" vim-ps1: https://github.com/PProvost/vim-ps1{{{
highlight! link ps1FunctionInvocation Cyan
highlight! link ps1FunctionDeclaration Cyan
highlight! link ps1InterpolationDelimiter Yellow
highlight! link ps1BuiltIn Yellow
" }}}
" }}}
" VimL: {{{
highlight! link vimLet Orange
highlight! link vimFunction Green
highlight! link vimIsCommand Fg
highlight! link vimUserFunc Green
highlight! link vimFuncName Green
highlight! link vimMap PurpleItalic
highlight! link vimNotation Cyan
highlight! link vimMapLhs Green
highlight! link vimMapRhs Green
highlight! link vimSetEqual Yellow
highlight! link vimSetSep Fg
highlight! link vimOption Cyan
highlight! link vimUserAttrbKey Yellow
highlight! link vimUserAttrb Green
highlight! link vimAutoCmdSfxList Cyan
highlight! link vimSynType Orange
highlight! link vimHiBang Orange
highlight! link vimSet Yellow
highlight! link vimSetSep Grey
" }}}
" Makefile: {{{
highlight! link makeIdent Cyan
highlight! link makeSpecTarget Yellow
highlight! link makeTarget Blue
highlight! link makeCommands Orange
" }}}
" CMake: {{{
highlight! link cmakeCommand Orange
highlight! link cmakeKWconfigure_package_config_file Yellow
highlight! link cmakeKWwrite_basic_package_version_file Yellow
highlight! link cmakeKWExternalProject Cyan
highlight! link cmakeKWadd_compile_definitions Cyan
highlight! link cmakeKWadd_compile_options Cyan
highlight! link cmakeKWadd_custom_command Cyan
highlight! link cmakeKWadd_custom_target Cyan
highlight! link cmakeKWadd_definitions Cyan
highlight! link cmakeKWadd_dependencies Cyan
highlight! link cmakeKWadd_executable Cyan
highlight! link cmakeKWadd_library Cyan
highlight! link cmakeKWadd_link_options Cyan
highlight! link cmakeKWadd_subdirectory Cyan
highlight! link cmakeKWadd_test Cyan
highlight! link cmakeKWbuild_command Cyan
highlight! link cmakeKWcmake_host_system_information Cyan
highlight! link cmakeKWcmake_minimum_required Cyan
highlight! link cmakeKWcmake_parse_arguments Cyan
highlight! link cmakeKWcmake_policy Cyan
highlight! link cmakeKWconfigure_file Cyan
highlight! link cmakeKWcreate_test_sourcelist Cyan
highlight! link cmakeKWctest_build Cyan
highlight! link cmakeKWctest_configure Cyan
highlight! link cmakeKWctest_coverage Cyan
highlight! link cmakeKWctest_memcheck Cyan
highlight! link cmakeKWctest_run_script Cyan
highlight! link cmakeKWctest_start Cyan
highlight! link cmakeKWctest_submit Cyan
highlight! link cmakeKWctest_test Cyan
highlight! link cmakeKWctest_update Cyan
highlight! link cmakeKWctest_upload Cyan
highlight! link cmakeKWdefine_property Cyan
highlight! link cmakeKWdoxygen_add_docs Cyan
highlight! link cmakeKWenable_language Cyan
highlight! link cmakeKWenable_testing Cyan
highlight! link cmakeKWexec_program Cyan
highlight! link cmakeKWexecute_process Cyan
highlight! link cmakeKWexport Cyan
highlight! link cmakeKWexport_library_dependencies Cyan
highlight! link cmakeKWfile Cyan
highlight! link cmakeKWfind_file Cyan
highlight! link cmakeKWfind_library Cyan
highlight! link cmakeKWfind_package Cyan
highlight! link cmakeKWfind_path Cyan
highlight! link cmakeKWfind_program Cyan
highlight! link cmakeKWfltk_wrap_ui Cyan
highlight! link cmakeKWforeach Cyan
highlight! link cmakeKWfunction Cyan
highlight! link cmakeKWget_cmake_property Cyan
highlight! link cmakeKWget_directory_property Cyan
highlight! link cmakeKWget_filename_component Cyan
highlight! link cmakeKWget_property Cyan
highlight! link cmakeKWget_source_file_property Cyan
highlight! link cmakeKWget_target_property Cyan
highlight! link cmakeKWget_test_property Cyan
highlight! link cmakeKWif Cyan
highlight! link cmakeKWinclude Cyan
highlight! link cmakeKWinclude_directories Cyan
highlight! link cmakeKWinclude_external_msproject Cyan
highlight! link cmakeKWinclude_guard Cyan
highlight! link cmakeKWinstall Cyan
highlight! link cmakeKWinstall_files Cyan
highlight! link cmakeKWinstall_programs Cyan
highlight! link cmakeKWinstall_targets Cyan
highlight! link cmakeKWlink_directories Cyan
highlight! link cmakeKWlist Cyan
highlight! link cmakeKWload_cache Cyan
highlight! link cmakeKWload_command Cyan
highlight! link cmakeKWmacro Cyan
highlight! link cmakeKWmark_as_advanced Cyan
highlight! link cmakeKWmath Cyan
highlight! link cmakeKWmessage Cyan
highlight! link cmakeKWoption Cyan
highlight! link cmakeKWproject Cyan
highlight! link cmakeKWqt_wrap_cpp Cyan
highlight! link cmakeKWqt_wrap_ui Cyan
highlight! link cmakeKWremove Cyan
highlight! link cmakeKWseparate_arguments Cyan
highlight! link cmakeKWset Cyan
highlight! link cmakeKWset_directory_properties Cyan
highlight! link cmakeKWset_property Cyan
highlight! link cmakeKWset_source_files_properties Cyan
highlight! link cmakeKWset_target_properties Cyan
highlight! link cmakeKWset_tests_properties Cyan
highlight! link cmakeKWsource_group Cyan
highlight! link cmakeKWstring Cyan
highlight! link cmakeKWsubdirs Cyan
highlight! link cmakeKWtarget_compile_definitions Cyan
highlight! link cmakeKWtarget_compile_features Cyan
highlight! link cmakeKWtarget_compile_options Cyan
highlight! link cmakeKWtarget_include_directories Cyan
highlight! link cmakeKWtarget_link_directories Cyan
highlight! link cmakeKWtarget_link_libraries Cyan
highlight! link cmakeKWtarget_link_options Cyan
highlight! link cmakeKWtarget_precompile_headers Cyan
highlight! link cmakeKWtarget_sources Cyan
highlight! link cmakeKWtry_compile Cyan
highlight! link cmakeKWtry_run Cyan
highlight! link cmakeKWunset Cyan
highlight! link cmakeKWuse_mangled_mesa Cyan
highlight! link cmakeKWvariable_requires Cyan
highlight! link cmakeKWvariable_watch Cyan
highlight! link cmakeKWwrite_file Cyan
" }}}
" Json: {{{
highlight! link jsonKeyword Orange
highlight! link jsonQuote Grey
highlight! link jsonBraces Fg
" }}}
" Yaml: {{{
highlight! link yamlKey Orange
highlight! link yamlConstant Purple
" }}}
" Toml: {{{
call s:HL('tomlTable', s:palette.purple, s:palette.none, 'bold')
highlight! link tomlKey Orange
highlight! link tomlBoolean Cyan
highlight! link tomlTableArray tomlTable
" }}}
" Diff: {{{
highlight! link diffAdded Green
highlight! link diffRemoved Red
highlight! link diffChanged Blue
highlight! link diffOldFile Yellow
highlight! link diffNewFile Orange
highlight! link diffFile Cyan
highlight! link diffLine Grey
highlight! link diffIndexLine Purple
" }}}
" Help: {{{
call s:HL('helpNote', s:palette.purple, s:palette.none, 'bold')
call s:HL('helpHeadline', s:palette.red, s:palette.none, 'bold')
call s:HL('helpHeader', s:palette.orange, s:palette.none, 'bold')
call s:HL('helpURL', s:palette.green, s:palette.none, 'underline')
call s:HL('helpHyperTextEntry', s:palette.yellow, s:palette.none, 'bold')
highlight! link helpHyperTextJump Yellow
highlight! link helpCommand Cyan
highlight! link helpExample Green
highlight! link helpSpecial Blue
highlight! link helpSectionDelim Grey
" }}}
" }}}
" Plugins: {{{
" junegunn/vim-plug{{{
call s:HL('plug1', s:palette.orange, s:palette.none, 'bold')
call s:HL('plugNumber', s:palette.yellow, s:palette.none, 'bold')
highlight! link plug2 Green
highlight! link plugBracket Grey
highlight! link plugName Cyan
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
" }}}
" neoclide/coc.nvim{{{
call s:HL('CocHoverRange', s:palette.none, s:palette.none, 'bold,underline')
if s:configuration.current_word ==# 'bold'
  call s:HL('CocHighlightText', s:palette.none, s:palette.none, 'bold')
elseif s:configuration.current_word ==# 'underline'
  call s:HL('CocHighlightText', s:palette.none, s:palette.none, 'underline')
elseif s:configuration.current_word ==# 'italic'
  call s:HL('CocHighlightText', s:palette.none, s:palette.none, 'italic')
elseif s:configuration.current_word ==# 'grey background'
  call s:HL('CocHighlightText', s:palette.none, s:palette.bg2)
endif
highlight! link CocErrorSign RedSign
highlight! link CocWarningSign YellowSign
highlight! link CocInfoSign BlueSign
highlight! link CocHintSign CyanSign
highlight! link CocErrorHighlight ALEError
highlight! link CocWarningHighlight ALEWarning
highlight! link CocInfoHighlight ALEInfo
highlight! link CocWarningVirtualText Grey
highlight! link CocErrorVirtualText Grey
highlight! link CocInfoVirtualText Grey
highlight! link CocHintVirtualText Grey
highlight! link CocCodeLens Grey
highlight! link HighlightedyankRegion Visual
highlight! link CocGitAddedSign GreenSign
highlight! link CocGitChangeRemovedSign PurpleSign
highlight! link CocGitChangedSign BlueSign
highlight! link CocGitRemovedSign RedSign
highlight! link CocGitTopRemovedSign RedSign
highlight! link CocExplorerBufferRoot Orange
highlight! link CocExplorerBufferExpandIcon Cyan
highlight! link CocExplorerBufferBufnr Purple
highlight! link CocExplorerBufferModified Red
highlight! link CocExplorerBufferBufname Grey
highlight! link CocExplorerBufferFullpath Grey
highlight! link CocExplorerFileRoot Orange
highlight! link CocExplorerFileExpandIcon Cyan
highlight! link CocExplorerFileFullpath Grey
highlight! link CocExplorerFileDirectory Green
highlight! link CocExplorerFileGitStage Purple
highlight! link CocExplorerFileGitUnstage Yellow
highlight! link CocExplorerFileSize Blue
highlight! link CocExplorerTimeAccessed Cyan
highlight! link CocExplorerTimeCreated Cyan
highlight! link CocExplorerTimeModified Cyan
" }}}
" dense-analysis/ale{{{
call s:HL('ALEError', s:palette.none, s:palette.none, 'undercurl', s:palette.red)
call s:HL('ALEWarning', s:palette.none, s:palette.none, 'undercurl', s:palette.yellow)
call s:HL('ALEInfo', s:palette.none, s:palette.none, 'undercurl', s:palette.blue)
highlight! link ALEErrorSign RedSign
highlight! link ALEWarningSign YellowSign
highlight! link ALEInfoSign BlueSign
highlight! link ALEVirtualTextError Grey
highlight! link ALEVirtualTextWarning Grey
highlight! link ALEVirtualTextInfo Grey
highlight! link ALEVirtualTextStyleError Grey
highlight! link ALEVirtualTextStyleWarning Grey
" }}}
" neomake/neomake{{{
highlight! link NeomakeError ALEError
highlight! link NeomakeErrorSign RedSign
highlight! link NeomakeWarning ALEWarning
highlight! link NeomakeWarningSign YellowSign
highlight! link NeomakeInfo ALEInfo
highlight! link NeomakeInfoSign BlueSign
highlight! link NeomakeMessage Cyan
highlight! link NeomakeMessageSign CyanSign
highlight! link NeomakeVirtualtextError Grey
highlight! link NeomakeVirtualtextWarning Grey
highlight! link NeomakeVirtualtextInfo Grey
highlight! link NeomakeVirtualtextMessag Grey
" }}}
" vim-syntastic/syntastic{{{
highlight! link SyntasticError ALEError
highlight! link SyntasticWarning ALEWarning
highlight! link SyntasticErrorSign RedSign
highlight! link SyntasticWarningSign YellowSign
" }}}
" Yggdroot/LeaderF{{{
call s:HL('Lf_hl_match', s:palette.green, s:palette.none, 'bold')
call s:HL('Lf_hl_match0', s:palette.green, s:palette.none, 'bold')
call s:HL('Lf_hl_match1', s:palette.cyan, s:palette.none, 'bold')
call s:HL('Lf_hl_match2', s:palette.blue, s:palette.none, 'bold')
call s:HL('Lf_hl_match3', s:palette.purple, s:palette.none, 'bold')
call s:HL('Lf_hl_match4', s:palette.orange, s:palette.none, 'bold')
call s:HL('Lf_hl_matchRefine', s:palette.red, s:palette.none, 'bold')
highlight! link Lf_hl_cursorline Fg
highlight! link Lf_hl_selection DiffAdd
highlight! link Lf_hl_rgHighlight Visual
highlight! link Lf_hl_gtagsHighlight Visual
" }}}
" junegunn/fzf.vim{{{
let g:fzf_colors = {
      \ 'fg':      ['fg', 'Normal'],
      \ 'bg':      ['bg', 'Normal'],
      \ 'hl':      ['fg', 'Green'],
      \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
      \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
      \ 'hl+':     ['fg', 'Cyan'],
      \ 'info':    ['fg', 'Cyan'],
      \ 'prompt':  ['fg', 'Orange'],
      \ 'pointer': ['fg', 'Blue'],
      \ 'marker':  ['fg', 'Yellow'],
      \ 'spinner': ['fg', 'Yellow'],
      \ 'header':  ['fg', 'Grey']
      \ }
" }}}
" Shougo/denite.nvim{{{
call s:HL('deniteMatchedChar', s:palette.green, s:palette.none, 'bold')
call s:HL('deniteMatchedRange', s:palette.green, s:palette.none, 'bold,underline')
call s:HL('deniteInput', s:palette.green, s:palette.bg3, 'bold')
call s:HL('deniteStatusLineNumber', s:palette.purple, s:palette.bg3)
call s:HL('deniteStatusLinePath', s:palette.fg, s:palette.bg3)
highlight! link deniteSelectedLin Green
" }}}
" kien/ctrlp.vim{{{
call s:HL('CtrlPMatch', s:palette.green, s:palette.none, 'bold')
call s:HL('CtrlPPrtBase', s:palette.bg3, s:palette.none)
call s:HL('CtrlPLinePre', s:palette.bg3, s:palette.none)
call s:HL('CtrlPMode1', s:palette.blue, s:palette.bg3, 'bold')
call s:HL('CtrlPMode2', s:palette.bg0, s:palette.blue, 'bold')
call s:HL('CtrlPStats', s:palette.grey, s:palette.bg3, 'bold')
highlight! link CtrlPNoEntries Red
highlight! link CtrlPPrtCursor Blue
" }}}
" majutsushi/tagbar{{{
highlight! link TagbarFoldIcon Green
highlight! link TagbarSignature Green
highlight! link TagbarKind Red
highlight! link TagbarScope Orange
highlight! link TagbarNestedKind Cyan
highlight! link TagbarVisibilityPrivate Red
highlight! link TagbarVisibilityPublic Blue
" }}}
" liuchengxu/vista.vim{{{
highlight! link VistaBracket Grey
highlight! link VistaChildrenNr Orange
highlight! link VistaScope Red
highlight! link VistaTag Green
highlight! link VistaPrefix Grey
highlight! link VistaColon Green
highlight! link VistaIcon Purple
highlight! link VistaLineNr Fg
" }}}
" airblade/vim-gitgutter{{{
highlight! link GitGutterAdd GreenSign
highlight! link GitGutterChange BlueSign
highlight! link GitGutterDelete RedSign
highlight! link GitGutterChangeDelete PurpleSign
" }}}
" mhinz/vim-signify{{{
highlight! link SignifySignAdd GreenSign
highlight! link SignifySignChange BlueSign
highlight! link SignifySignDelete RedSign
highlight! link SignifySignChangeDelete PurpleSign
" }}}
" scrooloose/nerdtree{{{
highlight! link NERDTreeDir Green
highlight! link NERDTreeDirSlash Cyan
highlight! link NERDTreeOpenable Orange
highlight! link NERDTreeClosable Orange
highlight! link NERDTreeFile Fg
highlight! link NERDTreeExecFile Yellow
highlight! link NERDTreeUp Grey
highlight! link NERDTreeCWD Cyan
highlight! link NERDTreeHelp LightGrey
highlight! link NERDTreeToggleOn Green
highlight! link NERDTreeToggleOff Red
highlight! link NERDTreeFlags Orange
highlight! link NERDTreeLinkFile Grey
highlight! link NERDTreeLinkTarget Green
" }}}
" justinmk/vim-dirvish{{{
highlight! link DirvishPathTail Cyan
highlight! link DirvishArg Yellow
" }}}
" vim.org/netrw {{{
" https://www.vim.org/scripts/script.php?script_id=1075
highlight! link netrwDir Green
highlight! link netrwClassify Green
highlight! link netrwLink Grey
highlight! link netrwSymLink Fg
highlight! link netrwExe Yellow
highlight! link netrwComment Grey
highlight! link netrwList Cyan
highlight! link netrwHelpCmd Blue
highlight! link netrwCmdSep Grey
highlight! link netrwVersion Orange
" }}}
" andymass/vim-matchup{{{
call s:HL('MatchParenCur', s:palette.none, s:palette.none, 'bold')
call s:HL('MatchWord', s:palette.none, s:palette.none, 'underline')
call s:HL('MatchWordCur', s:palette.none, s:palette.none, 'underline')
" }}}
" easymotion/vim-easymotion {{{
highlight! link EasyMotionTarget Search
highlight! link EasyMotionShade Comment
" }}}
" justinmk/vim-sneak {{{
highlight! link Sneak Cursor
highlight! link SneakLabel Cursor
highlight! link SneakScope DiffChange
" }}}
" terryma/vim-multiple-cursors{{{
highlight! link multiple_cursors_cursor Cursor
highlight! link multiple_cursors_visual Visual
" }}}
" mg979/vim-visual-multi{{{
let g:VM_Mono_hl = 'Cursor'
let g:VM_Extend_hl = 'Visual'
let g:VM_Cursor_hl = 'Cursor'
let g:VM_Insert_hl = 'Cursor'
" }}}
" dominikduda/vim_current_word{{{
highlight! link CurrentWord CocHighlightText
highlight! link CurrentWordTwins CocHighlightText
" }}}
" RRethy/vim-illuminate{{{
highlight! link illuminatedWord CocHighlightText
" }}}
" itchyny/vim-cursorword{{{
highlight! link CursorWord0 CocHighlightText
highlight! link CursorWord1 CocHighlightText
" }}}
" nathanaelkane/vim-indent-guides{{{
if get(g:, 'indent_guides_auto_colors', 1) == 0
  call s:HL('IndentGuidesOdd', s:palette.bg0, s:palette.bg1)
  call s:HL('IndentGuidesEven', s:palette.bg0, s:palette.bg2)
endif
" }}}
" luochen1990/rainbow{{{
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
" mhinz/vim-startify{{{
highlight! link StartifyBracket Grey
highlight! link StartifyFile Fg
highlight! link StartifyNumber Red
highlight! link StartifyPath Green
highlight! link StartifySlash Green
highlight! link StartifySection Blue
highlight! link StartifyHeader Orange
highlight! link StartifySpecial Grey
highlight! link StartifyFooter Grey
" }}}
" ap/vim-buftabline{{{
highlight! link BufTabLineCurrent TabLineSel
highlight! link BufTabLineActive TabLine
highlight! link BufTabLineHidden TabLineFill
highlight! link BufTabLineFill TabLineFill
" }}}
" liuchengxu/vim-which-key{{{
highlight! link WhichKey Red
highlight! link WhichKeySeperator Green
highlight! link WhichKeyGroup Yellow
highlight! link WhichKeyDesc Blue
highlight! link WhichKeyFloating SignColumn
" }}}
" skywind3000/quickmenu.vim{{{
highlight! link QuickmenuOption Green
highlight! link QuickmenuNumber Red
highlight! link QuickmenuBracket Grey
highlight! link QuickmenuHelp Green
highlight! link QuickmenuSpecial Purple
highlight! link QuickmenuHeader Orange
" }}}
" mbbill/undotree{{{
call s:HL('UndotreeSavedBig', s:palette.purple, s:palette.none, 'bold')
highlight! link UndotreeNode Orange
highlight! link UndotreeNodeCurrent Red
highlight! link UndotreeSeq Green
highlight! link UndotreeNext Blue
highlight! link UndotreeTimeStamp Grey
highlight! link UndotreeHead Yellow
highlight! link UndotreeBranch Yellow
highlight! link UndotreeCurrent Cyan
highlight! link UndotreeSavedSmall Purple
" }}}
" unblevable/quick-scope {{{
call s:HL('QuickScopePrimary', s:palette.cyan, s:palette.none, 'underline')
call s:HL('QuickScopeSecondary', s:palette.blue, s:palette.none, 'underline')
" }}}
" APZelos/blamer.nvim {{{
highlight! link Blamer Grey
" }}}
" }}}
" Terminal: {{{
if (has('termguicolors') && &termguicolors) || has('gui_running')
  " Definition
  let s:terminal = {
        \ 'black':    s:palette.fg,
        \ 'red':      s:palette.red,
        \ 'yellow':   s:palette.yellow,
        \ 'green':    s:palette.green,
        \ 'cyan':     s:palette.cyan,
        \ 'blue':     s:palette.blue,
        \ 'purple':   s:palette.purple,
        \ 'white':    s:palette.grey
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

" vim: set sw=2 ts=2 sts=2 et tw=80 ft=vim fdm=marker fmr={{{,}}}:
