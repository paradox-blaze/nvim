return {
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "master",
    build = ":TSUpdate",
    main = "nvim-treesitter.configs", -- Tells Lazy to find the module safely
    opts = {
      -- "query" is added here as it's required by Treesitter internally
      ensure_installed = { "rust","lua", "vim", "vimdoc", "c", "bash", "yaml", "query" },
      highlight = { 
        enable = true, 
      },
    },
  }
}
