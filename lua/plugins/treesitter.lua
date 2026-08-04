return {
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "master",
    build = ":TSUpdate",
    main = "nvim-treesitter.configs",
    opts = {
      ensure_installed = {
        -- Web / config
        "json", "yaml", "toml", "html", "css",
        -- Systems
        "c", "rust", "bash",
        -- Scripting / data science
        "python", "lua",
        -- Markup / docs
        "markdown", "markdown_inline", "rst",
        -- Nvim internals
        "vim", "vimdoc", "query",
        -- Misc
        "regex", "diff",
      },
      highlight = {
        enable = true,
        -- Keeps regex-based rules as a fallback for anything treesitter misses
        additional_vim_regex_highlighting = { "python", "markdown" },
      },
      indent = {
        enable = true,
      },
    },
  },
}
