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
| ![#A7C080][hl_gre] | #A7C080 | `green`       | Function Names, Method Names, Strings, Characters, Hint Messages, Hint Signs, Search Highlights, [_Treesitter_: Constructors, Fields, Function Calls, Built-In Functions, Macro Functions, String Escapes, Regex Literals, Tag Delimiters, Non-Structured Text] |
| ![#83C092][hl_aqu] | #83C092 | `aqua`        | Constants, Macros, [_Treesitter_: Strings, Characters]                                                                    |
| ![#7FBBB3][hl_blu] | #7FBBB3 | `blue`        | Identifiers, Uncategorised Special Symbols, Diff Changed Text Background, Info Messages, Info Signs, [_Treesitter_: Built-In Constants, Built-In Variables, Macro-Defined Constants, Special Punctuation, Math Environments] |
| ![#D699B6][hl_pur] | #D699B6 | `purple`      | Booleans, Numbers, Preprocessors, [_Treesitter_: Attributes/Annotations]                                                  |
| ![#7A8478][hl_gr0] | #7A8478 | `grey0`       | Line Numbers, Fold Columns, Concealed Text, Foreground UI Elements                                                        |
| ![#859289][hl_gr1] | #859289 | `grey1`       | Comments, Punctuation Delimiters, Closed Folds, Ignored/Disabled, UI Borders, Status Line Text                            |
| ![#9DA9A0][hl_gr2] | #9DA9A0 | `grey2`       | Cursor Line Number, Tab Line Label (inactive)                                                                             |
| ![#A7C080][hl_st1] | #A7C080 | `statusline1` | Menu Selection Background, Tab Line Label Background (active), Status Line Mode Indicator                                 |
| ![#D3C6AA][hl_st2] | #D3C6AA | `statusline2` | Status Line Mode Indicator                                                                                                |
| ![#E67E80][hl_st3] | #E67E80 | `statusline3` | Status Line Mode Indicator                                                                                                |

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
[1E2326]: https://via.placeholder.com/96/1E2326/D3C6AA.png?text=%231E2326 "bg_dim - #1E2326"
[272E33]: https://via.placeholder.com/96/272E33/D3C6AA.png?text=%23272E33 "bg0 - #272E33"
[2E383C]: https://via.placeholder.com/96/2E383C/D3C6AA.png?text=%232E383C "bg1 - #2E383C"
[374145]: https://via.placeholder.com/96/374145/D3C6AA.png?text=%23374145 "bg2 - #374145"
[414B50]: https://via.placeholder.com/96/414B50/D3C6AA.png?text=%23414B50 "bg3 - #414B50"
[495156]: https://via.placeholder.com/96/495156/D3C6AA.png?text=%23495156 "bg4 - #495156"
[4F5B58]: https://via.placeholder.com/96/4F5B58/D3C6AA.png?text=%234F5B58 "bg5 - #4F5B58"
[4C3743]: https://via.placeholder.com/96/4C3743/D3C6AA.png?text=%234C3743 "bg_visual - #4C3743"
[493B40]: https://via.placeholder.com/96/493B40/D3C6AA.png?text=%23493B40 "bg_reg - #493B40"
[3C4841]: https://via.placeholder.com/96/3C4841/D3C6AA.png?text=%233C4841 "bg_green - #3C4841"
[384B55]: https://via.placeholder.com/96/384B55/D3C6AA.png?text=%23384B55 "bg_blue - #384B55"
[45443c]: https://via.placeholder.com/96/45443c/D3C6AA.png?text=%2345443c "bg_yellow - #45443c"

<!-- dark medium palette1 -->
[232A2E]: https://via.placeholder.com/96/232A2E/D3C6AA.png?text=%23232A2E "bg_dim - #232A2E"
[2D353B]: https://via.placeholder.com/96/2D353B/D3C6AA.png?text=%232D353B "bg0 - #2D353B"
[343F44]: https://via.placeholder.com/96/343F44/D3C6AA.png?text=%23343F44 "bg1 - #343F44"
[3D484D]: https://via.placeholder.com/96/3D484D/D3C6AA.png?text=%233D484D "bg2 - #3D484D"
[475258]: https://via.placeholder.com/96/475258/D3C6AA.png?text=%23475258 "bg3 - #475258"
[4F585E]: https://via.placeholder.com/96/4F585E/D3C6AA.png?text=%234F585E "bg4 - #4F585E"
[56635f]: https://via.placeholder.com/96/56635f/D3C6AA.png?text=%2356635f "bg5 - #56635f"
[543A48]: https://via.placeholder.com/96/543A48/D3C6AA.png?text=%23543A48 "bg_visual - #543A48"
[514045]: https://via.placeholder.com/96/514045/D3C6AA.png?text=%23514045 "bg_reg - #514045"
[425047]: https://via.placeholder.com/96/425047/D3C6AA.png?text=%23425047 "bg_green - #425047"
[3A515D]: https://via.placeholder.com/96/3A515D/D3C6AA.png?text=%233A515D "bg_blue - #3A515D"
[4D4C43]: https://via.placeholder.com/96/4D4C43/D3C6AA.png?text=%234D4C43 "bg_yellow - #4D4C43"

<!-- dark low palette1 -->
[293136]: https://via.placeholder.com/96/293136/D3C6AA.png?text=%23293136 "bg_dim - #293136"
[333C43]: https://via.placeholder.com/96/333C43/D3C6AA.png?text=%23333C43 "bg0 - #333C43"
[3A464C]: https://via.placeholder.com/96/3A464C/D3C6AA.png?text=%233A464C "bg1 - #3A464C"
[434F55]: https://via.placeholder.com/96/434F55/D3C6AA.png?text=%23434F55 "bg2 - #434F55"
[4D5960]: https://via.placeholder.com/96/4D5960/D3C6AA.png?text=%234D5960 "bg3 - #4D5960"
[555F66]: https://via.placeholder.com/96/555F66/D3C6AA.png?text=%23555F66 "bg4 - #555F66"
[5D6B66]: https://via.placeholder.com/96/5D6B66/D3C6AA.png?text=%235D6B66 "bg5 - #5D6B66"
[5C3F4F]: https://via.placeholder.com/96/5C3F4F/D3C6AA.png?text=%235C3F4F "bg_visual - #5C3F4F"
[59464C]: https://via.placeholder.com/96/59464C/D3C6AA.png?text=%2359464C "bg_reg - #59464C"
[48584E]: https://via.placeholder.com/96/48584E/D3C6AA.png?text=%2348584E "bg_green - #48584E"
[3F5865]: https://via.placeholder.com/96/3F5865/D3C6AA.png?text=%233F5865 "bg_blue - #3F5865"
[55544A]: https://via.placeholder.com/96/55544A/D3C6AA.png?text=%2355544A "bg_yellow - #55544A"

<!-- light hard palette1 -->
[F2EFDF]: https://via.placeholder.com/96/F2EFDF/5C6A72.png?text=%23F2EFDF "bg_dim/bg2 - #F2EFDF"
[FFFBEF]: https://via.placeholder.com/96/FFFBEF/5C6A72.png?text=%23FFFBEF "bg0 - #FFFBEF"
[F8F5E4]: https://via.placeholder.com/96/F8F5E4/5C6A72.png?text=%23F8F5E4 "bg1 - #F8F5E4"
[EDEADA]: https://via.placeholder.com/96/EDEADA/5C6A72.png?text=%23EDEADA "bg3 - #EDEADA"
[E8E5D5]: https://via.placeholder.com/96/E8E5D5/5C6A72.png?text=%23E8E5D5 "bg4 - #E8E5D5"
[BEC5B2]: https://via.placeholder.com/96/BEC5B2/5C6A72.png?text=%23BEC5B2 "bg5 - #BEC5B2"
[F0F2D4]: https://via.placeholder.com/96/F0F2D4/5C6A72.png?text=%23F0F2D4 "bg_visual - #F0F2D4"
[FFE7DE]: https://via.placeholder.com/96/FFE7DE/5C6A72.png?text=%23FFE7DE "bg_reg - #FFE7DE"
[F3F5D9]: https://via.placeholder.com/96/F3F5D9/5C6A72.png?text=%23F3F5D9 "bg_green - #F3F5D9"
[ECF5ED]: https://via.placeholder.com/96/ECF5ED/5C6A72.png?text=%23ECF5ED "bg_blue - #ECF5ED"
[FEF2D5]: https://via.placeholder.com/96/FEF2D5/5C6A72.png?text=%23FEF2D5 "bg_yellow - #FEF2D5"

<!-- light medium palette1 -->
[EFEBD4]: https://via.placeholder.com/96/EFEBD4/5C6A72.png?text=%23EFEBD4 "bg_dim/bg2 - #EFEBD4"
[FDF6E3]: https://via.placeholder.com/96/FDF6E3/5C6A72.png?text=%23FDF6E3 "bg0 - #FDF6E3"
[F4F0D9]: https://via.placeholder.com/96/F4F0D9/5C6A72.png?text=%23F4F0D9 "bg1 - #F4F0D9"
[E6E2CC]: https://via.placeholder.com/96/E6E2CC/5C6A72.png?text=%23E6E2CC "bg3 - #E6E2CC"
[E0DCC7]: https://via.placeholder.com/96/E0DCC7/5C6A72.png?text=%23E0DCC7 "bg4 - #E0DCC7"
[BDC3AF]: https://via.placeholder.com/96/BDC3AF/5C6A72.png?text=%23BDC3AF "bg5 - #BDC3AF"
[EAEDC8]: https://via.placeholder.com/96/EAEDC8/5C6A72.png?text=%23EAEDC8 "bg_visual - #EAEDC8"
[FBE3DA]: https://via.placeholder.com/96/FBE3DA/5C6A72.png?text=%23FBE3DA "bg_reg - #FBE3DA"
[F0F1D2]: https://via.placeholder.com/96/F0F1D2/5C6A72.png?text=%23F0F1D2 "bg_green - #F0F1D2"
[E9F0E9]: https://via.placeholder.com/96/E9F0E9/5C6A72.png?text=%23E9F0E9 "bg_blue - #E9F0E9"
[FAEDCD]: https://via.placeholder.com/96/FAEDCD/5C6A72.png?text=%23FAEDCD "bg_yellow - #FAEDCD"

<!-- light low palette1 -->
[E5DFC5]: https://via.placeholder.com/96/E5DFC5/5C6A72.png?text=%23E5DFC5 "bg_dim/bg2 - #E5DFC5"
[F3EAD3]: https://via.placeholder.com/96/F3EAD3/5C6A72.png?text=%23F3EAD3 "bg0 - #F3EAD3"
[EAE4CA]: https://via.placeholder.com/96/EAE4CA/5C6A72.png?text=%23EAE4CA "bg1 - #EAE4CA"
[DDD8BE]: https://via.placeholder.com/96/DDD8BE/5C6A72.png?text=%23DDD8BE "bg3 - #DDD8BE"
[D8D3BA]: https://via.placeholder.com/96/D8D3BA/5C6A72.png?text=%23D8D3BA "bg4 - #D8D3BA"
[B9C0AB]: https://via.placeholder.com/96/B9C0AB/5C6A72.png?text=%23B9C0AB "bg5 - #B9C0AB"
[E1E4BD]: https://via.placeholder.com/96/E1E4BD/5C6A72.png?text=%23E1E4BD "bg_visual - #E1E4BD"
[F4DBD0]: https://via.placeholder.com/96/F4DBD0/5C6A72.png?text=%23F4DBD0 "bg_reg - #F4DBD0"
[E5E6C5]: https://via.placeholder.com/96/E5E6C5/5C6A72.png?text=%23E5E6C5 "bg_green - #E5E6C5"
[E1E7DD]: https://via.placeholder.com/96/E1E7DD/5C6A72.png?text=%23E1E7DD "bg_blue - #E1E7DD"
[F1E4C5]: https://via.placeholder.com/96/F1E4C5/5C6A72.png?text=%23F1E4C5 "bg_yellow - #F1E4C5"

<!-- dark palette2 -->
[D3C6AA]: https://via.placeholder.com/96/D3C6AA/2D353B.png?text=%23D3C6AA "fg/statusline2 - #D3C6AA"
[E67E80]: https://via.placeholder.com/96/E67E80/2D353B.png?text=%23E67E80 "red/statusline3 - #E67E80"
[E69875]: https://via.placeholder.com/96/E69875/2D353B.png?text=%23E69875 "orange - #E69875"
[DBBC7F]: https://via.placeholder.com/96/DBBC7F/2D353B.png?text=%23DBBC7F "yellow - #DBBC7F"
[A7C080]: https://via.placeholder.com/96/A7C080/2D353B.png?text=%23A7C080 "green/statusline1 - #A7C080"
[83C092]: https://via.placeholder.com/96/83C092/2D353B.png?text=%2383C092 "aqua - #83C092"
[7FBBB3]: https://via.placeholder.com/96/7FBBB3/2D353B.png?text=%237FBBB3 "blue - #7FBBB3"
[D699B6]: https://via.placeholder.com/96/D699B6/2D353B.png?text=%23D699B6 "purple - #D699B6"
[7A8478]: https://via.placeholder.com/96/7A8478/2D353B.png?text=%237A8478 "grey0 - #7A8478"
[859289]: https://via.placeholder.com/96/859289/2D353B.png?text=%23859289 "grey1 - #859289"
[9DA9A0]: https://via.placeholder.com/96/9DA9A0/2D353B.png?text=%239DA9A0 "grey2 - #9DA9A0"

<!-- light palette2 -->
[5C6A72]: https://via.placeholder.com/96/5C6A72/FDF6E3.png?text=%235C6A72 "fg - #5C6A72"
[F85552]: https://via.placeholder.com/96/F85552/FDF6E3.png?text=%23F85552 "red - #F85552"
[F57D26]: https://via.placeholder.com/96/F57D26/FDF6E3.png?text=%23F57D26 "orange - #F57D26"
[DFA000]: https://via.placeholder.com/96/DFA000/FDF6E3.png?text=%23DFA000 "yellow - #DFA000"
[8DA101]: https://via.placeholder.com/96/8DA101/FDF6E3.png?text=%238DA101 "green - #8DA101"
[35A77C]: https://via.placeholder.com/96/35A77C/FDF6E3.png?text=%2335A77C "aqua - #35A77C"
[3A94C5]: https://via.placeholder.com/96/3A94C5/FDF6E3.png?text=%233A94C5 "blue - #3A94C5"
[DF69BA]: https://via.placeholder.com/96/DF69BA/FDF6E3.png?text=%23DF69BA "purple - #DF69BA"
[A6B0A0]: https://via.placeholder.com/96/A6B0A0/FDF6E3.png?text=%23A6B0A0 "grey0 - #A6B0A0"
[939F91]: https://via.placeholder.com/96/939F91/FDF6E3.png?text=%23939F91 "grey1 - #939F91"
[829181]: https://via.placeholder.com/96/829181/FDF6E3.png?text=%23829181 "grey2 - #829181"
[93B259]: https://via.placeholder.com/96/93B259/FDF6E3.png?text=%2393B259 "statusline1 - #93B259"
[708089]: https://via.placeholder.com/96/708089/FDF6E3.png?text=%23708089 "statusline2 - #708089"
[E66868]: https://via.placeholder.com/96/E66868/FDF6E3.png?text=%23E66868 "statusline3 - #E66868"

<!-- highlights descriptions (dark medium values) -->
[hl_bgd]: https://via.placeholder.com/48/232A2E/232A2E.png "bg_dim - #232A2E"
[hl_bg0]: https://via.placeholder.com/48/2D353B/2D353B.png "bg0 - #2D353B"
[hl_bg1]: https://via.placeholder.com/48/343F44/343F44.png "bg1 - #343F44"
[hl_bg2]: https://via.placeholder.com/48/3D484D/3D484D.png "bg2 - #3D484D"
[hl_bg3]: https://via.placeholder.com/48/475258/475258.png "bg3 - #475258"
[hl_bg4]: https://via.placeholder.com/48/4F585E/4F585E.png "bg4 - #4F585E"
[hl_bg5]: https://via.placeholder.com/48/56635f/56635f.png "bg5 - #56635f"
[hl_bgv]: https://via.placeholder.com/48/543A48/543A48.png "bg_visual - #543A48"
[hl_bgr]: https://via.placeholder.com/48/514045/514045.png "bg_reg - #514045"
[hl_bgg]: https://via.placeholder.com/48/425047/425047.png "bg_green - #425047"
[hl_bgb]: https://via.placeholder.com/48/3A515D/3A515D.png "bg_blue - #3A515D"
[hl_bgy]: https://via.placeholder.com/48/4D4C43/4D4C43.png "bg_yellow - #4D4C43"
[hl_fg]:  https://via.placeholder.com/48/D3C6AA/D3C6AA.png "fg - #D3C6AA"
[hl_red]: https://via.placeholder.com/48/E67E80/E67E80.png "red - #E67E80"
[hl_ora]: https://via.placeholder.com/48/E69875/E69875.png "orange - #E69875"
[hl_yel]: https://via.placeholder.com/48/DBBC7F/DBBC7F.png "yellow - #DBBC7F"
[hl_gre]: https://via.placeholder.com/48/A7C080/A7C080.png "green - #A7C080"
[hl_aqu]: https://via.placeholder.com/48/83C092/83C092.png "aqua - #83C092"
[hl_blu]: https://via.placeholder.com/48/7FBBB3/7FBBB3.png "blue - #7FBBB3"
[hl_pur]: https://via.placeholder.com/48/D699B6/D699B6.png "purple - #D699B6"
[hl_gr0]: https://via.placeholder.com/48/7A8478/7A8478.png "grey0 - #7A8478"
[hl_gr1]: https://via.placeholder.com/48/859289/859289.png "grey1 - #859289"
[hl_gr2]: https://via.placeholder.com/48/9DA9A0/9DA9A0.png "grey2 - #9DA9A0"
[hl_st1]: https://via.placeholder.com/48/A7C080/A7C080.png "statusline1 - #A7C080"
[hl_st2]: https://via.placeholder.com/48/D3C6AA/D3C6AA.png "statusline2 - #D3C6AA"
[hl_st3]: https://via.placeholder.com/48/E67E80/E67E80.png "statusline3 - #E67E80"
