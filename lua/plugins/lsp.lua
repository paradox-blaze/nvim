-- Diagnostic display
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

-- Diagnostic navigation
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float)
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist)

return {
    -- ── Mason: installs and manages LSP servers ───────────────────────────
    {
        "williamboman/mason.nvim",
        build = ":MasonUpdate",
        opts = {
            ui = {
                border = "rounded",
                icons = {
                    package_installed   = "✓",
                    package_pending     = "➜",
                    package_uninstalled = "✗",
                },
            },
        },
    },

    -- ── mason-lspconfig: bridges Mason installs → lspconfig ───────────────
    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = { "williamboman/mason.nvim" },
        opts = {
            ensure_installed = {
                "pyright",
                "lua_ls",
                "yamlls",
            },
            automatic_installation = true,
        },
    },

    -- ── nvim-lspconfig: server configuration ─────────────────────────────
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
        },
        config = function()
            -- Servers that need no special config
            local simple_servers = { "pyright", "lua_ls", "yamlls" }
            for _, server in ipairs(simple_servers) do
                vim.lsp.config(server, {})
            end

            -- Manually managed (not through Mason)
            vim.lsp.config("clangd", {
                cmd = { "clangd" },
                filetypes = { "c", "cpp" },
                root_markers = { "compile_commands.json", ".git" },
            })
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

            -- Keymaps + semantic token colours on attach
            vim.api.nvim_create_autocmd("LspAttach", {
                callback = function(ev)
                    local opts = { buffer = ev.buf }

                    vim.keymap.set("n", "K",          vim.lsp.buf.hover,       opts)
                    vim.keymap.set("n", "gd",         vim.lsp.buf.definition,  opts)
                    vim.keymap.set("n", "gr",         vim.lsp.buf.references,  opts)
                    vim.keymap.set("n", "gi",         vim.lsp.buf.implementation, opts)
                    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename,      opts)
                    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)

                    -- Let the colorscheme drive semantic token colours.
                    -- Without this, LSP-provided type/parameter/decorator info
                    -- is ignored and everything looks flat.
                    local client = vim.lsp.get_client_by_id(ev.data.client_id)
                    if client and client.supports_method("textDocument/semanticTokens") then
                        client.server_capabilities.semanticTokensProvider = client.server_capabilities.semanticTokensProvider
                    end
                end,
            })
        end,
    },
}
