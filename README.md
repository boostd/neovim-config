## Installation

**WINDOWS**
Getting treesitter working is a hassle. Try these 3 things:

- `npm install -g tree-sitter`
- Make sure that "clang" is set as the compiler in treesitter.lua
- Read [this answer](https://stackoverflow.com/a/72458912) for info about installing and using clang compiler on Windows
    - Basically make sure that VS C++ build tools and clang build tools are installed and added to path
    - Maybe also add clang through choco `choco install clang`
- Run `:TSInstall *language*` to get and compile the new parser
