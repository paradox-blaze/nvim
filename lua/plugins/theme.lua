-- ~/.config/nvim/lua/plugins/theme.lua
return {
  {
    "rose-pine/neovim",
    name = "rose-pine",
    lazy = false,
    priority = 1000,
    config = function()
      require("rose-pine").setup({
        variant = "main", -- 'main', 'moon', or 'dawn' (Primeagen uses 'main')
        dark_variant = "main",
        
        styles = {
          bold = true,
          italic = true,       -- Replaces your italic_comment preference
        },
        
        -- If you still find some elements (like floating windows) aren't 
        -- perfectly transparent, you can override them here instead of using vim.api
        highlight_groups = {
          NormalFloat = { bg = "NONE" },
          FloatBorder = { bg = "NONE" },
          -- Example of how to override a specific Treesitter/LSP token if you 
          -- want to tweak Rosé Pine's defaults later:
          -- ["@variable.parameter"] = { fg = "iris", italic = true },
        }
      })

      vim.cmd("colorscheme rose-pine")
    end,
  }
}
