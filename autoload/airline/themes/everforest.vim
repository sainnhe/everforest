" =============================================================================
" URL: https://github.com/sainnhe/everforest
" Filename: autoload/airline/themes/everforest.vim
" Author: sainnhe
" Email: i@sainnhe.dev
" License: MIT License
" =============================================================================

" Initialization: {{{
let s:configuration = everforest#get_configuration()
let s:palette = everforest#get_palette(s:configuration.background, s:configuration.colors_override)
if s:configuration.transparent_background == 2
  let s:palette.bg1 = s:palette.none
endif
"}}}
" Definition: {{{
let s:accents = s:palette.statusline3

let s:error_fg = s:palette.bg0
let s:error_bg = s:palette.statusline3
let s:warning_fg = s:palette.bg0
let s:warning_bg = s:palette.yellow
let s:term_fg = s:palette.grey1
let s:term_bg = s:palette.bg1

let s:tab_fg = s:palette.grey2
let s:tab_bg = s:palette.bg3
let s:tab_sel_fg = s:palette.bg0
let s:tab_sel_bg = s:palette.statusline1
let s:tab_mid_fg = s:palette.grey1
let s:tab_mid_bg = s:palette.bg1
let s:tab_mod_fg = s:palette.bg0
let s:tab_mod_bg = s:palette.aqua
let s:tab_type_fg = s:palette.bg0
let s:tab_type_bg = s:palette.orange
let s:tab_label_fg = s:palette.grey2
let s:tab_label_bg = s:palette.bg3

let s:normal_side_fg = s:palette.bg0
let s:normal_side_bg = s:palette.statusline1
let s:normal_sub_fg = s:palette.grey2
let s:normal_sub_bg = s:palette.bg3
let s:normal_mid_fg = s:palette.grey1
let s:normal_mid_bg = s:palette.bg1
let s:normal_mod_fg = s:palette.green
let s:normal_mod_bg = s:palette.bg1

let s:insert_side_fg = s:palette.bg0
let s:insert_side_bg = s:palette.statusline2
let s:insert_sub_fg = s:palette.fg
let s:insert_sub_bg = s:palette.bg3
let s:insert_mid_fg = s:palette.fg
let s:insert_mid_bg = s:palette.bg1
let s:insert_mod_fg = s:palette.fg
let s:insert_mod_bg = s:palette.bg1

let s:visual_side_fg = s:palette.bg0
let s:visual_side_bg = s:palette.statusline3
let s:visual_sub_fg = s:palette.grey2
let s:visual_sub_bg = s:palette.bg3
let s:visual_mid_fg = s:palette.grey1
let s:visual_mid_bg = s:palette.bg1
let s:visual_mod_fg = s:palette.red
let s:visual_mod_bg = s:palette.bg1

let s:replace_side_fg = s:palette.bg0
let s:replace_side_bg = s:palette.orange
let s:replace_sub_fg = s:palette.grey2
let s:replace_sub_bg = s:palette.bg3
let s:replace_mid_fg = s:palette.grey1
let s:replace_mid_bg = s:palette.bg1
let s:replace_mod_fg = s:palette.orange
let s:replace_mod_bg = s:palette.bg1

let s:commandline_side_fg = s:palette.bg0
let s:commandline_side_bg = s:palette.aqua
let s:commandline_sub_fg = s:palette.grey2
let s:commandline_sub_bg = s:palette.bg3
let s:commandline_mid_fg = s:palette.grey1
let s:commandline_mid_bg = s:palette.bg1
let s:commandline_mod_fg = s:palette.aqua
let s:commandline_mod_bg = s:palette.bg1

