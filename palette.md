# Color Palette and Highlighting Semantics

## Contents

1. [Palette Variants](#palette-variants)
   * [Dark](#dark)
   * [Light](#light)
1. [Highlights](#highlights)
1. [Design Decisions](#design-decisions)
   * [Primary and Secondary Colors](#primary-and-secondary-colors)
   * [Vim versus Treesitter Highlights](#vim-versus-treesitter-highlights)
   * [Italics](#italics)

## Palette Variants

The color scheme contains two major color palettes: `dark` and `light`.

Each color palette is composed of two sub-palettes: `palette1` for background colors, and `palette2` for foreground
colors.

Background colors come in three flavours based on their contrast: `hard`, `medium` (default) and `low`.

The semantics of each color in the context of syntax highlighting is described in [Highlights](#highlights).

### Dark

#### Background Colors (palette1)

<sub>hard</sub>  
![#2B3339][2B3339]![#323C41][323C41]![#3A454A][3A454A]![#445055][445055]![#4C555B][4C555B]![#53605C][53605C]  
![#503946][503946]![#4E3E43][4E3E43]![#404D44][404D44]![#394F5A][394F5A]![#4A4940][4A4940]  
<sub>medium</sub>  
![#2F383E][2F383E]![#374247][374247]![#404C51][404C51]![#4A555B][4A555B]![#525C62][525C62]![#596763][596763]  
![#573E4C][573E4C]![#544247][544247]![#445349][445349]![#3B5360][3B5360]![#504F45][504F45]  
<sub>low</sub>  
![#323D43][323D43]![#3C474D][3C474D]![#465258][465258]![#505A60][505A60]![#576268][576268]![#5F6D67][5F6D67]  
![#5D4251][5D4251]![#59454B][59454B]![#48584D][48584D]![#3D5665][3D5665]![#55544A][55544A]

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
![#FFF9E8][FFF9E8]![#F7F4E0][F7F4E0]![#F0EED9][F0EED9]![#E9E8D2][E9E8D2]![#E1DDCB][E1DDCB]![#BEC5B2][BEC5B2]  
![#EDF0CD][EDF0CD]![#FCE5DC][FCE5DC]![#F1F3D4][F1F3D4]![#EAF2EB][EAF2EB]![#FBEFD0][FBEFD0]  
<sub>medium</sub>  
![#FDF6E3][FDF6E3]![#F3EFDA][F3EFDA]![#EDEAD5][EDEAD5]![#E4E1CD][E4E1CD]![#DFDBC8][DFDBC8]![#BDC3AF][BDC3AF]  
![#EAEDC8][EAEDC8]![#FBE3DA][FBE3DA]![#F0F1D2][F0F1D2]![#E9F0E9][E9F0E9]![#FAEDCD][FAEDCD]  
<sub>low</sub>  
![#F8F0DC][F8F0DC]![#EFEAD4][EFEAD4]![#E9E5CF][E9E5CF]![#E1DDC9][E1DDC9]![#DCD8C4][DCD8C4]![#B9C0AB][B9C0AB]  
![#E6E9C4][E6E9C4]![#F9E0D4][F9E0D4]![#EDEECE][EDEECE]![#E7EDE5][E7EDE5]![#F6E9C9][F6E9C9]

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
| ![#2F383E][2F383E] | #2F383E | `bg0`         | Default Background, Line Numbers Background, Signs Background, Status Line Background (inactive), Tab Line Label (active) |
| ![#374247][374247] | #374247 | `bg1`         | Cursor Line Background, Color Columns, Closed Folds Background, Status Line Background (active), Tab Line Background      |
| ![#404C51][404C51] | #404C51 | `bg2`         | Popup Menu Background, Floating Window Background, Window Toolbar Background                                              |
| ![#4A555B][4A555B] | #4A555B | `bg3`         | List Chars, Special Keys, Tab Line Label Background (inactive)                                                            |
| ![#525C62][525C62] | #525C62 | `bg4`         | Window Splits Separators, Whitespaces, Breaks                                                                             |
| ![#596763][596763] | #596763 | `bg5`         | _Not currently used_                                                                                                      |
| ![#573E4C][573E4C] | #573E4C | `bg_visual`   | Visual Selection                                                                                                          |
| ![#544247][544247] | #544247 | `bg_red`      | Diff Deleted Line Background, Error Highlights                                                                            |
| ![#445349][445349] | #445349 | `bg_green`    | Diff Added Line Background, Hint Highlights                                                                               |
| ![#3B5360][3B5360] | #3B5360 | `bg_blue`     | Diff Changed Line Background, Info Highlights                                                                             |
| ![#504F45][504F45] | #504F45 | `bg_yellow`   | Warning Highlights                                                                                                        |
| ![#D3C6AA][D3C6AA] | #D3C6AA | `fg`          | Default Foreground, Signs, [_Treesitter_: Constants, Variables, Function Parameters, Properties, Symbol Identifiers]      |
| ![#E67E80][E67E80] | #E67E80 | `red`         | Conditional Keywords, Loop Keywords, Exception Keywords, Inclusion Keywords, Uncategorised Keywords, Diff Deleted Signs, Error Messages, Error Signs |
| ![#E69875][E69875] | #E69875 | `orange`      | Operator Keywords, Operators, Labels, Storage Classes, Composite Types, Enumerated Types, Tags, Debugging Statements      |
| ![#DBBC7F][DBBC7F] | #DBBC7F | `yellow`      | Types, Special Characters, Warning Messages, Warning Signs, [_Treesitter_: Modules, Namespaces]                           |
| ![#A7C080][A7C080] | #A7C080 | `green`       | Function Names, Method Names, Strings, Characters, Hint Messages, Hint Signs, Search Highlights, [_Treesitter_: Constructors, Fields, Function Calls, Built-In Functions, Macro Functions, String Escapes, Regex Literals, Tag Delimiters, Non-Structured Text] |
| ![#83C092][83C092] | #83C092 | `aqua`        | Constants, Macros, [_Treesitter_: Strings, Characters]                                                                    |
| ![#7FBBB3][7FBBB3] | #7FBBB3 | `blue`        | Identifiers, Uncategorised Special Symbols, Diff Changed Text Background, Info Messages, Info Signs, [_Treesitter_: Built-In Constants, Built-In Variables, Macro-Defined Constants, Special Punctuation, Math Environments] |
| ![#D699B6][D699B6] | #D699B6 | `purple`      | Booleans, Numbers, Preprocessors, [_Treesitter_: Attributes/Annotations]                                                  |
| ![#7A8478][7A8478] | #7A8478 | `grey0`       | Line Numbers, Fold Columns, Concealed Text, Foreground UI Elements                                                        |
| ![#859289][859289] | #859289 | `grey1`       | Comments, Punctuation Delimiters, Closed Folds, Ignored/Disabled, UI Borders, Status Line Text                            |
| ![#9DA9A0][9DA9A0] | #9DA9A0 | `grey2`       | Cursor Line Number, Tab Line Label (inactive)                                                                             |
| ![#A7C080][A7C080] | #A7C080 | `statusline1` | Menu Selection Background, Tab Line Label Background (active), Status Line Mode Indicator                                 |
| ![#D3C6AA][D3C6AA] | #D3C6AA | `statusline2` | Status Line Mode Indicator                                                                                                |
| ![#E67E80][E67E80] | #E67E80 | `statusline3` | Status Line Mode Indicator                                                                                                |

## Design Decisions

TODO

<!-- TODO(antoineco): describe higher level semantics for italics and design decisions for Classic Vim vs. Treesitter highlights -->

### Primary and Secondary Colors

<!--
General feel: Green, Aqua, Yellow, Orange, Red
https://github.com/sainnhe/gruvbox-material/issues/119#issuecomment-1019999876
-->

### Vim versus Treesitter Highlights

<!--
Green vs Aqua strings
https://github.com/sainnhe/gruvbox-material/issues/109#issuecomment-964656653
https://github.com/sainnhe/gruvbox-material/issues/119#issuecomment-1019686439
-->

### Italics

<!--
Two conventions
https://github.com/sainnhe/everforest/pull/81#issuecomment-1216751460
-->


<!-- dark hard palette1 -->
[2B3339]: https://via.placeholder.com/48/2B3339/2B3339.png "bg0 - #2B3339"
[323C41]: https://via.placeholder.com/48/323C41/323C41.png "bg1 - #323C41"
[3A454A]: https://via.placeholder.com/48/3A454A/3A454A.png "bg2 - #3A454A"
[445055]: https://via.placeholder.com/48/445055/445055.png "bg3 - #445055"
[4C555B]: https://via.placeholder.com/48/4C555B/4C555B.png "bg4 - #4C555B"
[53605C]: https://via.placeholder.com/48/53605C/53605C.png "bg5 - #53605C"
[503946]: https://via.placeholder.com/48/503946/503946.png "bg_visual - #503946"
[4E3E43]: https://via.placeholder.com/48/4E3E43/4E3E43.png "bg_reg - #4E3E43"
[404D44]: https://via.placeholder.com/48/404D44/404D44.png "bg_green - #404D44"
[394F5A]: https://via.placeholder.com/48/394F5A/394F5A.png "bg_blue - #394F5A"
[4A4940]: https://via.placeholder.com/48/4A4940/4A4940.png "bg_yellow - #4A4940"

<!-- dark medium palette1 -->
[2F383E]: https://via.placeholder.com/48/2F383E/2F383E.png "bg0 - #2F383E"
[374247]: https://via.placeholder.com/48/374247/374247.png "bg1 - #374247"
[404C51]: https://via.placeholder.com/48/404C51/404C51.png "bg2 - #404C51"
[4A555B]: https://via.placeholder.com/48/4A555B/4A555B.png "bg3 - #4A555B"
[525C62]: https://via.placeholder.com/48/525C62/525C62.png "bg4 - #525C62"
[596763]: https://via.placeholder.com/48/596763/596763.png "bg5 - #596763"
[573E4C]: https://via.placeholder.com/48/573E4C/573E4C.png "bg_visual - #573E4C"
[544247]: https://via.placeholder.com/48/544247/544247.png "bg_reg - #544247"
[445349]: https://via.placeholder.com/48/445349/445349.png "bg_green - #445349"
[3B5360]: https://via.placeholder.com/48/3B5360/3B5360.png "bg_blue - #3B5360"
[504F45]: https://via.placeholder.com/48/504F45/504F45.png "bg_yellow - #504F45"

<!-- dark low palette1 -->
[323D43]: https://via.placeholder.com/48/323D43/323D43.png "bg0 - #323D43"
[3C474D]: https://via.placeholder.com/48/3C474D/3C474D.png "bg1 - #3C474D"
[465258]: https://via.placeholder.com/48/465258/465258.png "bg2 - #465258"
[505A60]: https://via.placeholder.com/48/505A60/505A60.png "bg3 - #505A60"
[576268]: https://via.placeholder.com/48/576268/576268.png "bg4 - #576268"
[5F6D67]: https://via.placeholder.com/48/5F6D67/5F6D67.png "bg5 - #5F6D67"
[5D4251]: https://via.placeholder.com/48/5D4251/5D4251.png "bg_visual - #5D4251"
[59454B]: https://via.placeholder.com/48/59454B/59454B.png "bg_reg - #59454B"
[48584D]: https://via.placeholder.com/48/48584D/48584D.png "bg_green - #48584D"
[3D5665]: https://via.placeholder.com/48/3D5665/3D5665.png "bg_blue - #3D5665"
[55544A]: https://via.placeholder.com/48/55544A/55544A.png "bg_yellow - #55544A"

<!-- light hard palette1 -->
[FFF9E8]: https://via.placeholder.com/48/FFF9E8/FFF9E8.png "bg0 - #FFF9E8"
[F7F4E0]: https://via.placeholder.com/48/F7F4E0/F7F4E0.png "bg1 - #F7F4E0"
[F0EED9]: https://via.placeholder.com/48/F0EED9/F0EED9.png "bg2 - #F0EED9"
[E9E8D2]: https://via.placeholder.com/48/E9E8D2/E9E8D2.png "bg3 - #E9E8D2"
[E1DDCB]: https://via.placeholder.com/48/E1DDCB/E1DDCB.png "bg4 - #E1DDCB"
[BEC5B2]: https://via.placeholder.com/48/BEC5B2/BEC5B2.png "bg5 - #BEC5B2"
[EDF0CD]: https://via.placeholder.com/48/EDF0CD/EDF0CD.png "bg_visual - #EDF0CD"
[FCE5DC]: https://via.placeholder.com/48/FCE5DC/FCE5DC.png "bg_reg - #FCE5DC"
[F1F3D4]: https://via.placeholder.com/48/F1F3D4/F1F3D4.png "bg_green - #F1F3D4"
[EAF2EB]: https://via.placeholder.com/48/EAF2EB/EAF2EB.png "bg_blue - #EAF2EB"
[FBEFD0]: https://via.placeholder.com/48/FBEFD0/FBEFD0.png "bg_yellow - #FBEFD0"

<!-- light medium palette1 -->
[FDF6E3]: https://via.placeholder.com/48/FDF6E3/FDF6E3.png "bg0 - #FDF6E3"
[F3EFDA]: https://via.placeholder.com/48/F3EFDA/F3EFDA.png "bg1 - #F3EFDA"
[EDEAD5]: https://via.placeholder.com/48/EDEAD5/EDEAD5.png "bg2 - #EDEAD5"
[E4E1CD]: https://via.placeholder.com/48/E4E1CD/E4E1CD.png "bg3 - #E4E1CD"
[DFDBC8]: https://via.placeholder.com/48/DFDBC8/DFDBC8.png "bg4 - #DFDBC8"
[BDC3AF]: https://via.placeholder.com/48/BDC3AF/BDC3AF.png "bg5 - #BDC3AF"
[EAEDC8]: https://via.placeholder.com/48/EAEDC8/EAEDC8.png "bg_visual - #EAEDC8"
[FBE3DA]: https://via.placeholder.com/48/FBE3DA/FBE3DA.png "bg_reg - #FBE3DA"
[F0F1D2]: https://via.placeholder.com/48/F0F1D2/F0F1D2.png "bg_green - #F0F1D2"
[E9F0E9]: https://via.placeholder.com/48/E9F0E9/E9F0E9.png "bg_blue - #E9F0E9"
[FAEDCD]: https://via.placeholder.com/48/FAEDCD/FAEDCD.png "bg_yellow - #FAEDCD"

<!-- light low palette1 -->
[F8F0DC]: https://via.placeholder.com/48/F8F0DC/F8F0DC.png "bg0 - #F8F0DC"
[EFEAD4]: https://via.placeholder.com/48/EFEAD4/EFEAD4.png "bg1 - #EFEAD4"
[E9E5CF]: https://via.placeholder.com/48/E9E5CF/E9E5CF.png "bg2 - #E9E5CF"
[E1DDC9]: https://via.placeholder.com/48/E1DDC9/E1DDC9.png "bg3 - #E1DDC9"
[DCD8C4]: https://via.placeholder.com/48/DCD8C4/DCD8C4.png "bg4 - #DCD8C4"
[B9C0AB]: https://via.placeholder.com/48/B9C0AB/B9C0AB.png "bg5 - #B9C0AB"
[E6E9C4]: https://via.placeholder.com/48/E6E9C4/E6E9C4.png "bg_visual - #E6E9C4"
[F9E0D4]: https://via.placeholder.com/48/F9E0D4/F9E0D4.png "bg_reg - #F9E0D4"
[EDEECE]: https://via.placeholder.com/48/EDEECE/EDEECE.png "bg_green - #EDEECE"
[E7EDE5]: https://via.placeholder.com/48/E7EDE5/E7EDE5.png "bg_blue - #E7EDE5"
[F6E9C9]: https://via.placeholder.com/48/F6E9C9/F6E9C9.png "bg_yellow - #F6E9C9"

<!-- dark palette2 -->
[D3C6AA]: https://via.placeholder.com/48/D3C6AA/D3C6AA.png "fg/statusline2 - #D3C6AA"
[E67E80]: https://via.placeholder.com/48/E67E80/E67E80.png "red/statusline3 - #E67E80"
[E69875]: https://via.placeholder.com/48/E69875/E69875.png "orange - #E69875"
[DBBC7F]: https://via.placeholder.com/48/DBBC7F/DBBC7F.png "yellow - #DBBC7F"
[A7C080]: https://via.placeholder.com/48/A7C080/A7C080.png "green/statusline1 - #A7C080"
[83C092]: https://via.placeholder.com/48/83C092/83C092.png "aqua - #83C092"
[7FBBB3]: https://via.placeholder.com/48/7FBBB3/7FBBB3.png "blue - #7FBBB3"
[D699B6]: https://via.placeholder.com/48/D699B6/D699B6.png "purple - #D699B6"
[7A8478]: https://via.placeholder.com/48/7A8478/7A8478.png "grey0 - #7A8478"
[859289]: https://via.placeholder.com/48/859289/859289.png "grey1 - #859289"
[9DA9A0]: https://via.placeholder.com/48/9DA9A0/9DA9A0.png "grey2 - #9DA9A0"

<!-- light palette2 -->
[5C6A72]: https://via.placeholder.com/48/5C6A72/5C6A72.png "fg - #5C6A72"
[F85552]: https://via.placeholder.com/48/F85552/F85552.png "red - #F85552"
[F57D26]: https://via.placeholder.com/48/F57D26/F57D26.png "orange - #F57D26"
[DFA000]: https://via.placeholder.com/48/DFA000/DFA000.png "yellow - #DFA000"
[8DA101]: https://via.placeholder.com/48/8DA101/8DA101.png "green - #8DA101"
[35A77C]: https://via.placeholder.com/48/35A77C/35A77C.png "aqua - #35A77C"
[3A94C5]: https://via.placeholder.com/48/3A94C5/3A94C5.png "blue - #3A94C5"
[DF69BA]: https://via.placeholder.com/48/DF69BA/DF69BA.png "purple - #DF69BA"
[A6B0A0]: https://via.placeholder.com/48/A6B0A0/A6B0A0.png "grey0 - #A6B0A0"
[939F91]: https://via.placeholder.com/48/939F91/939F91.png "grey1 - #939F91"
[829181]: https://via.placeholder.com/48/829181/829181.png "grey2 - #829181"
[93B259]: https://via.placeholder.com/48/93B259/93B259.png "statusline1 - #93B259"
[708089]: https://via.placeholder.com/48/708089/708089.png "statusline2 - #708089"
[E66868]: https://via.placeholder.com/48/E66868/E66868.png "statusline3 - #E66868"
