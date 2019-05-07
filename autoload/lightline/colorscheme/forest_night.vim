" =============================================================================
" URL: https://github.com/sainnhe/vim-color-forest-night/
" Filename: autoload/lightline/colorscheme/forest_night.vim
" Author: Sainnhepark
" Email: sainnhe@gmail.com
" License: MIT License & Anti-996 License
" =============================================================================

let s:p = {'normal': {}, 'inactive': {}, 'insert': {}, 'replace': {}, 'visual': {}, 'tabline': {} }

let s:p.normal.left = [[['#4c5866', 240], ['#a9dd9d', 110], 'bold'], [['#FFEBC3', 223], ['#556873', 242]]]
let s:p.normal.middle = [[['#FFEBC3', 223], ['#3c4c55', 239]]]
let s:p.normal.right = [[['#4c5866', 240], ['#a9dd9d', 110], 'bold'], [['#FFEBC3', 223], ['#556873', 242]]]
let s:p.normal.error = [[['#fd8489', 174], ['#556873', 242], 'bold']]
let s:p.normal.warning = [[['#fb8965', 216], ['#556873', 242], 'bold']]

let s:p.inactive.left = [[['#FFEBC3', 223], ['#556873', 242], 'bold'], [['#FFEBC3', 223], ['#556873', 242]]]
let s:p.inactive.middle = [[['#FFEBC3', 223], ['#3c4c55', 239]]]
let s:p.inactive.right = [[['#FFEBC3', 223], ['#556873', 242], 'bold'], [['#FFEBC3', 223], ['#556873', 242]]]

let s:p.insert.left = [[['#4c5866', 240], ['#FFEBC3', 150], 'bold'], [['#FFEBC3', 223], ['#556873', 242]]]
let s:p.insert.middle = [[['#FFEBC3', 223], ['#3c4c55', 239]]]
let s:p.insert.right = [[['#4c5866', 240], ['#a9dd9d', 150], 'bold'], [['#FFEBC3', 223], ['#556873', 242]]]

let s:p.replace.left = [[['#4c5866', 240], ['#a8d2eb', 104], 'bold'], [['#FFEBC3', 223], ['#556873', 242]]]
let s:p.replace.middle = [[['#FFEBC3', 223], ['#3c4c55', 239]]]
let s:p.replace.right = [[['#4c5866', 240], ['#a9dd9d', 104], 'bold'], [['#FFEBC3', 223], ['#556873', 242]]]

let s:p.visual.left = [[['#4c5866', 240], ['#fd8489', 186], 'bold'], [['#FFEBC3', 223], ['#556873', 242]]]
let s:p.visual.middle = [[['#FFEBC3', 223], ['#3c4c55', 239]]]
let s:p.visual.right = [[['#4c5866', 240], ['#a9dd9d', 186], 'bold'], [['#FFEBC3', 223], ['#556873', 242]]]

let s:p.tabline.left = [[['#FFEBC3', 223], ['#556873', 242]]]
let s:p.tabline.tabsel = [[['#4c5866', 240], ['#a9dd9d', 110], 'bold']]
let s:p.tabline.middle = [[['#FFEBC3', 223], ['#3c4c55', 239]]]
let s:p.tabline.right = [[['#FFEBC3', 223], ['#556873', 242], 'bold']]

let g:lightline#colorscheme#forest_night#palette = lightline#colorscheme#flatten(s:p)
