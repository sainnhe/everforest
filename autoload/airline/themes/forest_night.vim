" =============================================================================
" URL: https://github.com/sainnhe/vim-color-forest-night
" Filename: autoload/airline/themes/forest_night.vim
" Author: Sainnhepark
" Email: sainnhe@gmail.com
" License: MIT License
" =============================================================================

"{{{Palette
let s:p = {'normal': {}, 'inactive': {}, 'insert': {}, 'replace': {}, 'visual': {}, 'tabline': {}}

let s:dark      = [ '#323d43', 235 ]
let s:darker    = [ '#3c474d', 236 ]
let s:darkgrey  = [ '#576268', 240 ]
let s:red       = [ '#e3888a', 167 ]
let s:green     = [ '#a7bf81', 142 ]
let s:orange    = [ '#e3a184', 208 ]
let s:white     = [ '#d8cbb2', 223 ]
let s:red_fg    = [ '#e3888a', 167 ]
let s:blue_fg   = [ '#91bebb', 109 ]
"}}}

"{{{Definition
let s:accents = s:red_fg

let s:normal_side_fg = s:dark
let s:normal_side_bg = s:green
let s:normal_sub_fg = s:white
let s:normal_sub_bg = s:darkgrey
let s:normal_mid_fg = s:white
let s:normal_mid_bg = s:darker
let s:normal_mod_fg = s:blue_fg
let s:normal_mod_bg = s:darker

let s:insert_side_fg = s:dark
let s:insert_side_bg = s:green
let s:insert_sub_fg = s:white
let s:insert_sub_bg = s:darkgrey
let s:insert_mid_fg = s:white
let s:insert_mid_bg = s:darker
let s:insert_mod_fg = s:blue_fg
let s:insert_mod_bg = s:darker

let s:visual_side_fg = s:dark
let s:visual_side_bg = s:red
let s:visual_sub_fg = s:white
let s:visual_sub_bg = s:darkgrey
let s:visual_mid_fg = s:white
let s:visual_mid_bg = s:darker
let s:visual_mod_fg = s:blue_fg
let s:visual_mod_bg = s:darker

let s:replace_side_fg = s:dark
let s:replace_side_bg = s:orange
let s:replace_sub_fg = s:white
let s:replace_sub_bg = s:darkgrey
let s:replace_mid_fg = s:white
let s:replace_mid_bg = s:darker
let s:replace_mod_fg = s:blue_fg
let s:replace_mod_bg = s:darker

let s:inactive_side_fg = s:white
let s:inactive_side_bg = s:darkgrey
let s:inactive_sub_fg = s:white
let s:inactive_sub_bg = s:darkgrey
let s:inactive_mid_fg = s:white
let s:inactive_mid_bg = s:darker
let s:inactive_mod_fg = s:white
let s:inactive_mod_bg = s:darker
"}}}

"{{{Implementation
let g:airline#themes#forest_night#palette = {}
let g:airline#themes#forest_night#palette.accents = {
            \ 'red': [ s:accents[0] , '' , s:accents[1] , '' , '' ],
            \ }

" Normal mode
let s:N1 = [ s:normal_side_fg[0] , s:normal_side_bg[0] , s:normal_side_fg[1] , s:normal_side_bg[1] ]
let s:N2 = [ s:normal_sub_fg[0] , s:normal_sub_bg[0] , s:normal_sub_fg[1] , s:normal_sub_bg[1] ]
let s:N3 = [ s:normal_mid_fg[0] , s:normal_mid_bg[0] , s:normal_mid_fg[1] , s:normal_mid_bg[1] ]

let g:airline#themes#forest_night#palette.normal = airline#themes#generate_color_map(s:N1, s:N2, s:N3)
let g:airline#themes#forest_night#palette.normal_modified = {
            \ 'airline_c': [ s:normal_mod_fg[0] , s:normal_mod_bg[0] , s:normal_mod_fg[1] , s:normal_mod_bg[1] ] ,
            \ }

" Insert mode
let s:I1 = [ s:insert_side_fg[0] , s:insert_side_bg[0] , s:insert_side_fg[1] , s:insert_side_bg[1] ]
let s:I2 = [ s:insert_sub_fg[0] , s:insert_sub_bg[0] , s:insert_sub_fg[1] , s:insert_sub_bg[1] ]
let s:I3 = [ s:insert_mid_fg[0] , s:insert_mid_bg[0] , s:insert_mid_fg[1] , s:insert_mid_bg[1] ]

let g:airline#themes#forest_night#palette.insert = airline#themes#generate_color_map(s:I1, s:I2, s:I3)
let g:airline#themes#forest_night#palette.insert_modified = {
            \ 'airline_c': [ s:insert_mod_fg[0] , s:insert_mod_bg[0] , s:insert_mod_fg[1] , s:insert_mod_bg[1] ] ,
            \ }

" Replace mode
let s:R1 = [ s:replace_side_fg[0] , s:replace_side_bg[0] , s:replace_side_fg[1] , s:replace_side_bg[1] ]
let s:R2 = [ s:replace_sub_fg[0] , s:replace_sub_bg[0] , s:replace_sub_fg[1] , s:replace_sub_bg[1] ]
let s:R3 = [ s:replace_mid_fg[0] , s:replace_mid_bg[0] , s:replace_mid_fg[1] , s:replace_mid_bg[1] ]

let g:airline#themes#forest_night#palette.replace = airline#themes#generate_color_map(s:R1, s:R2, s:R3)
let g:airline#themes#forest_night#palette.replace_modified = {
            \ 'airline_c': [ s:replace_mod_fg[0] , s:replace_mod_bg[0] , s:replace_mod_fg[1] , s:replace_mod_bg[1] ] ,
            \ }

" Visual mode
let s:V1 = [ s:visual_side_fg[0] , s:visual_side_bg[0] , s:visual_side_fg[1] , s:visual_side_bg[1] ]
let s:V2 = [ s:visual_sub_fg[0] , s:visual_sub_bg[0] , s:visual_sub_fg[1] , s:visual_sub_bg[1] ]
let s:V3 = [ s:visual_mid_fg[0] , s:visual_mid_bg[0] , s:visual_mid_fg[1] , s:visual_mid_bg[1] ]

let g:airline#themes#forest_night#palette.visual = airline#themes#generate_color_map(s:V1, s:V2, s:V3)
let g:airline#themes#forest_night#palette.visual_modified = {
            \ 'airline_c': [ s:visual_mod_fg[0] , s:visual_mod_bg[0] , s:visual_mod_fg[1] , s:visual_mod_bg[1] ] ,
            \ }

" Inactive
let s:IA1 = [ s:inactive_side_fg[0] , s:inactive_side_bg[0] , s:inactive_side_fg[1] , s:inactive_side_bg[1] ]
let s:IA2 = [ s:inactive_sub_fg[0] , s:inactive_sub_bg[0] , s:inactive_sub_fg[1] , s:inactive_sub_bg[1] ]
let s:IA3 = [ s:inactive_mid_fg[0] , s:inactive_mid_bg[0] , s:inactive_mid_fg[1] , s:inactive_mid_bg[1] ]

let g:airline#themes#forest_night#palette.inactive = airline#themes#generate_color_map(s:IA1, s:IA2, s:IA3)
let g:airline#themes#forest_night#palette.inactive_modified = {
            \ 'airline_c': [ s:inactive_mod_fg[0] , s:inactive_mod_bg[0] , s:inactive_mod_fg[1] , s:inactive_mod_bg[1] ] ,
            \ }
"}}}

