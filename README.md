# Welcome to my neovim config

## Here's a guide on how to use my config (or at least the most important stuff you need to know)

### IMPORTANT: config requires Nvim 0.11+
### Recomended: brew install nvim to get latest version or build from source 

### First let's understand the file structure:
(Leader key is space in case you didn't know)

Inside the nvim/ directory you have init.lua through which your lazy plugins load through automatically

recommended not to touch this file

inside the lua/ directory we have:
_lua/plugins_
_lua/config_

#### lua/config:

This contains only one file; options.lua
This file can be used to change keybindings and setting leader key, tabs, textwrapping, line numbering etc


#### lua/plugins:

This contains multiple files for handling plugins
lazy.nvim reads directly through this directory and loads the plugins automatically 


#### plugins:
**blink.lua** - Drop down menu for autocomplete (both enter and tab autocompletes)

**autopairs.lua** - Automatically completes brackets and quotes and places the cursor inside

**theme.lua** - dracula theme is set by default 

**treesitter.lua** - tells the lsp how to highlight and color the keywords properly within a language, if a new language is required just add the language inside "ensure_installed"

**lsp.lua** -
1. Automatically handles lsp configuration through _nvim-lspconfig_ (not using mason right now instead manually installing lsps)
2. Add a language inside _vim.lsp.enable()_ once the language server and the compiler is installed (make sure to also add it in treesitter.lua as previously mentioned)

3. _]d_ and _[d_ to go back and forth between diagnostics
4. _<leader>+e_ to open a floating diagnostics window
5. _gd_ to go to definition of anything

**telescope.lua** -
1. Telescope is your fuzzy finder, can search inside the file as well as across files
2. _<leader>+/_ to fuzzy search inside the file. _<leader>+s+f_ to open a buffer to find files within the directory and _<leader>+s+g_ to search for text within files inside the directory
3. When cursor is on a word and you want to find and replace, _<leader>+r+w_ to perform a confirmation action to replace all instances

(there's a lot more since this was directly taken from TJ's config from kickstart.nvim, read through the official docs to know more)

**surround.lua** -
1. surround.nvim lets you add things around anything
2. In normal mode _ys_ puts in surround mode, _iw_ (in word) selects inside the word and now any key pressed (example ",',brackets etc..) will surround the word selected
3. In normal mode _cs_ can be used to change what is already surrounding the word (example cs"' changes a word surrounded by double quotes to a word surrounded by single quotes)
4. In visual mode _S_ can be used to surround a selected item. (example hello is selected in visual mode, _S"_ surrounds hello in double quotes)


That's all the important information required to use and make this config your own,

Enjoy!



