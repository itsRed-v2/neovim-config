return {
    {
        "VonHeikemen/lsp-zero.nvim",
        branch = "v4.x",
        dependencies = {
            "neovim/nvim-lspconfig",
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
        },
        config = function()
            local lsp_zero = require("lsp-zero")
            local lsp_config = require("lspconfig")

            lsp_zero.on_attach(function(client, bufnr)
                lsp_zero.default_keymaps({ buffer = bufnr })
            end)

            require("mason").setup({})
            require("mason-lspconfig").setup({
                ensure_installed = {
                    "lua_ls",
                },
                handlers = {
                    -- a default handler, apply to every language
                    -- server without a custom handler
                    function(server_name)
                        lsp_config[server_name].setup({})
                    end,

                    -- Lua
                    lua_ls = function()
                        lsp_config.lua_ls.setup({
                            settings = {
                                Lua = {
                                    diagnostics = {
                                        globals = { "vim" }
                                    }
                                }
                            }
                        })
                    end,
                }
            })

        end
    }
}
