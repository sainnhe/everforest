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
| ![#232A2E][232A2E] | #232A2E | `bg_dim`      | Dimmed Background                                                                                                         |
| ![#2D353B][2D353B] | #2D353B | `bg0`         | Default Background, Line Numbers Background, Signs Background, Status Line Background (inactive), Tab Line Label (active) |
| ![#343F44][343F44] | #343F44 | `bg1`         | Cursor Line Background, Color Columns, Closed Folds Background, Status Line Background (active), Tab Line Background      |
| ![#3D484D][3D484D] | #3D484D | `bg2`         | Popup Menu Background, Floating Window Background, Window Toolbar Background                                              |
| ![#475258][475258] | #475258 | `bg3`         | List Chars, Special Keys, Tab Line Label Background (inactive)                                                            |
| ![#4F585E][4F585E] | #4F585E | `bg4`         | Window Splits Separators, Whitespaces, Breaks                                                                             |
| ![#56635f][56635f] | #56635f | `bg5`         | _Not currently used_                                                                                                      |
| ![#543A48][543A48] | #543A48 | `bg_visual`   | Visual Selection                                                                                                          |
| ![#514045][514045] | #514045 | `bg_red`      | Diff Deleted Line Background, Error Highlights                                                                            |
| ![#425047][425047] | #425047 | `bg_green`    | Diff Added Line Background, Hint Highlights                                                                               |
| ![#3A515D][3A515D] | #3A515D | `bg_blue`     | Diff Changed Line Background, Info Highlights                                                                             |
| ![#4D4C43][4D4C43] | #4D4C43 | `bg_yellow`   | Warning Highlights                                                                                                        |
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
[1E2326]: https://via.placeholder.com/48/1E2326/1E2326.png "bg_dim - #1E2326"
[272E33]: https://via.placeholder.com/48/272E33/272E33.png "bg0 - #272E33"
[2E383C]: https://via.placeholder.com/48/2E383C/2E383C.png "bg1 - #2E383C"
[374145]: https://via.placeholder.com/48/374145/374145.png "bg2 - #374145"
[414B50]: https://via.placeholder.com/48/414B50/414B50.png "bg3 - #414B50"
[495156]: https://via.placeholder.com/48/495156/495156.png "bg4 - #495156"
[4F5B58]: https://via.placeholder.com/48/4F5B58/4F5B58.png "bg5 - #4F5B58"
[4C3743]: https://via.placeholder.com/48/4C3743/4C3743.png "bg_visual - #4C3743"
[493B40]: https://via.placeholder.com/48/493B40/493B40.png "bg_reg - #493B40"
[3C4841]: https://via.placeholder.com/48/3C4841/3C4841.png "bg_green - #3C4841"
[384B55]: https://via.placeholder.com/48/384B55/384B55.png "bg_blue - #384B55"
[45443c]: https://via.placeholder.com/48/45443c/45443c.png "bg_yellow - #45443c"

<!-- dark medium palette1 -->
[232A2E]: https://via.placeholder.com/48/232A2E/232A2E.png "bg_dim - #232A2E"
[2D353B]: https://via.placeholder.com/48/2D353B/2D353B.png "bg0 - #2D353B"
[343F44]: https://via.placeholder.com/48/343F44/343F44.png "bg1 - #343F44"
[3D484D]: https://via.placeholder.com/48/3D484D/3D484D.png "bg2 - #3D484D"
[475258]: https://via.placeholder.com/48/475258/475258.png "bg3 - #475258"
[4F585E]: https://via.placeholder.com/48/4F585E/4F585E.png "bg4 - #4F585E"
[56635f]: https://via.placeholder.com/48/56635f/56635f.png "bg5 - #56635f"
[543A48]: https://via.placeholder.com/48/543A48/543A48.png "bg_visual - #543A48"
[514045]: https://via.placeholder.com/48/514045/514045.png "bg_reg - #514045"
[425047]: https://via.placeholder.com/48/425047/425047.png "bg_green - #425047"
[3A515D]: https://via.placeholder.com/48/3A515D/3A515D.png "bg_blue - #3A515D"
[4D4C43]: https://via.placeholder.com/48/4D4C43/4D4C43.png "bg_yellow - #4D4C43"

<!-- dark low palette1 -->
[293136]: https://via.placeholder.com/48/293136/293136.png "bg_dim - #293136"
[333C43]: https://via.placeholder.com/48/333C43/333C43.png "bg0 - #333C43"
[3A464C]: https://via.placeholder.com/48/3A464C/3A464C.png "bg1 - #3A464C"
[434F55]: https://via.placeholder.com/48/434F55/434F55.png "bg2 - #434F55"
[4D5960]: https://via.placeholder.com/48/4D5960/4D5960.png "bg3 - #4D5960"
[555F66]: https://via.placeholder.com/48/555F66/555F66.png "bg4 - #555F66"
[5D6B66]: https://via.placeholder.com/48/5D6B66/5D6B66.png "bg5 - #5D6B66"
[5C3F4F]: https://via.placeholder.com/48/5C3F4F/5C3F4F.png "bg_visual - #5C3F4F"
[59464C]: https://via.placeholder.com/48/59464C/59464C.png "bg_reg - #59464C"
[48584E]: https://via.placeholder.com/48/48584E/48584E.png "bg_green - #48584E"
[3F5865]: https://via.placeholder.com/48/3F5865/3F5865.png "bg_blue - #3F5865"
[55544A]: https://via.placeholder.com/48/55544A/55544A.png "bg_yellow - #55544A"

<!-- light hard palette1 -->
[F2EFDF]: https://via.placeholder.com/48/F2EFDF/F2EFDF.png "bg_dim/bg2 - #F2EFDF"
[FFFBEF]: https://via.placeholder.com/48/FFFBEF/FFFBEF.png "bg0 - #FFFBEF"
[F8F5E4]: https://via.placeholder.com/48/F8F5E4/F8F5E4.png "bg1 - #F8F5E4"
[EDEADA]: https://via.placeholder.com/48/EDEADA/EDEADA.png "bg3 - #EDEADA"
[E8E5D5]: https://via.placeholder.com/48/E8E5D5/E8E5D5.png "bg4 - #E8E5D5"
[BEC5B2]: https://via.placeholder.com/48/BEC5B2/BEC5B2.png "bg5 - #BEC5B2"
[F0F2D4]: https://via.placeholder.com/48/F0F2D4/F0F2D4.png "bg_visual - #F0F2D4"
[FFE7DE]: https://via.placeholder.com/48/FFE7DE/FFE7DE.png "bg_reg - #FFE7DE"
[F3F5D9]: https://via.placeholder.com/48/F3F5D9/F3F5D9.png "bg_green - #F3F5D9"
[ECF5ED]: https://via.placeholder.com/48/ECF5ED/ECF5ED.png "bg_blue - #ECF5ED"
[FEF2D5]: https://via.placeholder.com/48/FEF2D5/FEF2D5.png "bg_yellow - #FEF2D5"

<!-- light medium palette1 -->
[EFEBD4]: https://via.placeholder.com/48/EFEBD4/EFEBD4.png "bg_dim/bg2 - #EFEBD4"
[FDF6E3]: https://via.placeholder.com/48/FDF6E3/FDF6E3.png "bg0 - #FDF6E3"
[F4F0D9]: https://via.placeholder.com/48/F4F0D9/F4F0D9.png "bg1 - #F4F0D9"
[E6E2CC]: https://via.placeholder.com/48/E6E2CC/E6E2CC.png "bg3 - #E6E2CC"
[E0DCC7]: https://via.placeholder.com/48/E0DCC7/E0DCC7.png "bg4 - #E0DCC7"
[BDC3AF]: https://via.placeholder.com/48/BDC3AF/BDC3AF.png "bg5 - #BDC3AF"
[EAEDC8]: https://via.placeholder.com/48/EAEDC8/EAEDC8.png "bg_visual - #EAEDC8"
[FBE3DA]: https://via.placeholder.com/48/FBE3DA/FBE3DA.png "bg_reg - #FBE3DA"
[F0F1D2]: https://via.placeholder.com/48/F0F1D2/F0F1D2.png "bg_green - #F0F1D2"
[E9F0E9]: https://via.placeholder.com/48/E9F0E9/E9F0E9.png "bg_blue - #E9F0E9"
[FAEDCD]: https://via.placeholder.com/48/FAEDCD/FAEDCD.png "bg_yellow - #FAEDCD"

<!-- light low palette1 -->
[E5DFC5]: https://via.placeholder.com/48/E5DFC5/E5DFC5.png "bg_dim/bg2 - #E5DFC5"
[F3EAD3]: https://via.placeholder.com/48/F3EAD3/F3EAD3.png "bg0 - #F3EAD3"
[EAE4CA]: https://via.placeholder.com/48/EAE4CA/EAE4CA.png "bg1 - #EAE4CA"
[DDD8BE]: https://via.placeholder.com/48/DDD8BE/DDD8BE.png "bg3 - #DDD8BE"
[D8D3BA]: https://via.placeholder.com/48/D8D3BA/D8D3BA.png "bg4 - #D8D3BA"
[B9C0AB]: https://via.placeholder.com/48/B9C0AB/B9C0AB.png "bg5 - #B9C0AB"
[E1E4BD]: https://via.placeholder.com/48/E1E4BD/E1E4BD.png "bg_visual - #E1E4BD"
[F4DBD0]: https://via.placeholder.com/48/F4DBD0/F4DBD0.png "bg_reg - #F4DBD0"
[E5E6C5]: https://via.placeholder.com/48/E5E6C5/E5E6C5.png "bg_green - #E5E6C5"
[E1E7DD]: https://via.placeholder.com/48/E1E7DD/E1E7DD.png "bg_blue - #E1E7DD"
[F1E4C5]: https://via.placeholder.com/48/F1E4C5/F1E4C5.png "bg_yellow - #F1E4C5"

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
