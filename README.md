# Introduction

![](./screenshots/forest_night.png)

This color scheme is a mixture of [spring-night](https://github.com/rhysd/vim-color-spring-night) and [sacredforest](https://github.com/KKPMW/sacredforest-vim), it uses the tone of sacredforest and combines some syntax highlighting groups of spring-night.

If you want better syntax highlighting support, please install [sheerun/polyglot](https://github.com/sheerun/vim-polyglot).

# Installation

for [vim-plug](https://github.com/junegunn/vim-plug)

```vim
Plug 'sainnhe/vim-color-forest-night'
```

# Usage

```vim
colorscheme forest-night
```

To enable [lightline](https://github.com/itchyny/lightline.vim) color scheme, put this in your vimrc

```vim
let g:lightline.colorscheme = 'forest_night'
```

or if you want to apply it without reload

```vim
:let g:lightline.colorscheme = 'forest_night'
:call lightline#init()
:call lightline#colorscheme()
:call lightline#update()
```

# Inspirations

**[spring-night](https://github.com/rhysd/vim-color-spring-night)**

**[sacredforest](https://github.com/KKPMW/sacredforest-vim)**