let s:inactive_side_fg = s:palette.grey1
let s:inactive_side_bg = s:palette.bg1
let s:inactive_sub_fg = s:palette.grey1
let s:inactive_sub_bg = s:palette.bg1
let s:inactive_mid_fg = s:palette.grey1
let s:inactive_mid_bg = s:palette.bg1
let s:inactive_mod_fg = s:palette.grey1
let s:inactive_mod_bg = s:palette.bg1
"}}}
" Implementation: {{{
let g:airline#themes#everforest#palette = {}
let g:airline#themes#everforest#palette.accents = {
      \ 'red': [ s:accents[0] , '' , s:accents[1] , '' , '' ],
      \ }

" Normal mode
let s:N1 = [ s:normal_side_fg[0] , s:normal_side_bg[0] , s:normal_side_fg[1] , s:normal_side_bg[1] ]
let s:N2 = [ s:normal_sub_fg[0] , s:normal_sub_bg[0] , s:normal_sub_fg[1] , s:normal_sub_bg[1] ]
let s:N3 = [ s:normal_mid_fg[0] , s:normal_mid_bg[0] , s:normal_mid_fg[1] , s:normal_mid_bg[1] ]

let g:airline#themes#everforest#palette.normal = airline#themes#generate_color_map(s:N1, s:N2, s:N3)
let g:airline#themes#everforest#palette.normal.airline_error = [ s:error_fg[0] , s:error_bg[0] , s:error_fg[1] , s:error_bg[1] ]
let g:airline#themes#everforest#palette.normal.airline_warning = [ s:warning_fg[0] , s:warning_bg[0] , s:warning_fg[1] , s:warning_bg[1] ]
let g:airline#themes#everforest#palette.normal.airline_term = [ s:term_fg[0] , s:term_bg[0] , s:term_fg[1] , s:term_bg[1] ]
let g:airline#themes#everforest#palette.normal.airline_error_inactive = [ s:error_fg[0] , s:error_bg[0] , s:error_fg[1] , s:error_bg[1] ]
let g:airline#themes#everforest#palette.normal.airline_warning_inactive = [ s:warning_fg[0] , s:warning_bg[0] , s:warning_fg[1] , s:warning_bg[1] ]
let g:airline#themes#everforest#palette.normal.airline_error_red = [ s:error_fg[0] , s:error_bg[0] , s:error_fg[1] , s:error_bg[1] ]
let g:airline#themes#everforest#palette.normal.airline_warning_red = [ s:warning_fg[0] , s:warning_bg[0] , s:warning_fg[1] , s:warning_bg[1] ]
let g:airline#themes#everforest#palette.normal_modified = deepcopy(g:airline#themes#everforest#palette.normal)
let g:airline#themes#everforest#palette.normal_modified.airline_c = [ s:normal_mod_fg[0] , s:normal_mod_bg[0] , s:normal_mod_fg[1] , s:normal_mod_bg[1] ]

" Insert mode
let s:I1 = [ s:insert_side_fg[0] , s:insert_side_bg[0] , s:insert_side_fg[1] , s:insert_side_bg[1] ]
let s:I2 = [ s:insert_sub_fg[0] , s:insert_sub_bg[0] , s:insert_sub_fg[1] , s:insert_sub_bg[1] ]
let s:I3 = [ s:insert_mid_fg[0] , s:insert_mid_bg[0] , s:insert_mid_fg[1] , s:insert_mid_bg[1] ]

