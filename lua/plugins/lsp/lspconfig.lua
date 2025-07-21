return {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        -- Permet d'utiliser les résultats du LSP dans la complétion automatique
        "hrsh7th/cmp-nvim-lsp",
        -- Ajoute les "code actions" de type renommage de fichiers intelligent, etc
        { "antosha417/nvim-lsp-file-operations", config = true },
        -- Utile pour éditer les fichiers lua spécifique à la configuration neovim
        -- Permet notamment d'éviter le "Undefined global `vim`"
        { "folke/lazydev.nvim", opts = {} },
    },
    keys = {
        { "<leader>ca", vim.lsp.buf.code_action, desc = "Code Action", mode = { "n", "v" } },
        { "gR", "<Cmd>Telescope lsp_references<CR>", desc = "Show LSP references", mode = "n" },
        { "gD", vim.lsp.buf.declaration, desc = "Go to declaration", mode = "n" },
        { "gd", "<Cmd>Telescope lsp_definitions<CR>", desc = "Show LSP definitions", mode = "n" },
        { "gi", "<Cmd>Telescope lsp_implementations<CR>", desc = "Show LSP implementations", mode = "n" },
        { "gt", "<Cmd>Telescope lsp_type_definitions<CR>", desc = "Show LSP type definitions", mode = "n" },
        { "gs", vim.lsp.buf.signature_help, desc = "Show LSP signature help", mode = "n" },
        { "<leader>rn", vim.lsp.buf.rename, desc = "Smart rename", mode = "n" },
        { "<leader>D", "<Cmd>Telescope diagnostics bufnr=0<CR>", desc = "Show buffer diagnostics", mode = "n" },
        { "<leader>d", vim.diagnostic.open_float, desc = "Show line diagnostics", mode = "n" },
        { "K", vim.lsp.buf.hover, desc = "Show documentation for symbol under cursor", mode = "n" },
        { "<leader>F", vim.lsp.buf.format, desc = "Format buffer", mode = { "n", "x" } },
        { "<leader>rs", ":LspRestart<CR>", desc = "Restart LSP", mode = "n" },
    },
    config = function()
        -- Customize error signs
        vim.diagnostic.config({
            signs = {
                text = {
                    [vim.diagnostic.severity.ERROR] = "",
                    [vim.diagnostic.severity.WARN] = "",
                    [vim.diagnostic.severity.INFO] = "",
                    [vim.diagnostic.severity.HINT] = "󰌵",
                }
            }
        });
    end
}
