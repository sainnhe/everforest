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

### Vim

Put this in your vimrc:

```vim
set termguicolors

colorscheme forest-night
```

If you want to apply this color scheme temporarily, run this command in vim(**This may cause color broken!**):

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

## Related Projects

### Code Editor

- [Visual Studio Code](https://marketplace.visualstudio.com/items?itemName=sainnhe.forest-theme)

### Terminal Emulators

- [Alacritty](https://gist.github.com/sainnhe/d679231c979ecf021d64c7abf5906ba7)
- [iTerm2](https://gist.github.com/sainnhe/40932671ba2d6f5911612353cd9e7669)
- [Kitty](https://gist.github.com/sainnhe/28dd0cf4f1adde7c297a7fec58355a5e)
- [Simple Terminal](https://gist.github.com/sainnhe/b926fd335c2ae32dee4bbe67e0078877)
- [Tilix](https://gist.github.com/sainnhe/cca571b1d918d49de73246c0bf642438)

### Others

- [Xresources](https://gist.github.com/sainnhe/01f266092eac1aae15136b5bda879bad)
- [Zsh](https://gist.github.com/sainnhe/9323c258a1bee2085cc14114b782bb3e)
- [Tmux](https://gist.github.com/sainnhe/01f266092eac1aae15136b5bda879bad)

## FAQ

**Q: It doesn't work as expected.**

**A:**

1. This color scheme is mainly designed for true colors, `set termguicolors` is required. Check output of `vim --version`, maybe your vim doesn't support `termguicolors`

2. Maybe your terminal emulator doesn't support true colors, you can test it using [this script](https://unix.stackexchange.com/questions/404414/print-true-color-24-bit-test-pattern)

3. If you are running vim in tmux, you need to override default true colors of tmux, as tmux cannot display true color properly: [#1246 How to use true colors in vim under tmux?](https://github.com/tmux/tmux/issues/1246)

4. There are many highlight group links in syntax files while a color scheme may change them, enabling one color scheme based on another color scheme enabled is very likely to cause color broken. If there is any color broken, you can enable the color scheme in your vimrc instead of after vim startup.

**Q: What's your status line configuration?**

**A:** check this [gist](https://gist.github.com/sainnhe/b8240bc047313fd6185bb8052df5a8fb).

**Q: What's the font used here?**

**A:** [Fira Code Nerd Font](https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/FiraCode).

## Contribution

Check this gist for detailed instructions to hack this color scheme: [hack-color-schemes.md](https://gist.github.com/sainnhe/911f78cbb092ac58c8734c423a464935)

### Thanks to

[@termlimit](https://github.com/termlimit): airline support

## Inspirations

[rhysd/vim-color-spring-night](https://github.com/rhysd/vim-color-spring-night)

[KKPMW/sacredforest-vim](https://github.com/KKPMW/sacredforest-vim)

## License

[MIT](./LICENSE) && [Anti-996](./Anti-996-LICENSE)