let g:airline#themes#everforest#palette.insert = airline#themes#generate_color_map(s:I1, s:I2, s:I3)
let g:airline#themes#everforest#palette.insert.airline_error = [ s:error_fg[0] , s:error_bg[0] , s:error_fg[1] , s:error_bg[1] ]
let g:airline#themes#everforest#palette.insert.airline_warning = [ s:warning_fg[0] , s:warning_bg[0] , s:warning_fg[1] , s:warning_bg[1] ]
let g:airline#themes#everforest#palette.insert.airline_term = [ s:term_fg[0] , s:term_bg[0] , s:term_fg[1] , s:term_bg[1] ]
let g:airline#themes#everforest#palette.insert.airline_error_inactive = [ s:error_fg[0] , s:error_bg[0] , s:error_fg[1] , s:error_bg[1] ]
let g:airline#themes#everforest#palette.insert.airline_warning_inactive = [ s:warning_fg[0] , s:warning_bg[0] , s:warning_fg[1] , s:warning_bg[1] ]
let g:airline#themes#everforest#palette.insert.airline_error_red = [ s:error_fg[0] , s:error_bg[0] , s:error_fg[1] , s:error_bg[1] ]
let g:airline#themes#everforest#palette.insert.airline_warning_red = [ s:warning_fg[0] , s:warning_bg[0] , s:warning_fg[1] , s:warning_bg[1] ]
let g:airline#themes#everforest#palette.insert_modified = deepcopy(g:airline#themes#everforest#palette.insert)
let g:airline#themes#everforest#palette.insert_modified.airline_c = [ s:insert_mod_fg[0] , s:insert_mod_bg[0] , s:insert_mod_fg[1] , s:insert_mod_bg[1] ]

" Replace mode
let s:R1 = [ s:replace_side_fg[0] , s:replace_side_bg[0] , s:replace_side_fg[1] , s:replace_side_bg[1] ]
let s:R2 = [ s:replace_sub_fg[0] , s:replace_sub_bg[0] , s:replace_sub_fg[1] , s:replace_sub_bg[1] ]
let s:R3 = [ s:replace_mid_fg[0] , s:replace_mid_bg[0] , s:replace_mid_fg[1] , s:replace_mid_bg[1] ]

let g:airline#themes#everforest#palette.replace = airline#themes#generate_color_map(s:R1, s:R2, s:R3)
let g:airline#themes#everforest#palette.replace.airline_error = [ s:error_fg[0] , s:error_bg[0] , s:error_fg[1] , s:error_bg[1] ]
let g:airline#themes#everforest#palette.replace.airline_warning = [ s:warning_fg[0] , s:warning_bg[0] , s:warning_fg[1] , s:warning_bg[1] ]
let g:airline#themes#everforest#palette.replace.airline_term = [ s:term_fg[0] , s:term_bg[0] , s:term_fg[1] , s:term_bg[1] ]
let g:airline#themes#everforest#palette.replace.airline_error_inactive = [ s:error_fg[0] , s:error_bg[0] , s:error_fg[1] , s:error_bg[1] ]
let g:airline#themes#everforest#palette.replace.airline_warning_inactive = [ s:warning_fg[0] , s:warning_bg[0] , s:warning_fg[1] , s:warning_bg[1] ]
let g:airline#themes#everforest#palette.replace.airline_error_red = [ s:error_fg[0] , s:error_bg[0] , s:error_fg[1] , s:error_bg[1] ]
let g:airline#themes#everforest#palette.replace.airline_warning_red = [ s:warning_fg[0] , s:warning_bg[0] , s:warning_fg[1] , s:warning_bg[1] ]
let g:airline#themes#everforest#palette.replace_modified = deepcopy(g:airline#themes#everforest#palette.replace)
let g:airline#themes#everforest#palette.replace_modified.airline_c = [ s:replace_mod_fg[0] , s:replace_mod_bg[0] , s:replace_mod_fg[1] , s:replace_mod_bg[1] ]

" Visual mode
let s:V1 = [ s:visual_side_fg[0] , s:visual_side_bg[0] , s:visual_side_fg[1] , s:visual_side_bg[1] ]
let s:V2 = [ s:visual_sub_fg[0] , s:visual_sub_bg[0] , s:visual_sub_fg[1] , s:visual_sub_bg[1] ]
let s:V3 = [ s:visual_mid_fg[0] , s:visual_mid_bg[0] , s:visual_mid_fg[1] , s:visual_mid_bg[1] ]

