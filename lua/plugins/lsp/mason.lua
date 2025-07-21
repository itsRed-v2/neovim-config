return {
    "mason-org/mason.nvim",
    dependencies = {
        "mason-org/mason-lspconfig.nvim"
    },
    config = function()
        local mason = require("mason");
        local mason_lspconfig = require("mason-lspconfig");

        -- Active mason et personnalise les icones
        mason.setup({
            ui = {
                icons = {
                    package_installed = "✓",
                    package_pending = "➜",
                    package_uninstalled = "✗",
                }
            }
        });

        mason_lspconfig.setup({
            -- activer automatiquement les LSP lorsqu'on ouvre un buffer
            automatic_enable = true,
            -- liste des LSP à installer par défaut
            ensure_installed = {
                "clangd",
                "lua_ls"
            }
        });
    end
}
