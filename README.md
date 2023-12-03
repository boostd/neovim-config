## Installation

Packer should bootstrap itself on first startup. If it doesn't, follow instructions from [Packer documentation](https://github.com/wbthomason/packer.nvim). 
Then run `:PackerSync` to download plugins. Neovim should be functional after a restart.

`:Mason` can be used to install additional LSPs.

### WINDOWS
Getting treesitter working is a hassle. Try these 3 things:

- `npm install -g tree-sitter`
- `npm install -g tree-sitter-cli`
- Make sure that "clang" is set as the compiler in treesitter.lua
- Read [this answer](https://stackoverflow.com/a/72458912) for info about installing and using clang compiler on Windows
    - Basically make sure that VS C++ build tools and clang build tools are installed and added to path
    - Maybe also add clang through choco `choco install clang`
- Run `:TSUpdate` to get and compile new parsers
    - Alternatively run `:TSInstall *language*` to get and compile the new parser (might be necessary for specific languages)

`:checkhealth` will still stay in the warning state, don't be alarmed by that.
