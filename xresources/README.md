# Installation

## Method 1

Copy the content of the [forest-night.Xresources](./forest-night.Xresources) into the `~/.Xresources` file and reload the settings with `xrdb`.

## Method 2

Add the following line to `~/.Xresources`:

```xdefaults
#include "/path/to/vim-color-forest-night/xresources/forest-night.Xresources"
```

## Method 3

Execute the following command:

```sh
xrdb -merge /path/to/vim-color-forest-night/xresources/forest-night.Xresources
```
