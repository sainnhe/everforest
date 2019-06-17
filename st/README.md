## Installation

1. Download the file `st-forest-night.diff`.
	- Curl: `curl -O https://raw.githubusercontent.com/sainnhe/vim-color-forest-night/master/st/st-forest-night.diff`
2. Change working directory the path of `st`.
	- `cd */path/to/st*`
3. Patch `st`.
	- `patch -Np1 < */path/to/st-forest-night.diff*`
4. Compile.
	- `sudo make clean install`
