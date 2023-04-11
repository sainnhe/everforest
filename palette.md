# Color Palette and Highlighting Semantics

## Contents

1. [Palette Variants](#palette-variants)
   * [Dark](#dark)
   * [Light](#light)
1. [Highlights](#highlights)

## Palette Variants

The color scheme contains two major color palettes: `dark` and `light`.

Each color palette is composed of two sub-palettes: `palette1` for background colors, and `palette2` for foreground
colors.

Background colors come in three flavours based on their contrast: `hard`, `medium` (default) and `low`.

The semantics of each color in the context of syntax highlighting is described in [Highlights](#highlights).

### Dark

#### Background Colors (palette1)

<sub>hard</sub>  
![#1E2326][1E2326]![#272E33][272E33]![#2E383C][2E383C]![#374145][374145]![#414B50][414B50]![#495156][495156]![#4F5B58][4F5B58]  
![#4C3743][4C3743]![#493B40][493B40]![#3C4841][3C4841]![#384B55][384B55]![#45443c][45443c]  
<sub>medium</sub>  
![#232A2E][232A2E]![#2D353B][2D353B]![#343F44][343F44]![#3D484D][3D484D]![#475258][475258]![#4F585E][4F585E]![#56635f][56635f]  
![#543A48][543A48]![#514045][514045]![#425047][425047]![#3A515D][3A515D]![#4D4C43][4D4C43]  
<sub>low</sub>  
![#293136][293136]![#333C43][333C43]![#3A464C][3A464C]![#434F55][434F55]![#4D5960][4D5960]![#555F66][555F66]![#5D6B66][5D6B66]  
![#5C3F4F][5C3F4F]![#59464C][59464C]![#48584E][48584E]![#3F5865][3F5865]![#55544A][55544A]

#### Foreground Colors (palette2)

<sub>default</sub>  
![#D3C6AA][D3C6AA]  
<sub>accents</sub>  
![#E67E80][E67E80]![#E69875][E69875]![#DBBC7F][DBBC7F]![#A7C080][A7C080]![#83C092][83C092]![#7FBBB3][7FBBB3]![#D699B6][D699B6]  
<sub>greys</sub>  
![#7A8478][7A8478]![#859289][859289]![#9DA9A0][9DA9A0]  
<sub>statusline</sub>  
![#A7C080][A7C080]![#D3C6AA][D3C6AA]![#E67E80][E67E80]

### Light

#### Background Colors (palette1)

<sub>hard</sub>  
![#F2EFDF][F2EFDF]![#FFFBEF][FFFBEF]![#F8F5E4][F8F5E4]![#F2EFDF][F2EFDF]![#EDEADA][EDEADA]![#E8E5D5][E8E5D5]![#BEC5B2][BEC5B2]  
![#F0F2D4][F0F2D4]![#FFE7DE][FFE7DE]![#F3F5D9][F3F5D9]![#ECF5ED][ECF5ED]![#FEF2D5][FEF2D5]  
<sub>medium</sub>  
![#EFEBD4][EFEBD4]![#FDF6E3][FDF6E3]![#F4F0D9][F4F0D9]![#EFEBD4][EFEBD4]![#E6E2CC][E6E2CC]![#E0DCC7][E0DCC7]![#BDC3AF][BDC3AF]  
![#EAEDC8][EAEDC8]![#FBE3DA][FBE3DA]![#F0F1D2][F0F1D2]![#E9F0E9][E9F0E9]![#FAEDCD][FAEDCD]  
<sub>low</sub>  
![#E5DFC5][E5DFC5]![#F3EAD3][F3EAD3]![#EAE4CA][EAE4CA]![#E5DFC5][E5DFC5]![#DDD8BE][DDD8BE]![#D8D3BA][D8D3BA]![#B9C0AB][B9C0AB]  
![#E1E4BD][E1E4BD]![#F4DBD0][F4DBD0]![#E5E6C5][E5E6C5]![#E1E7DD][E1E7DD]![#F1E4C5][F1E4C5]

#### Foreground Colors (palette2)

<sub>default</sub>  
![#5C6A72][5C6A72]  
<sub>accents</sub>  
![#F85552][F85552]![#F57D26][F57D26]![#DFA000][DFA000]![#8DA101][8DA101]![#35A77C][35A77C]![#3A94C5][3A94C5]![#DF69BA][DF69BA]  
<sub>greys</sub>  
![#A6B0A0][A6B0A0]![#939F91][939F91]![#829181][829181]  
<sub>statusline</sub>  
![#93B259][93B259]![#708089][708089]![#E66868][E66868]

## Highlights

The color values in the table below correspond to the **dark** variant of the color scheme with the default **medium**
contrast. The semantics of color identifiers, however, apply uniformly to all [Palette Variants](#palette-variants) and
contrast settings.

|                    | Hex     | Identifier    | Usages                                                                                                                    |
|--------------------|---------|---------------|---------------------------------------------------------------------------------------------------------------------------|
| ![#232A2E][hl_bgd] | #232A2E | `bg_dim`      | Dimmed Background                                                                                                         |
| ![#2D353B][hl_bg0] | #2D353B | `bg0`         | Default Background, Line Numbers Background, Signs Background, Status Line Background (inactive), Tab Line Label (active) |
| ![#343F44][hl_bg1] | #343F44 | `bg1`         | Cursor Line Background, Color Columns, Closed Folds Background, Status Line Background (active), Tab Line Background      |
| ![#3D484D][hl_bg2] | #3D484D | `bg2`         | Popup Menu Background, Floating Window Background, Window Toolbar Background                                              |
| ![#475258][hl_bg3] | #475258 | `bg3`         | List Chars, Special Keys, Tab Line Label Background (inactive)                                                            |
| ![#4F585E][hl_bg4] | #4F585E | `bg4`         | Window Splits Separators, Whitespaces, Breaks                                                                             |
| ![#56635f][hl_bg5] | #56635f | `bg5`         | _Not currently used_                                                                                                      |
| ![#543A48][hl_bgv] | #543A48 | `bg_visual`   | Visual Selection                                                                                                          |
| ![#514045][hl_bgr] | #514045 | `bg_red`      | Diff Deleted Line Background, Error Highlights                                                                            |
| ![#425047][hl_bgg] | #425047 | `bg_green`    | Diff Added Line Background, Hint Highlights                                                                               |
| ![#3A515D][hl_bgb] | #3A515D | `bg_blue`     | Diff Changed Line Background, Info Highlights                                                                             |
| ![#4D4C43][hl_bgy] | #4D4C43 | `bg_yellow`   | Warning Highlights                                                                                                        |
| ![#D3C6AA][hl_fg]  | #D3C6AA | `fg`          | Default Foreground, Signs, [_Treesitter_: Constants, Variables, Function Parameters, Properties, Symbol Identifiers]      |
| ![#E67E80][hl_red] | #E67E80 | `red`         | Conditional Keywords, Loop Keywords, Exception Keywords, Inclusion Keywords, Uncategorised Keywords, Diff Deleted Signs, Error Messages, Error Signs |
| ![#E69875][hl_ora] | #E69875 | `orange`      | Operator Keywords, Operators, Labels, Storage Classes, Composite Types, Enumerated Types, Tags, Debugging Statements      |
| ![#DBBC7F][hl_yel] | #DBBC7F | `yellow`      | Types, Special Characters, Warning Messages, Warning Signs, [_Treesitter_: Modules, Namespaces]                           |
| ![#A7C080][hl_gre] | #A7C080 | `green`       | Function Names, Method Names, Strings, Characters, Hint Messages, Hint Signs, Search Highlights, [_Treesitter_: Constructors, Function Calls, Built-In Functions, Macro Functions, String Escapes, Regex Literals, Tag Delimiters, Non-Structured Text] |
| ![#83C092][hl_aqu] | #83C092 | `aqua`        | Constants, Macros, [_Treesitter_: Strings, Characters]                                                                    |
| ![#7FBBB3][hl_blu] | #7FBBB3 | `blue`        | Identifiers, Uncategorised Special Symbols, Diff Changed Text Background, Info Messages, Info Signs, [_Treesitter_: Fields, Special Punctuation, Math Environments] |
| ![#D699B6][hl_pur] | #D699B6 | `purple`      | Booleans, Numbers, Preprocessors, [_Treesitter_: Built-In Constants, Built-In Variables, Macro-Defined Constants, Attributes/Annotations]                                                  |
| ![#7A8478][hl_gr0] | #7A8478 | `grey0`       | Line Numbers, Fold Columns, Concealed Text, Foreground UI Elements                                                        |
| ![#859289][hl_gr1] | #859289 | `grey1`       | Comments, Punctuation Delimiters, Closed Folds, Ignored/Disabled, UI Borders, Status Line Text                            |
| ![#9DA9A0][hl_gr2] | #9DA9A0 | `grey2`       | Cursor Line Number, Tab Line Label (inactive)                                                                             |
| ![#A7C080][hl_st1] | #A7C080 | `statusline1` | Menu Selection Background, Tab Line Label Background (active), Status Line Mode Indicator                                 |
| ![#D3C6AA][hl_st2] | #D3C6AA | `statusline2` | Status Line Mode Indicator                                                                                                |
| ![#E67E80][hl_st3] | #E67E80 | `statusline3` | Status Line Mode Indicator                                                                                                |


<!-- dark hard palette1 -->
[1E2326]: https://fakeimg.pl/96/1E2326/D3C6AA/?text=%231E2326&font=noto&font_size=12 "bg_dim - #1E2326"
[272E33]: https://fakeimg.pl/96/272E33/D3C6AA/?text=%23272E33&font=noto&font_size=12 "bg0 - #272E33"
[2E383C]: https://fakeimg.pl/96/2E383C/D3C6AA/?text=%232E383C&font=noto&font_size=12 "bg1 - #2E383C"
[374145]: https://fakeimg.pl/96/374145/D3C6AA/?text=%23374145&font=noto&font_size=12 "bg2 - #374145"
[414B50]: https://fakeimg.pl/96/414B50/D3C6AA/?text=%23414B50&font=noto&font_size=12 "bg3 - #414B50"
[495156]: https://fakeimg.pl/96/495156/D3C6AA/?text=%23495156&font=noto&font_size=12 "bg4 - #495156"
[4F5B58]: https://fakeimg.pl/96/4F5B58/D3C6AA/?text=%234F5B58&font=noto&font_size=12 "bg5 - #4F5B58"
[4C3743]: https://fakeimg.pl/96/4C3743/D3C6AA/?text=%234C3743&font=noto&font_size=12 "bg_visual - #4C3743"
[493B40]: https://fakeimg.pl/96/493B40/D3C6AA/?text=%23493B40&font=noto&font_size=12 "bg_reg - #493B40"
[3C4841]: https://fakeimg.pl/96/3C4841/D3C6AA/?text=%233C4841&font=noto&font_size=12 "bg_green - #3C4841"
[384B55]: https://fakeimg.pl/96/384B55/D3C6AA/?text=%23384B55&font=noto&font_size=12 "bg_blue - #384B55"
[45443c]: https://fakeimg.pl/96/45443c/D3C6AA/?text=%2345443c&font=noto&font_size=12 "bg_yellow - #45443c"

<!-- dark medium palette1 -->
[232A2E]: https://fakeimg.pl/96/232A2E/D3C6AA/?text=%23232A2E&font=noto&font_size=12 "bg_dim - #232A2E"
[2D353B]: https://fakeimg.pl/96/2D353B/D3C6AA/?text=%232D353B&font=noto&font_size=12 "bg0 - #2D353B"
[343F44]: https://fakeimg.pl/96/343F44/D3C6AA/?text=%23343F44&font=noto&font_size=12 "bg1 - #343F44"
[3D484D]: https://fakeimg.pl/96/3D484D/D3C6AA/?text=%233D484D&font=noto&font_size=12 "bg2 - #3D484D"
[475258]: https://fakeimg.pl/96/475258/D3C6AA/?text=%23475258&font=noto&font_size=12 "bg3 - #475258"
[4F585E]: https://fakeimg.pl/96/4F585E/D3C6AA/?text=%234F585E&font=noto&font_size=12 "bg4 - #4F585E"
[56635f]: https://fakeimg.pl/96/56635f/D3C6AA/?text=%2356635f&font=noto&font_size=12 "bg5 - #56635f"
[543A48]: https://fakeimg.pl/96/543A48/D3C6AA/?text=%23543A48&font=noto&font_size=12 "bg_visual - #543A48"
[514045]: https://fakeimg.pl/96/514045/D3C6AA/?text=%23514045&font=noto&font_size=12 "bg_reg - #514045"
[425047]: https://fakeimg.pl/96/425047/D3C6AA/?text=%23425047&font=noto&font_size=12 "bg_green - #425047"
[3A515D]: https://fakeimg.pl/96/3A515D/D3C6AA/?text=%233A515D&font=noto&font_size=12 "bg_blue - #3A515D"
[4D4C43]: https://fakeimg.pl/96/4D4C43/D3C6AA/?text=%234D4C43&font=noto&font_size=12 "bg_yellow - #4D4C43"

<!-- dark low palette1 -->
[293136]: https://fakeimg.pl/96/293136/D3C6AA/?text=%23293136&font=noto&font_size=12 "bg_dim - #293136"
[333C43]: https://fakeimg.pl/96/333C43/D3C6AA/?text=%23333C43&font=noto&font_size=12 "bg0 - #333C43"
[3A464C]: https://fakeimg.pl/96/3A464C/D3C6AA/?text=%233A464C&font=noto&font_size=12 "bg1 - #3A464C"
[434F55]: https://fakeimg.pl/96/434F55/D3C6AA/?text=%23434F55&font=noto&font_size=12 "bg2 - #434F55"
[4D5960]: https://fakeimg.pl/96/4D5960/D3C6AA/?text=%234D5960&font=noto&font_size=12 "bg3 - #4D5960"
[555F66]: https://fakeimg.pl/96/555F66/D3C6AA/?text=%23555F66&font=noto&font_size=12 "bg4 - #555F66"
[5D6B66]: https://fakeimg.pl/96/5D6B66/D3C6AA/?text=%235D6B66&font=noto&font_size=12 "bg5 - #5D6B66"
[5C3F4F]: https://fakeimg.pl/96/5C3F4F/D3C6AA/?text=%235C3F4F&font=noto&font_size=12 "bg_visual - #5C3F4F"
[59464C]: https://fakeimg.pl/96/59464C/D3C6AA/?text=%2359464C&font=noto&font_size=12 "bg_reg - #59464C"
[48584E]: https://fakeimg.pl/96/48584E/D3C6AA/?text=%2348584E&font=noto&font_size=12 "bg_green - #48584E"
[3F5865]: https://fakeimg.pl/96/3F5865/D3C6AA/?text=%233F5865&font=noto&font_size=12 "bg_blue - #3F5865"
[55544A]: https://fakeimg.pl/96/55544A/D3C6AA/?text=%2355544A&font=noto&font_size=12 "bg_yellow - #55544A"

<!-- light hard palette1 -->
[F2EFDF]: https://fakeimg.pl/96/F2EFDF/5C6A72/?text=%23F2EFDF&font=noto&font_size=12 "bg_dim/bg2 - #F2EFDF"
[FFFBEF]: https://fakeimg.pl/96/FFFBEF/5C6A72/?text=%23FFFBEF&font=noto&font_size=12 "bg0 - #FFFBEF"
[F8F5E4]: https://fakeimg.pl/96/F8F5E4/5C6A72/?text=%23F8F5E4&font=noto&font_size=12 "bg1 - #F8F5E4"
[EDEADA]: https://fakeimg.pl/96/EDEADA/5C6A72/?text=%23EDEADA&font=noto&font_size=12 "bg3 - #EDEADA"
[E8E5D5]: https://fakeimg.pl/96/E8E5D5/5C6A72/?text=%23E8E5D5&font=noto&font_size=12 "bg4 - #E8E5D5"
[BEC5B2]: https://fakeimg.pl/96/BEC5B2/5C6A72/?text=%23BEC5B2&font=noto&font_size=12 "bg5 - #BEC5B2"
[F0F2D4]: https://fakeimg.pl/96/F0F2D4/5C6A72/?text=%23F0F2D4&font=noto&font_size=12 "bg_visual - #F0F2D4"
[FFE7DE]: https://fakeimg.pl/96/FFE7DE/5C6A72/?text=%23FFE7DE&font=noto&font_size=12 "bg_reg - #FFE7DE"
[F3F5D9]: https://fakeimg.pl/96/F3F5D9/5C6A72/?text=%23F3F5D9&font=noto&font_size=12 "bg_green - #F3F5D9"
[ECF5ED]: https://fakeimg.pl/96/ECF5ED/5C6A72/?text=%23ECF5ED&font=noto&font_size=12 "bg_blue - #ECF5ED"
[FEF2D5]: https://fakeimg.pl/96/FEF2D5/5C6A72/?text=%23FEF2D5&font=noto&font_size=12 "bg_yellow - #FEF2D5"

<!-- light medium palette1 -->
[EFEBD4]: https://fakeimg.pl/96/EFEBD4/5C6A72/?text=%23EFEBD4&font=noto&font_size=12 "bg_dim/bg2 - #EFEBD4"
[FDF6E3]: https://fakeimg.pl/96/FDF6E3/5C6A72/?text=%23FDF6E3&font=noto&font_size=12 "bg0 - #FDF6E3"
[F4F0D9]: https://fakeimg.pl/96/F4F0D9/5C6A72/?text=%23F4F0D9&font=noto&font_size=12 "bg1 - #F4F0D9"
[E6E2CC]: https://fakeimg.pl/96/E6E2CC/5C6A72/?text=%23E6E2CC&font=noto&font_size=12 "bg3 - #E6E2CC"
[E0DCC7]: https://fakeimg.pl/96/E0DCC7/5C6A72/?text=%23E0DCC7&font=noto&font_size=12 "bg4 - #E0DCC7"
[BDC3AF]: https://fakeimg.pl/96/BDC3AF/5C6A72/?text=%23BDC3AF&font=noto&font_size=12 "bg5 - #BDC3AF"
[EAEDC8]: https://fakeimg.pl/96/EAEDC8/5C6A72/?text=%23EAEDC8&font=noto&font_size=12 "bg_visual - #EAEDC8"
[FBE3DA]: https://fakeimg.pl/96/FBE3DA/5C6A72/?text=%23FBE3DA&font=noto&font_size=12 "bg_reg - #FBE3DA"
[F0F1D2]: https://fakeimg.pl/96/F0F1D2/5C6A72/?text=%23F0F1D2&font=noto&font_size=12 "bg_green - #F0F1D2"
[E9F0E9]: https://fakeimg.pl/96/E9F0E9/5C6A72/?text=%23E9F0E9&font=noto&font_size=12 "bg_blue - #E9F0E9"
[FAEDCD]: https://fakeimg.pl/96/FAEDCD/5C6A72/?text=%23FAEDCD&font=noto&font_size=12 "bg_yellow - #FAEDCD"

<!-- light low palette1 -->
[E5DFC5]: https://fakeimg.pl/96/E5DFC5/5C6A72/?text=%23E5DFC5&font=noto&font_size=12 "bg_dim/bg2 - #E5DFC5"
[F3EAD3]: https://fakeimg.pl/96/F3EAD3/5C6A72/?text=%23F3EAD3&font=noto&font_size=12 "bg0 - #F3EAD3"
[EAE4CA]: https://fakeimg.pl/96/EAE4CA/5C6A72/?text=%23EAE4CA&font=noto&font_size=12 "bg1 - #EAE4CA"
[DDD8BE]: https://fakeimg.pl/96/DDD8BE/5C6A72/?text=%23DDD8BE&font=noto&font_size=12 "bg3 - #DDD8BE"
[D8D3BA]: https://fakeimg.pl/96/D8D3BA/5C6A72/?text=%23D8D3BA&font=noto&font_size=12 "bg4 - #D8D3BA"
[B9C0AB]: https://fakeimg.pl/96/B9C0AB/5C6A72/?text=%23B9C0AB&font=noto&font_size=12 "bg5 - #B9C0AB"
[E1E4BD]: https://fakeimg.pl/96/E1E4BD/5C6A72/?text=%23E1E4BD&font=noto&font_size=12 "bg_visual - #E1E4BD"
[F4DBD0]: https://fakeimg.pl/96/F4DBD0/5C6A72/?text=%23F4DBD0&font=noto&font_size=12 "bg_reg - #F4DBD0"
[E5E6C5]: https://fakeimg.pl/96/E5E6C5/5C6A72/?text=%23E5E6C5&font=noto&font_size=12 "bg_green - #E5E6C5"
[E1E7DD]: https://fakeimg.pl/96/E1E7DD/5C6A72/?text=%23E1E7DD&font=noto&font_size=12 "bg_blue - #E1E7DD"
[F1E4C5]: https://fakeimg.pl/96/F1E4C5/5C6A72/?text=%23F1E4C5&font=noto&font_size=12 "bg_yellow - #F1E4C5"

<!-- dark palette2 -->
[D3C6AA]: https://fakeimg.pl/96/D3C6AA/2D353B/?text=%23D3C6AA&font=noto&font_size=12 "fg/statusline2 - #D3C6AA"
[E67E80]: https://fakeimg.pl/96/E67E80/2D353B/?text=%23E67E80&font=noto&font_size=12 "red/statusline3 - #E67E80"
[E69875]: https://fakeimg.pl/96/E69875/2D353B/?text=%23E69875&font=noto&font_size=12 "orange - #E69875"
[DBBC7F]: https://fakeimg.pl/96/DBBC7F/2D353B/?text=%23DBBC7F&font=noto&font_size=12 "yellow - #DBBC7F"
[A7C080]: https://fakeimg.pl/96/A7C080/2D353B/?text=%23A7C080&font=noto&font_size=12 "green/statusline1 - #A7C080"
[83C092]: https://fakeimg.pl/96/83C092/2D353B/?text=%2383C092&font=noto&font_size=12 "aqua - #83C092"
[7FBBB3]: https://fakeimg.pl/96/7FBBB3/2D353B/?text=%237FBBB3&font=noto&font_size=12 "blue - #7FBBB3"
[D699B6]: https://fakeimg.pl/96/D699B6/2D353B/?text=%23D699B6&font=noto&font_size=12 "purple - #D699B6"
[7A8478]: https://fakeimg.pl/96/7A8478/2D353B/?text=%237A8478&font=noto&font_size=12 "grey0 - #7A8478"
[859289]: https://fakeimg.pl/96/859289/2D353B/?text=%23859289&font=noto&font_size=12 "grey1 - #859289"
[9DA9A0]: https://fakeimg.pl/96/9DA9A0/2D353B/?text=%239DA9A0&font=noto&font_size=12 "grey2 - #9DA9A0"

<!-- light palette2 -->
[5C6A72]: https://fakeimg.pl/96/5C6A72/FDF6E3/?text=%235C6A72&font=noto&font_size=12 "fg - #5C6A72"
[F85552]: https://fakeimg.pl/96/F85552/FDF6E3/?text=%23F85552&font=noto&font_size=12 "red - #F85552"
[F57D26]: https://fakeimg.pl/96/F57D26/FDF6E3/?text=%23F57D26&font=noto&font_size=12 "orange - #F57D26"
[DFA000]: https://fakeimg.pl/96/DFA000/FDF6E3/?text=%23DFA000&font=noto&font_size=12 "yellow - #DFA000"
[8DA101]: https://fakeimg.pl/96/8DA101/FDF6E3/?text=%238DA101&font=noto&font_size=12 "green - #8DA101"
[35A77C]: https://fakeimg.pl/96/35A77C/FDF6E3/?text=%2335A77C&font=noto&font_size=12 "aqua - #35A77C"
[3A94C5]: https://fakeimg.pl/96/3A94C5/FDF6E3/?text=%233A94C5&font=noto&font_size=12 "blue - #3A94C5"
[DF69BA]: https://fakeimg.pl/96/DF69BA/FDF6E3/?text=%23DF69BA&font=noto&font_size=12 "purple - #DF69BA"
[A6B0A0]: https://fakeimg.pl/96/A6B0A0/FDF6E3/?text=%23A6B0A0&font=noto&font_size=12 "grey0 - #A6B0A0"
[939F91]: https://fakeimg.pl/96/939F91/FDF6E3/?text=%23939F91&font=noto&font_size=12 "grey1 - #939F91"
[829181]: https://fakeimg.pl/96/829181/FDF6E3/?text=%23829181&font=noto&font_size=12 "grey2 - #829181"
[93B259]: https://fakeimg.pl/96/93B259/FDF6E3/?text=%2393B259&font=noto&font_size=12 "statusline1 - #93B259"
[708089]: https://fakeimg.pl/96/708089/FDF6E3/?text=%23708089&font=noto&font_size=12 "statusline2 - #708089"
[E66868]: https://fakeimg.pl/96/E66868/FDF6E3/?text=%23E66868&font=noto&font_size=12 "statusline3 - #E66868"

<!-- highlights descriptions (dark medium values) -->
[hl_bgd]: https://fakeimg.pl/48/232A2E/232A2E/ "bg_dim - #232A2E"
[hl_bg0]: https://fakeimg.pl/48/2D353B/2D353B/ "bg0 - #2D353B"
[hl_bg1]: https://fakeimg.pl/48/343F44/343F44/ "bg1 - #343F44"
[hl_bg2]: https://fakeimg.pl/48/3D484D/3D484D/ "bg2 - #3D484D"
[hl_bg3]: https://fakeimg.pl/48/475258/475258/ "bg3 - #475258"
[hl_bg4]: https://fakeimg.pl/48/4F585E/4F585E/ "bg4 - #4F585E"
[hl_bg5]: https://fakeimg.pl/48/56635f/56635f/ "bg5 - #56635f"
[hl_bgv]: https://fakeimg.pl/48/543A48/543A48/ "bg_visual - #543A48"
[hl_bgr]: https://fakeimg.pl/48/514045/514045/ "bg_reg - #514045"
[hl_bgg]: https://fakeimg.pl/48/425047/425047/ "bg_green - #425047"
[hl_bgb]: https://fakeimg.pl/48/3A515D/3A515D/ "bg_blue - #3A515D"
[hl_bgy]: https://fakeimg.pl/48/4D4C43/4D4C43/ "bg_yellow - #4D4C43"
[hl_fg]:  https://fakeimg.pl/48/D3C6AA/D3C6AA/ "fg - #D3C6AA"
[hl_red]: https://fakeimg.pl/48/E67E80/E67E80/ "red - #E67E80"
[hl_ora]: https://fakeimg.pl/48/E69875/E69875/ "orange - #E69875"
[hl_yel]: https://fakeimg.pl/48/DBBC7F/DBBC7F/ "yellow - #DBBC7F"
[hl_gre]: https://fakeimg.pl/48/A7C080/A7C080/ "green - #A7C080"
[hl_aqu]: https://fakeimg.pl/48/83C092/83C092/ "aqua - #83C092"
[hl_blu]: https://fakeimg.pl/48/7FBBB3/7FBBB3/ "blue - #7FBBB3"
[hl_pur]: https://fakeimg.pl/48/D699B6/D699B6/ "purple - #D699B6"
[hl_gr0]: https://fakeimg.pl/48/7A8478/7A8478/ "grey0 - #7A8478"
[hl_gr1]: https://fakeimg.pl/48/859289/859289/ "grey1 - #859289"
[hl_gr2]: https://fakeimg.pl/48/9DA9A0/9DA9A0/ "grey2 - #9DA9A0"
[hl_st1]: https://fakeimg.pl/48/A7C080/A7C080/ "statusline1 - #A7C080"
[hl_st2]: https://fakeimg.pl/48/D3C6AA/D3C6AA/ "statusline2 - #D3C6AA"
[hl_st3]: https://fakeimg.pl/48/E67E80/E67E80/ "statusline3 - #E67E80"
