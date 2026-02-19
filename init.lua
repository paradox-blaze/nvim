-- 1. Load options (line numbers, etc.)
require("config.options")
-- 2. Bootstrap Lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", 
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- 3. Load Plugins
-- This tells Lazy to look inside "lua/plugins/" and load every file it finds there.
require("lazy").setup("plugins")
