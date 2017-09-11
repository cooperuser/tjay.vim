" Theme to mimic the default colorscheme of powerline
" Not 100% the same so it's powerline... ish.
"
" Differences from default powerline:
" * Paste indicator isn't colored different
" * Far right hand section matches the color of the mode indicator
"
" Differences from other airline themes:
" * No color differences when you're in a modified buffer
" * Visual mode only changes the mode section. Otherwise
"   it appears the same as normal mode

" Normal mode                                    " fg             & bg
let s:N1 = [ '#005f00' , '#afd700' , 22  , 148 ] " darkestgreen   & brightgreen
let s:N2 = [ '#9e9e9e' , '#585858' , 231 , 240 ] " gray8          & gray1
let s:N3 = [ '#ffffff' , '#121212' , 247 , 236 ] " white          & gray4
let s:N4 = [ '#080808' , '#d0d0d0' , 232 , 252 ] " gray3          & gray82

" Insert mode                                    " fg             & bg
let s:I1 = [ '#005f5f' , '#ffffff' , 23  , 231 ] " darkestcyan    & white
let s:I2 = [ '#5fafd7' , '#0087af' , 231 , 31  ] " white          & darkblue
let s:I3 = [ '#87d7ff' , '#005f87' , 117 , 24  ] " mediumcyan     & darkestblue
let s:I4 = [ '#ffffff' , '#afd7ff' , 24  , 117 ] " DeepSkyBlue4   & SkyBlue1

" Visual mode                                    " fg             & bg
let s:V1 = [ '#080808' , '#ffaf00' , 94 , 214 ] " gray3          & brightestorange

" Replace mode                                   " fg             & bg
let s:RE = [ '#ffffff' , '#d70000' , 231 , 160 ] " white          & brightred

let g:airline#themes#powerliner#palette = {}

let g:airline#themes#powerliner#palette.normal = airline#themes#generate_color_map(s:N1, s:N2, s:N3)
let g:airline#themes#powerliner#palette.normal.airline_z = [ s:N4[0] , s:N4[1] , s:N4[2] , s:N4[3] , '' ]

let g:airline#themes#powerliner#palette.insert = airline#themes#generate_color_map(s:I1, s:I2, s:I3)
let g:airline#themes#powerliner#palette.insert.airline_z = [ s:I4[0] , s:I4[1] , s:I4[2] , s:I4[3] , '' ]
let g:airline#themes#powerliner#palette.insert_replace = {
      \ 'airline_a': [ s:RE[0]   , s:I1[1]   , s:RE[1]   , s:I1[3]   , ''     ] }

let g:airline#themes#powerliner#palette.visual = {
      \ 'airline_a': [ s:V1[0]   , s:V1[1]   , s:V1[2]   , s:V1[3]   , ''     ] }

let g:airline#themes#powerliner#palette.replace = copy(airline#themes#powerliner#palette.normal)
let g:airline#themes#powerliner#palette.replace.airline_a = [ s:RE[0] , s:RE[1] , s:RE[2] , s:RE[3] , '' ]


let s:IA = [ s:N2[0] , s:N3[1] , s:N2[2] , s:N3[3] , '' ]
let g:airline#themes#powerliner#palette.inactive = airline#themes#generate_color_map(s:IA, s:IA, s:IA)

