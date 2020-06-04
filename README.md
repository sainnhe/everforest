<h1 align="center">
𝐅𝐨𝐫𝐞𝐬𝐭 𝐍𝐢𝐠𝐡𝐭
</h1>

![demo](https://user-images.githubusercontent.com/37491630/74209833-5217b900-4c81-11ea-86e2-3727fdfc3233.png)

## Features

- Green based but warm-toned.
- Designed to have soft contrast for eye protection.
- Works well with [redshift](https://github.com/jonls/redshift) and [f.lux](https://justgetflux.com).
- Customizable.
- Rich support for common file types and plugins.
- [Italic support](https://github.com/sainnhe/icursive-nerd-font) 🎉

## Installation

### Via Plugin Manager

Take [vim-plug](https://github.com/junegunn/vim-plug) for example:

```vim
Plug 'sainnhe/forest-night'
```

For better syntax highlighting support, please install [sheerun/vim-polyglot](https://github.com/sheerun/vim-polyglot).

### Manually

1. Clone this repository.
2. Copy `/path/to/forest-night/colors/forest-night.vim` to `~/.vim/colors/forest-night.vim`
3. To install [airline](https://github.com/vim-airline/vim-airline) theme, copy `/path/to/forest-night/autoload/airline/themes/forest_night.vim` to `~/.vim/autoload/airline/themes/forest_night.vim`
4. To install [lightline](https://github.com/itchyny/lightline.vim) theme, copy `/path/to/forest-night/autoload/lightline/colorscheme/forest_night.vim` to `~/.vim/autoload/lightline/colorscheme/forest_night.vim`

### AUR

There are some packages available for Arch Linux users in AUR:

- [vim-colorscheme-forest-night-git](https://aur.archlinux.org/packages/vim-colorscheme-forest-night-git/)
- [vim-airline-forest-night-git](https://aur.archlinux.org/packages/vim-airline-forest-night-git/)
- [vim-lightline-forest-night-git](https://aur.archlinux.org/packages/vim-lightline-forest-night-git/)

## Usage

### Vim

Put this in your vimrc:

```vim
" important!!
set termguicolors

" the configuration options should be placed before `colorscheme forest-night`
let g:forest_night_enable_italic = 1
let g:forest_night_disable_italic_comment = 1

colorscheme forest-night
```

See [Configuration](https://github.com/sainnhe/forest-night#configuration) for more configuration options.

If you want to apply this color scheme temporarily, run this command in vim(**this may cause color broken**):

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

#### Configuration

**Note:** The configuration options should be placed before `colorscheme forest-night` .

- `g:forest_night_transparent_background`: Set to `1` to enable transparent background.
  - Available values: `0`, `1`
  - Default value: `0`
- `g:forest_night_disable_italic_comment`: Set to `1` to disable italic in `Comment` .
  - Available values: `0`, `1`
  - Default value: `0`
- `g:forest_night_enable_italic`: Set to `1` to italicize keywords. This option is designed to use with fonts that support cursive italic styles, for example [Fira Code iCursive Op](https://github.com/sainnhe/icursive-nerd-font).
  - Available values: `0`, `1`
  - Default value: `0`
- `g:forest_night_cursor`: Customize the cursor color, only works in GUI clients.
  - Available values: `'auto'`, `'red'`, `'green'`, `'blue'`, `'purple'`
  - Default value: `'auto'`
- `g:forest_night_current_word`: Some plugins can highlight the word under current cursor(for example [neoclide/coc-highlight](https://github.com/neoclide/coc-highlight)), you can use this option to control their behavior.
  - Available values: `'bold'`, `'underline'`, `'italic'`, `'grey background'`
  - Default value: `'grey background'` when not in transparent mode, `'bold'` when in transparent mode.
- `g:forest_night_lightline_disable_bold`: Set to `1` to disable bold in lightline theme.
  - Available values: `0`, `1`
  - Default value: `0`

## FAQ

**Q: It doesn't work as expected.**

**A:**

1. This color scheme is mainly designed for true colors, `set termguicolors` is required. Check output of `vim --version`, maybe your vim doesn't support `termguicolors`.
2. Maybe your terminal emulator doesn't support true colors, you can test it using [this script](https://unix.stackexchange.com/questions/404414/print-true-color-24-bit-test-pattern).
3. If you are running vim in tmux, you need to override default true colors of tmux, as tmux cannot display true colors properly: [#1246 How to use true colors in vim under tmux?](https://github.com/tmux/tmux/issues/1246)
4. There are many highlight group links in syntax files while a color scheme may change them, enabling one color scheme based on another color scheme enabled is very likely to cause colors to break. If any color is broken, you can enable the color scheme in your vimrc instead of after vim startup.

**Q: I can't apply airline/lightline color scheme.**

**A:** The name is `forest_night` instead of `forest-night`. I have to use underline for some grammatical reasons.

**Q: How to enable cursive italic keywords?**

**A:**

1. Install a font that supports cursive italics, for example [icursive-nerd-font](https://github.com/sainnhe/icursive-nerd-font).
2. Enable italic keywords in this color scheme: `let g:forest_night_enable_italic = 1`
3. Disable italic comment(optional): `let g:forest_night_disable_italic_comment = 1`

**Q: What's the font used here?**

**A:** [InconsolataLGC iCursive Op](https://github.com/sainnhe/icursive-nerd-font).

**Q: What's your status line configuration?**

**A:** See this [article](https://www.sainnhe.dev/post/status-line-config/).

## Related Projects

- [Alacritty](./alacritty/README.md)
- [Alfred](./alfred/README.md)
- [Tilix](./tilix/README.md)
- [Tmux](https://www.sainnhe.dev/post/status-line-config/)
- [Visual Studio Code](https://github.com/sainnhe/forest-night-vscode)
- [Zsh](./zsh/README.md)

## More Color Schemes

- [Gruvbox Material](https://github.com/sainnhe/gruvbox-material)
- [Edge](https://github.com/sainnhe/edge)
- [Sonokai](https://github.com/sainnhe/sonokai)

## Inspirations

- [rhysd/vim-color-spring-night](https://github.com/rhysd/vim-color-spring-night)
- [KKPMW/sacredforest-vim](https://github.com/KKPMW/sacredforest-vim)
- [sainnhe/gruvbox-material](https://github.com/sainnhe/gruvbox-material)

## License

[MIT](./LICENSE) © sainnhe
