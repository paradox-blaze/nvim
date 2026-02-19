-- ~/.config/nvim/lua/plugins/theme.lua
return {
  {
    "Mofiqul/dracula.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("dracula").setup({
        -- This enables the transparency you wanted earlier
        transparent_bg = true, 
        -- Optional: makes comments italicized for a cleaner look
        italic_comment = true, 
      })
      

      vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
      vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
      vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" }) -- Keeps the gutter transparent
      vim.api.nvim_set_hl(0, "LineNr", { bg = "none" })     -- Keeps line numbers transparent

      -- Load the colorscheme
      vim.cmd("colorscheme dracula")
    end,
  }
}









