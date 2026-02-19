return {
  {
    "saghen/blink.cmp",
    version = "*",
    opts = {
      keymap = {
        preset = "none",

        ["<C-n>"] = { "select_next" },
        ["<C-p>"] = { "select_prev" },

        ["<CR>"] = { "accept", "fallback" },
        ["<Tab>"] = { "accept", "fallback" },
      },

      completion = {
        menu = {
          border = "rounded",
        },
      },
    },
  },
}

