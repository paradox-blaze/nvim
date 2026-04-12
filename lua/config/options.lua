-- ~/.config/nvim/lua/config/options.lua
vim.opt.wrap = true
vim.opt.linebreak = true
vim.opt.breakindent = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.termguicolors = true -- Essential for modern themes like Poimandres
vim.g.mapleader = " "
-- Indentation (optional but recommended standard)
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
-- Tab to cycle through the popup menu
vim.keymap.set('i', '<Tab>', function()
  return vim.fn.pumvisible() == 1 and "<C-n>" or "<Tab>"
end, { expr = true })

vim.keymap.set('i', '<S-Tab>', function()
  return vim.fn.pumvisible() == 1 and "<C-p>" or "<S-Tab>"
end, { expr = true })

-- Enter to confirm selection
vim.keymap.set('i', '<CR>', function()
  return vim.fn.pumvisible() == 1 and "<C-y>" or "<CR>"
end, { expr = true })

vim.keymap.set('n', '<leader>y', '"+y', { noremap = true, silent = true })
vim.keymap.set('v', '<leader>y', '"+y', { noremap = true, silent = true })

