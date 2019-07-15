let g:airline#themes#forest_dusk#palette = {}
let g:airline#themes#forest_dusk#palette.accents = {
      \ 'red': [ '#fc796b' , '' , 174 , '' , '' ],
      \ }

" Normal mode
let s:N1 = [ '#3c4542' , '#a8cb79' , 239 , 150 ] " mode
let s:N2 = [ '#fdd89a' , '#606357' , 223 , 244 ] " info
let s:N3 = [ '#fdd89a' , '#3c4542' , 223 , 239 ] " statusline

let g:airline#themes#forest_dusk#palette.normal = airline#themes#generate_color_map(s:N1, s:N2, s:N3)
let g:airline#themes#forest_dusk#palette.normal_modified = {
      \ 'airline_c': [ '#3c4542' , '#a8cb79' , 239 , 150 , '' ] ,
      \ }

" Insert mode
let s:I1 = [ '#3c4542' , '#fdd89a' , 239 , 223 ]
let s:I2 = [ '#fdd89a' , '#4b514f' , 223 , 241 ]
let s:I3 = [ '#fdd89a' , '#3c4542' , 223 , 239 ]

let g:airline#themes#forest_dusk#palette.insert = airline#themes#generate_color_map(s:I1, s:I2, s:I3)
let g:airline#themes#forest_dusk#palette.insert_modified = {
      \ 'airline_c': [ '#3c4542' , '#fdd89a' , 239 , 223 , '' ] ,
      \ }

" Replace mode
let s:R1 = [ '#3c4542' , '#fb8965' , 239 , 216 ]
let s:R2 = [ '#fdd89a' , '#606357' , 223 , 244 ]
let s:R3 = [ '#fdd89a' , '#3c4542' , 223 , 239 ]

let g:airline#themes#forest_dusk#palette.replace = airline#themes#generate_color_map(s:R1, s:R2, s:R3)
let g:airline#themes#forest_dusk#palette.replace_modified = {
      \ 'airline_c': [ '#3c4542' , '#fb8965' , 239 , 216 , '' ] ,
      \ }

" Visual mode
let s:V1 = [ '#3c4542' , '#fc796b' , 239 , 174 ]
let s:V2 = [ '#fdd89a' , '#606357' , 223 , 244 ]
let s:V3 = [ '#fdd89a' , '#3c4542' , 223 , 239 ]

let g:airline#themes#forest_dusk#palette.visual = airline#themes#generate_color_map(s:V1, s:V2, s:V3)
let g:airline#themes#forest_dusk#palette.visual_modified = {
      \ 'airline_c': [ '#3c4542' , '#fc796b' , 239 , 174 , '' ] ,
      \ }

" Inactive
let s:IA = [ '#fdd89a' , '#4b514f' , 223 , 241 , '' ]
let g:airline#themes#forest_dusk#palette.inactive = airline#themes#generate_color_map(s:IA, s:IA, s:IA)
let g:airline#themes#forest_dusk#palette.inactive_modified = {
      \ 'airline_c': [ '#fdd89a' , '#4b514f' , 223 , 241  , '' ] ,
      \ }