let g:airline#themes#everforest#palette.visual = airline#themes#generate_color_map(s:V1, s:V2, s:V3)
let g:airline#themes#everforest#palette.visual.airline_error = [ s:error_fg[0] , s:error_bg[0] , s:error_fg[1] , s:error_bg[1] ]
let g:airline#themes#everforest#palette.visual.airline_warning = [ s:warning_fg[0] , s:warning_bg[0] , s:warning_fg[1] , s:warning_bg[1] ]
let g:airline#themes#everforest#palette.visual.airline_term = [ s:term_fg[0] , s:term_bg[0] , s:term_fg[1] , s:term_bg[1] ]
let g:airline#themes#everforest#palette.visual.airline_error_inactive = [ s:error_fg[0] , s:error_bg[0] , s:error_fg[1] , s:error_bg[1] ]
let g:airline#themes#everforest#palette.visual.airline_warning_inactive = [ s:warning_fg[0] , s:warning_bg[0] , s:warning_fg[1] , s:warning_bg[1] ]
let g:airline#themes#everforest#palette.visual.airline_error_red = [ s:error_fg[0] , s:error_bg[0] , s:error_fg[1] , s:error_bg[1] ]
let g:airline#themes#everforest#palette.visual.airline_warning_red = [ s:warning_fg[0] , s:warning_bg[0] , s:warning_fg[1] , s:warning_bg[1] ]
let g:airline#themes#everforest#palette.visual_modified = deepcopy(g:airline#themes#everforest#palette.visual)
let g:airline#themes#everforest#palette.visual_modified.airline_c = [ s:visual_mod_fg[0] , s:visual_mod_bg[0] , s:visual_mod_fg[1] , s:visual_mod_bg[1] ]

" Command Line mode
let s:R1 = [ s:commandline_side_fg[0] , s:commandline_side_bg[0] , s:commandline_side_fg[1] , s:commandline_side_bg[1] ]
let s:R2 = [ s:commandline_sub_fg[0] , s:commandline_sub_bg[0] , s:commandline_sub_fg[1] , s:commandline_sub_bg[1] ]
let s:R3 = [ s:commandline_mid_fg[0] , s:commandline_mid_bg[0] , s:commandline_mid_fg[1] , s:commandline_mid_bg[1] ]

let g:airline#themes#everforest#palette.commandline = airline#themes#generate_color_map(s:R1, s:R2, s:R3)
let g:airline#themes#everforest#palette.commandline.airline_error = [ s:error_fg[0] , s:error_bg[0] , s:error_fg[1] , s:error_bg[1] ]
let g:airline#themes#everforest#palette.commandline.airline_warning = [ s:warning_fg[0] , s:warning_bg[0] , s:warning_fg[1] , s:warning_bg[1] ]
let g:airline#themes#everforest#palette.commandline.airline_term = [ s:term_fg[0] , s:term_bg[0] , s:term_fg[1] , s:term_bg[1] ]
let g:airline#themes#everforest#palette.commandline.airline_error_inactive = [ s:error_fg[0] , s:error_bg[0] , s:error_fg[1] , s:error_bg[1] ]
let g:airline#themes#everforest#palette.commandline.airline_warning_inactive = [ s:warning_fg[0] , s:warning_bg[0] , s:warning_fg[1] , s:warning_bg[1] ]
let g:airline#themes#everforest#palette.commandline.airline_error_red = [ s:error_fg[0] , s:error_bg[0] , s:error_fg[1] , s:error_bg[1] ]
let g:airline#themes#everforest#palette.commandline.airline_warning_red = [ s:warning_fg[0] , s:warning_bg[0] , s:warning_fg[1] , s:warning_bg[1] ]
let g:airline#themes#everforest#palette.commandline_modified = deepcopy(g:airline#themes#everforest#palette.commandline)
let g:airline#themes#everforest#palette.commandline_modified.airline_c = [ s:commandline_mod_fg[0] , s:commandline_mod_bg[0] , s:commandline_mod_fg[1] , s:commandline_mod_bg[1] ]

