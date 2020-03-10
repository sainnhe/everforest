![zsh](https://user-images.githubusercontent.com/37491630/74096717-4483f700-4afa-11ea-9018-0253d502c8f5.png)

# Syntax Highlighting

The syntax highlighting is implemented by [zdharma/fast-syntax-highlighting](https://github.com/zdharma/fast-syntax-highlighting). By using `default` theme with any terminal emulator color scheme of forest-night, you can get a forest-night syntax highlighting theme of zsh.

# Prompt

The prompt theme is forest-night version of pure power, it depends on [romkatv/powerlevel10k](https://github.com/romkatv/powerlevel10k).

To use it, simply source this file in your zshrc after powerlevel10k has been load:

```zsh
source /path/to/forest-night/zsh/.zsh-theme-forest-night
```

Alternatively, if you are using [zinit](https://github.com/zdharma/zinit)(formerly known as zplugin, [highly recommended](https://gist.github.com/laggardkernel/4a4c4986ccdcaf47b91e8227f9868ded)), you can install the theme like this:

```zsh
zinit light romkatv/powerlevel10k
zinit snippet https://github.com/sainnhe/forest-night/raw/master/zsh/.zsh-theme-forest-night
```

## Customization

There are three modes of this prompt theme:

```zsh
PURE_POWER_MODE=modern    # use nerdfont characters in the prompt(default)
PURE_POWER_MODE=fancy     # use unicode characters in the prompt
PURE_POWER_MODE=portable  # use only ascii characters in the prompt
```

To switch between them, edit `/path/to/forest-night/zsh/.zsh-theme-forest-night`, and change the value of `PURE_POWER_MODE`.
