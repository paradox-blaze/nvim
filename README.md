# Neovim Configuration

Welcome to my **Neovim configuration**.

This guide explains the basic structure of the config and the most
important keybindings so you can start using or modifying it quickly.

------------------------------------------------------------------------

# Requirements

-   **Neovim 0.11+ required**
-   Recommended install:

``` bash
brew install neovim
```

or build Neovim from source to get the newest version.

------------------------------------------------------------------------

# Leader Key

The **leader key is `Space`**.

Example:

    Space + s + f

means press:

    Space → s → f

------------------------------------------------------------------------

# File Structure

Inside the `nvim/` directory you will find:

    nvim/
    │
    ├── init.lua
    └── lua/
        ├── config/
        │   └── options.lua
        │
        └── plugins/
            ├── autopairs.lua
            ├── blink.lua
            ├── lsp.lua
            ├── surround.lua
            ├── telescope.lua
            ├── theme.lua
            └── treesitter.lua

------------------------------------------------------------------------

# init.lua

`init.lua` bootstraps the plugin manager and loads plugins
automatically.

It uses **lazy.nvim** to load everything from the `lua/plugins`
directory.

**Recommended: do not modify this file.**

------------------------------------------------------------------------

# lua/config

This directory contains configuration files.

### options.lua

Handles general Neovim settings such as:

-   keybindings
-   leader key
-   tabs / indentation
-   text wrapping
-   line numbers
-   general editor behavior

This is the place to change **core editor preferences**.

------------------------------------------------------------------------

# lua/plugins

Each file inside this directory configures a plugin.

`lazy.nvim` automatically reads this directory and loads every plugin
defined here.

------------------------------------------------------------------------

# Plugin Overview

## blink.lua

Provides **autocomplete dropdown menus**.

Features:

-   LSP-based completion
-   Tab to accept suggestions (Enter no longer accepts)
-   Fast fuzzy matching

------------------------------------------------------------------------

## autopairs.lua

Automatically inserts matching characters.

Examples:

    ( → ()
    { → {}
    " → ""
    ' → ''

Cursor is automatically placed inside the pair.

------------------------------------------------------------------------

## theme.lua

Sets the default theme.

Current theme:

-   **Rosé Pine** (variant: `main`)

Rosé Pine provides built-in support for transparent backgrounds via
`NormalFloat` and `FloatBorder` highlight group overrides — no manual
`vim.api.nvim_set_hl` calls needed.

------------------------------------------------------------------------

## treesitter.lua

Configures **Treesitter syntax highlighting**.

Treesitter provides:

-   better syntax highlighting
-   improved code parsing
-   language-aware editing
-   tree-based indentation

Currently installed parsers:

    json, yaml, toml, html, css
    c, rust, bash
    python, lua
    markdown, markdown_inline, rst
    vim, vimdoc, query
    regex, diff

To add support for a new language:

1.  Open `treesitter.lua`
2.  Add the language to `ensure_installed`

------------------------------------------------------------------------

## lsp.lua

Handles **Language Server Protocol (LSP)** configuration.

LSP servers are now managed through **Mason** — no manual installation
required for most servers.

### Mason

[mason.nvim](https://github.com/williamboman/mason.nvim) installs and
manages LSP servers automatically inside Neovim. Open the Mason UI with:

    :Mason

[mason-lspconfig.nvim](https://github.com/williamboman/mason-lspconfig.nvim)
bridges Mason with `nvim-lspconfig` and auto-installs the following
servers on startup:

    pyright   → Python
    lua_ls    → Lua
    yamlls    → YAML

### Manually managed servers

The following are installed outside Mason and configured directly:

    clangd         → C / C++
    rust_analyzer  → Rust

### Adding a new language (Mason)

1.  Add the server name to `ensure_installed` in the
    `mason-lspconfig` opts block inside `lsp.lua`
2.  Add the language parser to `treesitter.lua`
3.  Restart Neovim — Mason installs the server automatically

### LSP Keybindings

Diagnostics navigation:

    ]d  → next diagnostic
    [d  → previous diagnostic

Diagnostics window:

    Space + e

Go to definition:

    gd

Find references:

    gr

Go to implementation:

    gi

Rename symbol:

    Space + rn

Code actions:

    Space + ca

------------------------------------------------------------------------

## telescope.lua

Telescope is the **fuzzy finder** used for searching files, text, and
symbols. Hidden files are included in search results by default.

### Search inside the current file

    Space + /

### Find files in the project

    Space + s + f

### Search text across the project

    Space + s + g

### Find and replace word under cursor

    Space + r + w

This will:

1.  Prompt for replacement text
2.  Confirm each replacement

The Telescope configuration was originally based on **kickstart.nvim by
TJ DeVries**, so many additional features are available.

------------------------------------------------------------------------

## surround.lua

Provides **surround editing** functionality.

You can quickly add, change, or remove surrounding characters like
quotes or brackets.

### Surround a word

Normal mode:

    ys

Example:

    ysiw"

Result:

    hello → "hello"

### Change surrounding characters

Normal mode:

    cs

Example:

    cs"'

Changes:

    "hello" → 'hello'

### Surround visual selection

Visual mode:

    S

Example:

    Select: hello
    S"

Result:

    "hello"

------------------------------------------------------------------------

# Final Notes

This configuration is meant to be:

-   simple
-   fast
-   easy to extend

Feel free to modify the plugins or add new ones to suit your workflow.

And remember,

READ THE FRIENDLY MANUAL ;)

------------------------------------------------------------------------

Enjoy!
