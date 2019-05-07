" =============================================================================
" URL: https://github.com/sainnhe/vim-color-forest-night/
" Filename: forest-night.vim
" Author: Sainnhepark
" Email: sainnhe@gmail.com
" License: MIT License & Anti-996 License
" =============================================================================

if &background !=# 'dark'
    set background=dark
endif
if !has('vim_starting')
    hi clear
endif
if exists('g:syntax_on')
    syntax reset
endif
if exists('g:colors_name')
  unlet g:colors_name
endif
let g:colors_name = 'forest-night'

let g:forest_night_italic_comments = get(g:, 'forest_night_italic_comments', 0)
let g:forest_night_kill_italic = get(g:, 'forest_night_kill_italic', 0)
let g:forest_night_kill_bold = get(g:, 'forest_night_kill_bold', 0)
let g:forest_night_highlight_terminal = get(g:, 'forest_night_highlight_terminal', 1)
let g:forest_night_cterm_italic = get(g:, 'forest_night_cterm_italic', 0)

let s:gui_running = has('gui_running')
let s:true_colors = has('termguicolors') && &termguicolors
let s:undercurl_attr = s:gui_running ? 'gui=undercurl cterm=undercurl' : 'gui=underline cterm=underline'
let s:italic_attr = g:forest_night_kill_italic ? '' : g:forest_night_cterm_italic ? 'gui=italic cterm=italic' : 'gui=italic'
let s:bold_attr = g:forest_night_kill_bold ? '' : 'gui=bold cterm=bold'

if exists('g:forest_night_high_contrast')
    if type(g:forest_night_high_contrast) != type(0)
        echoerr 'g:forest_night_high_contrast was changed to number value. Please read README.md of vim-color-forest-night repository and set proper value'
        let g:forest_night_high_contrast = !s:gui_running && s:true_colors
    endif
else
    let g:forest_night_high_contrast = !s:gui_running && s:true_colors
endif

let s:bg_gui = g:forest_night_high_contrast ? '#132132' : '#3C4C55'
let s:darkgold_gui = g:forest_night_high_contrast ? '#484000' : '#685800'
let s:fg_cterm = g:forest_night_high_contrast ? 231 : 230

