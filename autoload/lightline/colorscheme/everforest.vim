" =============================================================================
" URL: https://github.com/sainnhe/everforest
" Filename: autoload/lightline/colorscheme/everforest.vim
" Author: sainnhe
" Email: sainnhe@gmail.com
" License: MIT License
" =============================================================================

" Initialization: {{{
let s:configuration = everforest#get_configuration()
let s:palette = everforest#get_palette(s:configuration.background)
"}}}
" Definition: {{{
let s:tab_l_fg = s:palette.grey2
let s:tab_l_bg = s:palette.bg3
let s:tab_r_fg = s:palette.bg0
let s:tab_r_bg = s:palette.statusline1
let s:tab_sel_fg = s:palette.bg0
let s:tab_sel_bg = s:palette.statusline1
let s:tab_middle_fg = s:palette.grey1
let s:tab_middle_bg = s:palette.bg1

let s:warningfg = s:palette.bg0
let s:warningbg = s:palette.yellow
let s:errorfg = s:palette.bg0
let s:errorbg = s:palette.statusline3

let s:normal_l1_fg = s:palette.bg0
let s:normal_l1_bg = s:palette.statusline1
let s:normal_l2_fg = s:palette.grey2
let s:normal_l2_bg = s:palette.bg3
let s:normal_r1_fg = s:palette.bg0
let s:normal_r1_bg = s:palette.statusline1
let s:normal_r2_fg = s:palette.grey2
let s:normal_r2_bg = s:palette.bg3
let s:normal_middle_fg = s:palette.grey1
let s:normal_middle_bg = s:palette.bg1

let s:insert_l1_fg = s:palette.bg0
let s:insert_l1_bg = s:palette.statusline2
let s:insert_l2_fg = s:palette.fg
let s:insert_l2_bg = s:palette.bg3
let s:insert_r1_fg = s:palette.bg0
let s:insert_r1_bg = s:palette.statusline2
let s:insert_r2_fg = s:palette.fg
let s:insert_r2_bg = s:palette.bg3
let s:insert_middle_fg = s:palette.fg
let s:insert_middle_bg = s:palette.bg1

let s:visual_l1_fg = s:palette.bg0
let s:visual_l1_bg = s:palette.statusline3
let s:visual_l2_fg = s:palette.grey2
let s:visual_l2_bg = s:palette.bg3
let s:visual_r1_fg = s:palette.bg0
let s:visual_r1_bg = s:palette.statusline3
let s:visual_r2_fg = s:palette.grey2
let s:visual_r2_bg = s:palette.bg3
let s:visual_middle_fg = s:palette.grey1
let s:visual_middle_bg = s:palette.bg1

let s:replace_l1_fg = s:palette.bg0
let s:replace_l1_bg = s:palette.orange
let s:replace_l2_fg = s:palette.grey2
let s:replace_l2_bg = s:palette.bg3
let s:replace_r1_fg = s:palette.bg0
let s:replace_r1_bg = s:palette.orange
let s:replace_r2_fg = s:palette.grey2
let s:replace_r2_bg = s:palette.bg3
let s:replace_middle_fg = s:palette.grey1
let s:replace_middle_bg = s:palette.bg1

let s:command_l1_fg = s:palette.bg0
let s:command_l1_bg = s:palette.aqua
let s:command_l2_fg = s:palette.grey2
let s:command_l2_bg = s:palette.bg3
let s:command_r1_fg = s:palette.bg0
let s:command_r1_bg = s:palette.aqua
let s:command_r2_fg = s:palette.grey2
let s:command_r2_bg = s:palette.bg3
let s:command_middle_fg = s:palette.grey1
let s:command_middle_bg = s:palette.bg1

let s:terminal_l1_fg = s:palette.bg0
let s:terminal_l1_bg = s:palette.purple
let s:terminal_l2_fg = s:palette.grey2
let s:terminal_l2_bg = s:palette.bg3
let s:terminal_r1_fg = s:palette.bg0
let s:terminal_r1_bg = s:palette.purple
let s:terminal_r2_fg = s:palette.grey2
let s:terminal_r2_bg = s:palette.bg3
let s:terminal_middle_fg = s:palette.grey1
let s:terminal_middle_bg = s:palette.bg1

let s:inactive_l1_fg = s:palette.grey1
let s:inactive_l1_bg = s:palette.bg1
let s:inactive_l2_fg = s:palette.grey1
let s:inactive_l2_bg = s:palette.bg1
let s:inactive_r1_fg = s:palette.grey1
let s:inactive_r1_bg = s:palette.bg1
let s:inactive_r2_fg = s:palette.grey1
let s:inactive_r2_bg = s:palette.bg1
let s:inactive_middle_fg = s:palette.grey1
let s:inactive_middle_bg = s:palette.bg1
"}}}
" Implementation: {{{
let s:p = {'normal': {}, 'inactive': {}, 'insert': {}, 'replace': {}, 'visual': {}, 'command': {}, 'terminal': {}, 'tabline': {}}

let s:p.normal.middle = [ [ s:normal_middle_fg, s:normal_middle_bg ] ]
let s:p.normal.left = [ [ s:normal_l1_fg, s:normal_l1_bg, 'bold' ], [ s:normal_l2_fg, s:normal_l2_bg ] ]
let s:p.normal.right = [ [ s:normal_r1_fg, s:normal_r1_bg, 'bold' ], [ s:normal_r2_fg, s:normal_r2_bg ] ]

