<h1 align="center">
    <a href="https://gist.github.com/sainnhe/991dc3cb7d885e20f911816197c85b9d#%F0%9D%90%85%F0%9D%90%A8%F0%9D%90%AB%F0%9D%90%9E%F0%9D%90%AC%F0%9D%90%AD-%F0%9D%90%8D%F0%9D%90%A2%F0%9D%90%A0%F0%9D%90%A1%F0%9D%90%AD">𝐅𝐨𝐫𝐞𝐬𝐭 𝐍𝐢𝐠𝐡𝐭</a>
</h1>

![](https://user-images.githubusercontent.com/37491630/60754686-5174c100-9fd4-11e9-9efb-cec66f6c9062.png)

## Installation

### Via Plugin Manager

Take [vim-plug](https://github.com/junegunn/vim-plug) for example:

```vim
Plug 'sainnhe/vim-color-forest-night'
```

For better syntax highlighting support, please install [sheerun/vim-polyglot](https://github.com/sheerun/vim-polyglot).

### Manually

1. Clone this repository.
2. Copy `/path/to/vim-color-forest-night/colors/forest-night.vim` to `~/.vim/colors/forest-night.vim`
3. To install [airline](https://github.com/vim-airline/vim-airline) theme, copy `/path/to/vim-color-forest-night/autoload/airline/themes/forest_night.vim` to `~/.vim/autoload/airline/themes/forest_night.vim`
4. To install [lightline](https://github.com/itchyny/lightline.vim) theme, copy `/path/to/vim-color-forest-night/autoload/lightline/colorscheme/forest_night.vim` to `~/.vim/autoload/lightline/colorscheme/forest_night.vim`

### AUR

There are some packages available for Arch Linux users in AUR:

- [vim-colorscheme-forest-night-git](https://aur.archlinux.org/packages/vim-colorscheme-forest-night-git/)
- [vim-airline-forest-night-git](https://aur.archlinux.org/packages/vim-airline-forest-night-git/)
- [vim-lightline-forest-night-git](https://aur.archlinux.org/packages/vim-lightline-forest-night-git/)

## Usage

I've developed another version of this color scheme -- **[forest-dusk](https://user-images.githubusercontent.com/37491630/61204916-1d895200-a6de-11e9-9eb1-cfedbd538e67.png)**

The only difference between forest-night and forest-dusk is that the [color temperature](https://en.wikipedia.org/wiki/Color_temperature) of forest-dusk is lower.

forest-dusk is designed to use without [redshift](http://jonls.dk/redshift/)/[f.lux](https://justgetflux.com/), but you may not be satisfied with the temperature. I would recommend to use forest-night with redshift/f.lux, you can adjust the color temperature by yourself in this way.

To use forest-dusk instead of forest-night, replace `night` in the following steps with `dusk`.

### Vim

Put this in your vimrc:

```vim
colorscheme forest-night
```

If you want to apply this color scheme temporarily, run this command in vim:

```vim
:colorscheme forest-night
```

#### Airline

To enable [airline](https://github.com/vim-airline/vim-airline) color scheme, put this in your vimrc:

```vim
let g:airline_theme = 'forest_night'
```

To apply it without reloading:

```
:AirlineTheme forest_night
```

#### Lightline

To enable [lightline](https://github.com/itchyny/lightline.vim) color scheme, put this in your vimrc:

```vim
let g:lightline = {}
let g:lightline.colorscheme = 'forest_night'

" or this line
let g:lightline = {'colorscheme' : 'forest_night'}
```

To apply it without reloading:

```vim
:let g:lightline.colorscheme = 'forest_night'
:call lightline#init()
:call lightline#colorscheme()
```

### Tmux Status Line

Check this [gist](https://gist.github.com/sainnhe/b8240bc047313fd6185bb8052df5a8fb).

### Zsh

- [Syntax Highlighting](https://github.com/sainnhe/vim-color-forest-night/tree/master/zsh#syntax-highlighting)
- [Prompt](https://github.com/sainnhe/vim-color-forest-night/tree/master/zsh#prompt)

### Terminal Emulators

- [iTerm2](./iterm2/README.md)
- [Alacritty](./alacritty/README.md)
- [Kitty](./kitty/README.md)
- [Simple Terminal](./st/README.md)
- [Tilix](./tilix/README.md)

### Xresources

[README.md](./xresources/README.md)

### Visual Studio Code

[Forest Theme](https://marketplace.visualstudio.com/items?itemName=sainnhe.forest-theme)

## Customization

**Note:** forest-night and forest-dusk share the same global variables, you don't need to replace `night` with `dusk`.

- `g:forest_night_use_italic`: if `0`, do not use italic; if `1`, use italic. Default: `1`
- `g:forest_night_transp_bg`: if `1`, use terminal background color; if `0`, use original background color of forest-night. Default: `0`

## FAQ

**Q: It doesn't work as expected.**

**A:**

1. Although this color scheme works very well without termguicolors, if you want to make it look the same as the screenshot, you need to enable it: `:set termguicolors`

2. If the color still cannot displayed properly, check output of `vim --version`, maybe your vim doesn't support `termguicolors`

3. Maybe your terminal emulator doesn't support true colors, you can test it using [this script](https://unix.stackexchange.com/questions/404414/print-true-color-24-bit-test-pattern)

4. If you are running vim in tmux, you need to override default true colors of tmux, as tmux cannot display true color properly: [#1246 How to use true colors in vim under tmux?](https://github.com/tmux/tmux/issues/1246)

5. There are many highlight group links in syntax files while a color scheme may change them, enabling one color scheme based on another color scheme enabled is very likely to cause color broken. If there is any color broken, you can enable the color scheme in your vimrc instead of after vim startup.

**Q: What's your status line configuration?**

**A:** check this [gist](https://gist.github.com/sainnhe/b8240bc047313fd6185bb8052df5a8fb).

## Contribution

Check this gist for detailed instructions to hack this color scheme: [hack-color-schemes.md](https://gist.github.com/sainnhe/911f78cbb092ac58c8734c423a464935)

### Thanks to

[@ekomizer](https://github.com/ekomizer): simple terminal support

[@JarrettAzar](https://github.com/JarrettAzar): iterm2 support

[@termlimit](https://github.com/termlimit): airline support

## Inspirations

[rhysd/vim-color-spring-night](https://github.com/rhysd/vim-color-spring-night)

[KKPMW/sacredforest-vim](https://github.com/KKPMW/sacredforest-vim)

## License

[MIT](./LICENSE) && [Anti-996](./Anti-996-LICENSE)