hi Boolean term=NONE guifg=#fd8489 ctermfg=210
hi Character term=NONE guifg=#a9dd9d ctermfg=150
hi ColorColumn term=NONE guibg=#536273 ctermbg=238
exe 'hi' 'Comment' 'term=NONE' 'guifg=#616c72' 'ctermfg=103' g:forest_night_italic_comments ? s:italic_attr : ''
" exe 'hi' 'Conceal' 'term=NONE' 'guifg=#fb8965' 'ctermfg=209' 'guibg='.s:bg_gui 'ctermbg=233'
hi Conceal          ctermbg=NONE ctermfg=14    cterm=NONE      guibg=NONE    guifg=#616c72   gui=NONE
hi Conditional term=NONE guifg=#a8d2eb ctermfg=153
hi Constant term=NONE guifg=#fd8489 ctermfg=210
exe 'hi' 'Cursor' 'term=NONE' 'guifg='.s:bg_gui 'ctermfg=233' 'guibg=#fffeeb' 'ctermbg='.s:fg_cterm
hi CursorColumn term=NONE guibg=#4c5866 ctermbg=235
hi CursorLine term=NONE guibg=#4c5866 ctermbg=235 gui=NONE cterm=NONE
hi CursorLineNr term=NONE guifg=#e7d5ff ctermfg=189 guibg=#536273 ctermbg=238
hi Define term=NONE guifg=#f0aa8a ctermfg=216
hi Directory term=NONE guifg=#a9dd9d ctermfg=150
hi EndOfBuffer term=NONE guifg=#536273 ctermfg=238
exe 'hi' 'Error' 'term=NONE' 'guifg=#fd8489' 'ctermfg=210' 'guibg=#4c5866' 'ctermbg=235' s:bold_attr
exe 'hi' 'ErrorMsg' 'term=NONE' 'guifg=#fd8489' 'ctermfg=210' 'guibg='.s:bg_gui 'ctermbg=233' s:bold_attr
hi Float term=NONE guifg=#fd8489 ctermfg=210
hi FoldColumn       ctermbg=NONE ctermfg=110   cterm=NONE      guibg=NONE    guifg=#7fc1ca   gui=NONE
hi Folded           ctermbg=NONE ctermfg=110   cterm=NONE      guibg=NONE    guifg=#7fc1ca   gui=NONE
hi Function term=NONE guifg=#f0aa8a ctermfg=216
exe 'hi' 'Identifier' 'term=NONE' 'guifg=#f0c38a' 'ctermfg=222' s:italic_attr
hi IncSearch term=NONE guifg=NONE ctermfg=NONE guibg=#a9667a ctermbg=132 gui=underline cterm=underline
exe 'hi' 'Keyword' 'term=NONE' 'guifg=#f0eaaa' 'ctermfg=229' s:bold_attr
hi Label term=NONE guifg=#a8d2eb ctermfg=153
hi LineNr term=NONE guifg=#788898 ctermfg=102 guibg=#4c5866 ctermbg=235
exe 'hi' 'MatchParen' 'term=NONE' 'guifg='.s:bg_gui 'ctermfg=233' 'guibg=#a9667a' 'ctermbg=132' 'gui=underline cterm=underline'
hi ModeMsg term=NONE guifg=#f0c38a ctermfg=222
hi MoreMsg term=NONE guifg=#a9dd9d ctermfg=150
hi NonText term=NONE guifg=#646f7c ctermfg=60
hi Normal           ctermbg=239  ctermfg=229   cterm=NONE      guibg=#3C4C55 guifg=#FFEBC3   gui=NONE
hi Number term=NONE guifg=#fd8489 ctermfg=210
hi Operater term=NONE guifg=#f0aa8a ctermfg=216
hi Pmenu            ctermbg=243  ctermfg=229   cterm=NONE      guibg=#616c72 guifg=#ffebc3   gui=NONE
hi PmenuSbar        ctermbg=243  ctermfg=NONE  cterm=NONE      guibg=#616c72 guifg=NONE      gui=NONE
hi PmenuSel         ctermbg=243  ctermfg=229   cterm=REVERSE   guibg=#616c72 guifg=#ffebc3   gui=REVERSE
hi PmenuThumb       ctermbg=229  ctermfg=NONE  cterm=NONE      guibg=#ffebc3 guifg=NONE      gui=NONE
hi PreProc term=NONE guifg=#f0aa8a ctermfg=216
hi Question term=NONE guifg=#a8d2eb ctermfg=153
hi Search term=NONE guifg=NONE ctermfg=NONE guibg=#605779 ctermbg=60 gui=underline cterm=underline
hi SignColumn       ctermbg=243  ctermfg=NONE  cterm=NONE      guibg=#616c72 guifg=NONE      gui=NONE
exe 'hi' 'Special' 'term=NONE' 'guifg=#f0eaaa' 'ctermfg=229' s:bold_attr
hi SpecialKey term=NONE guifg=#607080 ctermfg=60
exe 'hi' 'SpellBad' 'term=NONE' 'guifg=#fd8489' 'ctermfg=210' 'guisp=#fd8489' s:undercurl_attr
exe 'hi' 'SpellCap' 'term=NONE' 'guifg=#e7d5ff' 'ctermfg=189' 'guisp=#e7d5ff' s:undercurl_attr
exe 'hi' 'SpellLocal' 'term=NONE' 'guifg=#fd8489' 'ctermfg=210' 'guisp=#fd8489' s:undercurl_attr
exe 'hi' 'SpellRare' 'term=NONE' 'guifg=#f0eaaa' 'ctermfg=229' 'guisp=#f0eaaa' s:undercurl_attr
hi Statement term=NONE guifg=#a8d2eb ctermfg=153
exe 'hi' 'StatusLine' 'term=NONE' 'guifg=#fffeeb' 'ctermfg='.s:fg_cterm 'guibg=#536273' 'ctermbg=238' s:bold_attr
hi StatusLineNC term=NONE guifg=#616c72 ctermfg=103 guibg=#4c5866 ctermbg=235 gui=NONE cterm=NONE
exe 'hi' 'StatusLineTerm' 'term=NONE' 'guifg=#fffeeb' 'ctermfg='.s:fg_cterm 'guibg=#536273' 'ctermbg=238' s:bold_attr
hi StatusLineTermNC term=NONE guifg=#616c72 ctermfg=103 guibg=#4c5866 ctermbg=235 gui=NONE cterm=NONE
exe 'hi' 'StorageClass' 'term=NONE' 'guifg=#f0c38a' 'ctermfg=222' s:italic_attr
hi String term=NONE guifg=#a9dd9d ctermfg=150
hi TabLine term=NONE guifg=#616c72 ctermfg=103 guibg=#536273 ctermbg=238
hi TabLineFill term=NONE guifg=#4c5866 ctermfg=235
exe 'hi' 'TabLineSel' 'term=NONE' 'guifg=#f0c38a' 'ctermfg=222' 'guibg='.s:bg_gui 'ctermbg=233' s:bold_attr
hi Tag term=NONE guifg=#f0aa8a ctermfg=216
exe 'hi' 'Title' 'term=NONE' 'guifg=#f0c38a' 'ctermfg=222' s:bold_attr
exe 'hi' 'Todo' 'term=NONE' 'guifg='.s:bg_gui 'ctermfg=233' 'guibg=#fd8489' 'ctermbg=210' s:bold_attr
exe 'hi' 'ToolbarButton' 'term=NONE' 'guifg=#f0c38a' 'ctermfg=222' 'guibg='.s:bg_gui 'ctermbg=233' s:bold_attr
hi ToolbarLine term=NONE guifg=#616c72 ctermfg=103 guibg=#536273 ctermbg=238
hi Type term=NONE guifg=#f0c38a ctermfg=222
hi Underlined term=NONE guifg=#a8d2eb ctermfg=153 gui=underline cterm=underline
hi VertSplit        ctermbg=NONE ctermfg=243   cterm=NONE      guibg=NONE    guifg=#616c72   gui=NONE
hi Visual term=NONE guibg=#70495d ctermbg=95
hi WarningMsg term=NONE guifg=#fb8965 ctermfg=209 guibg=#4c5866 ctermbg=235
hi WildMenu term=NONE guibg=#f0c38a ctermbg=222
hi cmakeArguments term=NONE guifg=#f0eaaa ctermfg=229
hi cmakeOperators term=NONE guifg=#fd8489 ctermfg=210
exe 'hi' 'DiffAdd' 'term=NONE' 'guibg=#5f8770' 'ctermbg=65' s:bold_attr
exe 'hi' 'DiffChange' 'term=NONE' 'guibg='.s:darkgold_gui 'ctermbg=58' s:bold_attr
exe 'hi' 'DiffDelete' 'term=NONE' 'guifg=#fffeeb' 'ctermfg='.s:fg_cterm 'guibg=#ab6560' 'ctermbg=167' s:bold_attr
exe 'hi' 'DiffText' 'term=NONE' 'guibg='.s:bg_gui 'ctermbg=233'
hi diffAdded term=NONE guifg=#a9dd9d ctermfg=150
hi diffFile term=NONE guifg=#f0eaaa ctermfg=229
hi diffIndexLine term=NONE guifg=#f0c38a ctermfg=222
hi diffNewFile term=NONE guifg=#f0eaaa ctermfg=229
hi diffRemoved term=NONE guifg=#fd8489 ctermfg=210
hi gitCommitOverflow term=NONE guibg=#fd8489 ctermbg=210
hi gitCommitSummary term=NONE guifg=#f0eaaa ctermfg=229
hi gitCommitSelectedFile term=NONE guifg=#a8d2eb ctermfg=153
exe 'hi' 'gitconfigSection' 'term=NONE' 'guifg=#a8d2eb' 'ctermfg=153' s:bold_attr
hi goBuiltins term=NONE guifg=#fd8489 ctermfg=210
hi helpExample term=NONE guifg=#a8d2eb ctermfg=153
hi helpCommand term=NONE guifg=#e7d5ff ctermfg=189
hi htmlBold term=NONE guibg=#4c5866 ctermbg=235
hi htmlLinkText term=NONE guifg=#a8d2eb ctermfg=153
hi htmlTagName term=NONE guifg=#f0aa8a ctermfg=216
exe 'hi' 'javaScriptBraces' 'term=NONE' 'guifg=#fffeeb' 'ctermfg='.s:fg_cterm
hi makeCommands term=NONE guifg=#f0eaaa ctermfg=229
hi markdownCode term=NONE guifg=#f0eaaa ctermfg=229
hi markdownUrl term=NONE guifg=#616c72 ctermfg=103
hi ocamlConstructor term=NONE guifg=#f0c38a ctermfg=222
hi ocamlKeyChar term=NONE guifg=#a8d2eb ctermfg=153
hi ocamlKeyword term=NONE guifg=#f0c38a ctermfg=222
hi ocamlFunDef term=NONE guifg=#a8d2eb ctermfg=153
hi plantumlColonLine term=NONE guifg=#a8d2eb ctermfg=153
hi pythonBuiltin term=NONE guifg=#fd8489 ctermfg=210
hi qfFileName term=NONE guifg=#f0c38a ctermfg=222
hi qfLineNr term=NONE guifg=#a8d2eb ctermfg=153
exe 'hi' 'rstEmphasis' 'term=NONE' 'guibg=#4c5866' 'ctermbg=235' s:italic_attr
exe 'hi' 'rstStrongEmphasis' 'term=NONE' 'guibg=#536273' 'ctermbg=238' s:bold_attr
hi rubyFunction term=NONE guifg=#f0eaaa ctermfg=229
hi rubyIdentifier term=NONE guifg=#f0eaaa ctermfg=229
hi rustEnumVariant term=NONE guifg=#f0c38a ctermfg=222
exe 'hi' 'rustFuncCall' 'term=NONE' 'guifg=#fffeeb' 'ctermfg='.s:fg_cterm
hi rustCommentLineDoc term=NONE guifg=#e7c6b7 ctermfg=181
hi tomlTable term=NONE guifg=#a8d2eb ctermfg=153
hi tomlTableArray term=NONE guifg=#a8d2eb ctermfg=153
hi tomlKey term=NONE guifg=#f0c38a ctermfg=222
exe 'hi' 'typescriptBraces' 'term=NONE' 'guifg=#fffeeb' 'ctermfg='.s:fg_cterm
hi vimfilerColumn__SizeLine term=NONE guifg=#616c72 ctermfg=103
hi vimfilerClosedFile term=NONE guifg=#a9dd9d ctermfg=150
hi vimCommand term=NONE guifg=#a8d2eb ctermfg=153
exe 'hi' 'wastListDelimiter' 'term=NONE' 'guifg=#fffeeb' 'ctermfg='.s:fg_cterm
hi wastInstGeneral term=NONE guifg=#f0eaaa ctermfg=229
hi wastInstWithType term=NONE guifg=#f0eaaa ctermfg=229
hi wastUnnamedVar term=NONE guifg=#e7d5ff ctermfg=189
hi zshDelimiter term=NONE guifg=#a8d2eb ctermfg=153
hi zshPrecommand term=NONE guifg=#fd8489 ctermfg=210
hi ghaworkflowAttrName term=NONE guifg=#f0eaaa ctermfg=229
exe 'hi' 'ALEWarningSign' 'term=NONE' 'guifg=#f0aa8a' 'ctermfg=216' 'guibg=#4c5866' 'ctermbg=235' s:bold_attr
exe 'hi' 'ALEErrorSign' 'term=NONE' 'guifg=#4c5866' 'ctermfg=235' 'guibg=#ab6560' 'ctermbg=167' s:bold_attr
hi ALEInfoSign term=NONE guibg=#646f7c ctermbg=60
hi ALEError term=NONE guibg=#ab6560 ctermbg=167
exe 'hi' 'ALEWarning' 'term=NONE' 'guibg='.s:darkgold_gui 'ctermbg=58'
exe 'hi' 'CleverFChar' 'term=NONE' 'guifg='.s:bg_gui 'ctermfg=233' 'guibg=#fd8489' 'ctermbg=210'
exe 'hi' 'DirvishArg' 'term=NONE' 'guifg=#f0eaaa' 'ctermfg=229' s:bold_attr
exe 'hi' 'EasyMotionTarget' 'term=NONE' 'guifg=#fd8489' 'ctermfg=210' s:bold_attr
exe 'hi' 'EasyMotionShade' 'term=NONE' 'guifg=#616c72' 'ctermfg=103' 'guibg='.s:bg_gui 'ctermbg=233'
hi GitGutterAdd term=NONE guifg=#a9dd9d ctermfg=150 guibg=#4c5866 ctermbg=235
hi GitGutterChange term=NONE guifg=#f0eaaa ctermfg=229 guibg=#4c5866 ctermbg=235
hi GitGutterChangeDelete term=NONE guifg=#f0c38a ctermfg=222 guibg=#4c5866 ctermbg=235
hi GitGutterDelete term=NONE guifg=#fd8489 ctermfg=210 guibg=#4c5866 ctermbg=235
hi HighlightedyankRegion term=NONE guibg=#4c5866 ctermbg=235
if s:gui_running
    exe 'hi' 'EasyMotionIncCursor' 'term=NONE' 'guifg='.s:bg_gui 'ctermfg=233' 'guibg=#fffeeb' 'ctermbg='.s:fg_cterm
else
    hi EasyMotionIncCursor term=NONE gui=reverse cterm=reverse
endif
highlight CocHighlightText cterm=bold gui=bold
highlight CocCodeLens ctermfg=Gray guifg=#888888
highlight link CocErrorSign ALEErrorSign
highlight link CocWarningSign ALEWarningSign
highlight link CocInfoSign ALEInfoSign
highlight link CocHintSign Label
highlight link CocErrorHighlight ALEError
highlight link CocWarningHighlight ALEWarning
highlight link CocInfoHighlight ALEInfo

if g:forest_night_highlight_terminal
    if has('nvim')
        if s:gui_running || s:true_colors
            let g:terminal_color_0 = '#132132'
            let g:terminal_color_1 = '#ff6a6f'
            let g:terminal_color_2 = '#a9dd9d'
            let g:terminal_color_3 = '#f0c38a'
            let g:terminal_color_4 = '#7098e6'
            let g:terminal_color_5 = '#605779'
            let g:terminal_color_6 = '#a8d2eb'
            let g:terminal_color_7 = '#fffeeb'
            let g:terminal_color_8 = '#8d9eb2'
            let g:terminal_color_9 = '#fd8489'
            let g:terminal_color_10 = '#c9fd88'
            let g:terminal_color_11 = '#f0eaaa'
            let g:terminal_color_12 = '#98b8e6'
            let g:terminal_color_13 = '#e7d5ff'
            let g:terminal_color_14 = '#a8d2eb'
            let g:terminal_color_15 = '#ffffff'
        else
            let g:terminal_color_0 = 233
            let g:terminal_color_1 = 203
            let g:terminal_color_2 = 150
            let g:terminal_color_3 = 222
            let g:terminal_color_4 = 69
            let g:terminal_color_5 = 60
            let g:terminal_color_6 = 153
            let g:terminal_color_7 = 231
            let g:terminal_color_8 = 103
            let g:terminal_color_9 = 210
            let g:terminal_color_10 = 149
            let g:terminal_color_11 = 229
            let g:terminal_color_12 = 111
            let g:terminal_color_13 = 189
            let g:terminal_color_14 = 153
            let g:terminal_color_15 = 231
        endif
    elseif (s:gui_running || s:true_colors) && exists('*term_setansicolors')
        let g:terminal_ansi_colors = ['#132132', '#ff6a6f', '#a9dd9d', '#fedf81', '#7098e6', '#605779', '#a8d2eb', '#fffeeb', '#8d9eb2', '#fd8489', '#c9fd88', '#f0eaaa', '#98b8e6', '#e7d5ff', '#a8d2eb', '#ffffff']
    endif
endif