let s:p.insert.middle = [ [ s:insert_middle_fg, s:insert_middle_bg ] ]
let s:p.insert.left = [ [ s:insert_l1_fg, s:insert_l1_bg, 'bold' ], [ s:insert_l2_fg, s:insert_l2_bg ] ]
let s:p.insert.right = [ [ s:insert_r1_fg, s:insert_r1_bg, 'bold' ], [ s:insert_r2_fg, s:insert_r2_bg ] ]

let s:p.visual.middle = [ [ s:visual_middle_fg, s:visual_middle_bg ] ]
let s:p.visual.left = [ [ s:visual_l1_fg, s:visual_l1_bg, 'bold' ], [ s:visual_l2_fg, s:visual_l2_bg ] ]
let s:p.visual.right = [ [ s:visual_r1_fg, s:visual_r1_bg, 'bold' ], [ s:visual_r2_fg, s:visual_r2_bg ] ]

let s:p.replace.middle = [ [ s:replace_middle_fg, s:replace_middle_bg ] ]
let s:p.replace.left = [ [ s:replace_l1_fg, s:replace_l1_bg, 'bold' ], [ s:replace_l2_fg, s:replace_l2_bg ] ]
let s:p.replace.right = [ [ s:replace_r1_fg, s:replace_r1_bg, 'bold' ], [ s:replace_r2_fg, s:replace_r2_bg ] ]

let s:p.command.middle = [ [ s:command_middle_fg, s:command_middle_bg ] ]
let s:p.command.left = [ [ s:command_l1_fg, s:command_l1_bg, 'bold' ], [ s:command_l2_fg, s:command_l2_bg ] ]
let s:p.command.right = [ [ s:command_r1_fg, s:command_r1_bg, 'bold' ], [ s:command_r2_fg, s:command_r2_bg ] ]

let s:p.terminal.middle = [ [ s:terminal_middle_fg, s:terminal_middle_bg ] ]
let s:p.terminal.left = [ [ s:terminal_l1_fg, s:terminal_l1_bg, 'bold' ], [ s:terminal_l2_fg, s:terminal_l2_bg ] ]
let s:p.terminal.right = [ [ s:terminal_r1_fg, s:terminal_r1_bg, 'bold' ], [ s:terminal_r2_fg, s:terminal_r2_bg ] ]

let s:p.inactive.left = [ [ s:inactive_l1_fg, s:inactive_l1_bg ], [ s:inactive_l2_fg, s:inactive_l2_bg ] ]
let s:p.inactive.middle = [ [ s:inactive_middle_fg, s:inactive_middle_bg ] ]
let s:p.inactive.right = [ [ s:inactive_r1_fg, s:inactive_r1_bg ], [ s:inactive_r2_fg, s:inactive_r2_bg ] ]

let s:p.tabline.left = [ [ s:tab_l_fg, s:tab_l_bg] ]
let s:p.tabline.right = [ [ s:tab_r_fg, s:tab_r_bg] ]
let s:p.tabline.tabsel = [ [ s:tab_sel_fg, s:tab_sel_bg, 'bold' ] ]
let s:p.tabline.middle = [ [ s:tab_middle_fg, s:tab_middle_bg] ]

let s:p.normal.error = [ [ s:errorfg, s:errorbg ] ]
let s:p.normal.warning = [ [ s:warningfg, s:warningbg ] ]


if s:configuration.lightline_disable_bold
  let s:p.normal.left = [ [ s:normal_l1_fg, s:normal_l1_bg ], [ s:normal_l2_fg, s:normal_l2_bg ] ]
  let s:p.normal.right = [ [ s:normal_r1_fg, s:normal_r1_bg ], [ s:normal_r2_fg, s:normal_r2_bg ] ]
  let s:p.insert.left = [ [ s:insert_l1_fg, s:insert_l1_bg ], [ s:insert_l2_fg, s:insert_l2_bg ] ]
  let s:p.insert.right = [ [ s:insert_r1_fg, s:insert_r1_bg ], [ s:insert_r2_fg, s:insert_r2_bg ] ]
  let s:p.visual.left = [ [ s:visual_l1_fg, s:visual_l1_bg ], [ s:visual_l2_fg, s:visual_l2_bg ] ]
  let s:p.visual.right = [ [ s:visual_r1_fg, s:visual_r1_bg ], [ s:visual_r2_fg, s:visual_r2_bg ] ]
  let s:p.replace.left = [ [ s:replace_l1_fg, s:replace_l1_bg ], [ s:replace_l2_fg, s:replace_l2_bg ] ]
  let s:p.replace.right = [ [ s:replace_r1_fg, s:replace_r1_bg ], [ s:replace_r2_fg, s:replace_r2_bg ] ]
  let s:p.terminal.left = [ [ s:terminal_l1_fg, s:terminal_l1_bg ], [ s:terminal_l2_fg, s:terminal_l2_bg ] ]
  let s:p.terminal.right = [ [ s:terminal_r1_fg, s:terminal_r1_bg ], [ s:terminal_r2_fg, s:terminal_r2_bg ] ]
  let s:p.command.left = [ [ s:command_l1_fg, s:command_l1_bg ], [ s:command_l2_fg, s:command_l2_bg ] ]
  let s:p.command.right = [ [ s:command_r1_fg, s:command_r1_bg ], [ s:command_r2_fg, s:command_r2_bg ] ]
  let s:p.tabline.tabsel = [ [ s:tab_sel_fg, s:tab_sel_bg ] ]
endif

let g:lightline#colorscheme#everforest#palette = lightline#colorscheme#flatten(s:p)
"}}}

" vim: set sw=2 ts=2 sts=2 et tw=80 ft=vim fdm=marker fmr={{{,}}}:
