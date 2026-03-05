vim.diagnostic.config({
    virtual_text = {
        spacing = 2,
    },
    underline = true,
    signs = true,
    float = {
        border = "rounded",
        source = "if_many",
        wrap = true,
        focusable = false,
    },
})

vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float)
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist)

return {
    {
        "neovim/nvim-lspconfig",
        config = function()
            vim.lsp.config("rust_analyzer", {
                cmd = { "rust-analyzer" },
                filetypes = { "rust" },
                root_markers = { "Cargo.toml", ".git" },
            })
            vim.lsp.enable({
                "lua_ls",
                "pyright",
                "yamlls",
                "clangd",
                "rust_analyzer",
            })

            vim.api.nvim_create_autocmd("LspAttach", {
                callback = function(ev)
                    local opts = { buffer = ev.buf }

                    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
                    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
                    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
                    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
                end,
            })
        end,
    },
}