" Inactive
let s:IA1 = [ s:inactive_side_fg[0] , s:inactive_side_bg[0] , s:inactive_side_fg[1] , s:inactive_side_bg[1] ]
let s:IA2 = [ s:inactive_sub_fg[0] , s:inactive_sub_bg[0] , s:inactive_sub_fg[1] , s:inactive_sub_bg[1] ]
let s:IA3 = [ s:inactive_mid_fg[0] , s:inactive_mid_bg[0] , s:inactive_mid_fg[1] , s:inactive_mid_bg[1] ]

let g:airline#themes#everforest#palette.inactive = airline#themes#generate_color_map(s:IA1, s:IA2, s:IA3)
let g:airline#themes#everforest#palette.inactive.airline_term = [ s:inactive_mid_fg[0] , s:inactive_mid_bg[0] , s:inactive_mid_fg[1] , s:inactive_mid_bg[1] ]
let g:airline#themes#everforest#palette.inactive_modified = deepcopy(g:airline#themes#everforest#palette.inactive)
let g:airline#themes#everforest#palette.inactive_modified.airline_c = [ s:inactive_mod_fg[0] , s:inactive_mod_bg[0] , s:inactive_mod_fg[1] , s:inactive_mod_bg[1] ]

" TabLine
let g:airline#themes#everforest#palette.tabline = {}
let g:airline#themes#everforest#palette.tabline.airline_tab = [ s:tab_fg[0] , s:tab_bg[0] , s:tab_fg[1] , s:tab_bg[1] ]
let g:airline#themes#everforest#palette.tabline.airline_tab_right = [ s:tab_fg[0] , s:tab_bg[0] , s:tab_fg[1] , s:tab_bg[1] ]
let g:airline#themes#everforest#palette.tabline.airline_tabsel = [ s:tab_sel_fg[0] , s:tab_sel_bg[0] , s:tab_sel_fg[1] , s:tab_sel_bg[1] , 'bold' ]
let g:airline#themes#everforest#palette.tabline.airline_tabsel_right = [ s:tab_sel_fg[0] , s:tab_sel_bg[0] , s:tab_sel_fg[1] , s:tab_sel_bg[1] , 'bold' ]
let g:airline#themes#everforest#palette.tabline.airline_tabfill = [ s:tab_mid_fg[0] , s:tab_mid_bg[0] , s:tab_mid_fg[1] , s:tab_mid_bg[1] ]
let g:airline#themes#everforest#palette.tabline.airline_tabmod = [ s:tab_mod_fg[0] , s:tab_mod_bg[0] , s:tab_mod_fg[1] , s:tab_mod_bg[1] , 'bold' ]
let g:airline#themes#everforest#palette.tabline.airline_tabmod_right = [ s:tab_mod_fg[0] , s:tab_mod_bg[0] , s:tab_mod_fg[1] , s:tab_mod_bg[1] , 'bold' ]
let g:airline#themes#everforest#palette.tabline.airline_tabtype = [ s:tab_type_fg[0] , s:tab_type_bg[0] , s:tab_type_fg[1] , s:tab_type_bg[1] ]
let g:airline#themes#everforest#palette.tabline.airline_tablabel = [ s:tab_label_fg[0] , s:tab_label_bg[0] , s:tab_label_fg[1] , s:tab_label_bg[1] ]
let g:airline#themes#everforest#palette.tabline.airline_tablabel_right = [ s:tab_label_fg[0] , s:tab_label_bg[0] , s:tab_label_fg[1] , s:tab_label_bg[1] ]
let g:airline#themes#everforest#palette.tabline.airline_tabhid = s:IA1

highlight! link bufferline_selected airline_c
"}}}

" vim: set sw=2 ts=2 sts=2 et tw=80 ft=vim fdm=marker fmr={{{,}}}:
