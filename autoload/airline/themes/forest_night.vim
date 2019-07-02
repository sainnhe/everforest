let g:airline#themes#forest_night#palette = {}
let g:airline#themes#forest_night#palette.accents = {
      \ 'red': [ '#fd8489' , '' , 174 , '' , '' ],
      \ }

" Normal mode
let s:N1 = [ '#3c4c55' , '#a9dd9d' , 239 , 150 ] " mode
let s:N2 = [ '#f6e3bc' , '#616c72' , 223 , 244 ] " info
let s:N3 = [ '#f6e3bc' , '#3c4c55' , 223 , 239 ] " statusline

let g:airline#themes#forest_night#palette.normal = airline#themes#generate_color_map(s:N1, s:N2, s:N3)
let g:airline#themes#forest_night#palette.normal_modified = {
      \ 'airline_c': [ '#3c4c55' , '#a9dd9d' , 239 , 150 , '' ] ,
      \ }

" Insert mode
let s:I1 = [ '#3c4c55' , '#f6e3bc' , 239 , 223 ]
let s:I2 = [ '#f6e3bc' , '#4c5866' , 223 , 241 ]
let s:I3 = [ '#f6e3bc' , '#3c4c55' , 223 , 239 ]

let g:airline#themes#forest_night#palette.insert = airline#themes#generate_color_map(s:I1, s:I2, s:I3)
let g:airline#themes#forest_night#palette.insert_modified = {
      \ 'airline_c': [ '#3c4c55' , '#f6e3bc' , 239 , 223 , '' ] ,
      \ }

" Replace mode
let s:R1 = [ '#3c4c55' , '#fb8965' , 239 , 216 ]
let s:R2 = [ '#f6e3bc' , '#616c72' , 223 , 244 ]
let s:R3 = [ '#f6e3bc' , '#3c4c55' , 223 , 239 ]

let g:airline#themes#forest_night#palette.replace = airline#themes#generate_color_map(s:R1, s:R2, s:R3)
let g:airline#themes#forest_night#palette.replace_modified = {
      \ 'airline_c': [ '#3c4c55' , '#fb8965' , 239 , 216 , '' ] ,
      \ }

" Visual mode
let s:V1 = [ '#3c4c55' , '#fd8489' , 239 , 174 ]
let s:V2 = [ '#f6e3bc' , '#616c72' , 223 , 244 ]
let s:V3 = [ '#f6e3bc' , '#3c4c55' , 223 , 239 ]

let g:airline#themes#forest_night#palette.visual = airline#themes#generate_color_map(s:V1, s:V2, s:V3)
let g:airline#themes#forest_night#palette.visual_modified = {
      \ 'airline_c': [ '#3c4c55' , '#fd8489' , 239 , 174 , '' ] ,
      \ }

" Inactive
let s:IA = [ '#f6e3bc' , '#4c5866' , 223 , 241 , '' ]
let g:airline#themes#forest_night#palette.inactive = airline#themes#generate_color_map(s:IA, s:IA, s:IA)
let g:airline#themes#forest_night#palette.inactive_modified = {
      \ 'airline_c': [ '#f6e3bc' , '#4c5866' , 223 , 241  , '' ] ,
      \ }

