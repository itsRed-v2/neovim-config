return {
    {
        "hrsh7th/nvim-cmp",
        event = { "InsertEnter", "CmdlineEnter" },
        dependencies = {
            "hrsh7th/cmp-buffer", -- source pour compléter avec les mots déjà présents dans le buffer
            "hrsh7th/cmp-path", -- source pour compléter les chemins de fichiers
            "hrsh7th/cmp-cmdline", -- source pour les completions de la cmdline
            "hrsh7th/cmp-emoji", -- complétion d'émojis à la saisie de ":"
            "L3MON4D3/LuaSnip",
            "saadparwaiz1/cmp_luasnip",
            "rafamadriz/friendly-snippets", -- collection de snippets pratiques
            "onsails/lspkind.nvim" -- pour afficher le type de complétion un peu comme dans vscode (fonction / variable / etc ...)
        },
        config = function()
            local cmp = require('cmp')
            local luasnip = require('luasnip')
            local lspkind = require('lspkind')

            -- chargement des snippets (comme friendly-snippets)
            require('luasnip.loaders.from_vscode').lazy_load()

            -- Automatically insert '(' after selecting function or method item
            local cmp_autopairs = require('nvim-autopairs.completion.cmp')
            cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())

            cmp.setup({
                enabled = function()
                    -- disable completion in comments
                    local context = require('cmp.config.context')
                    -- keep command mode completion enabled when cursor is in a comment
                    if vim.api.nvim_get_mode().mode == 'c' then
                        return true
                    else
                        return not context.in_treesitter_capture("comment")
                                and not context.in_syntax_group("Comment")
                    end
                end,
                -- On utilise luasnip comme moteur de snippets
                snippet = {
                    expand = function(args)
                        luasnip.lsp_expand(args.body)
                    end
                },
                -- sets window styles
                window = {
                    completion = cmp.config.window.bordered(),
                    documentation = cmp.config.window.bordered(),
                },
                -- way too many mappings
                mapping = cmp.mapping.preset.insert({
                    ["<C-n>"] = cmp.mapping.select_next_item(),
                    ["<C-p>"] = cmp.mapping.select_prev_item(),
                    ["<Tab>"] = cmp.mapping.select_next_item(),
                    ["<S-Tab>"] = cmp.mapping.select_prev_item(),
                    ["<C-a>"] = cmp.mapping.scroll_docs(-1),
                    ["<C-q>"] = cmp.mapping.scroll_docs(1),
                    ["<C-Space>"] = cmp.mapping.complete(), -- ouvre la fenêtre d'auto-complétion
                    ["<C-e>"] = cmp.mapping.abort(),
                    ["<CR>"] = cmp.mapping.confirm({ select = true }), -- accepte la sélection courante
                }),
                sources = cmp.config.sources({
                    { name = 'nvim_lsp' }, -- LSP
                    { name = 'luasnip' }, -- snippets
                    { name = 'path' }, -- chemins du système de fichiers
                    { name = 'emoji' }, -- super emojis
                    { name = 'buffer' }, -- texte du buffer courant
                }),
                formatting = {
                    -- affiche un symbole ~ pour les snippets expandables
                    expandable_indicator = true,
                    -- indique le type et la source pour chaque entrée
                    format = lspkind.cmp_format({
                        mode = "symbol_text",
                        menu = {
                            nvim_lsp = "[LSP]",
                            luasnip = "[LuaSnip]",
                            path = "[Path]",
                            emoji = "[Emoji]",
                            buffer = "[Buffer]"
                        }
                    })
                }
            });

            -- '/' and '?' cmdline setup
            cmp.setup.cmdline({ '/', '?' }, {
                mapping = cmp.mapping.preset.cmdline(),
                sources = {
                    { name = "buffer" }
                }
            });

            -- ':' cmdline setup
            cmp.setup.cmdline(':', {
                mapping = cmp.mapping.preset.cmdline(),
                sources = cmp.config.sources({
                    { name = "path" }
                }, {
                    {
                        name = 'cmdline',
                        option = {
                            ignore_cmds = { '!', 'lua' },
                            treat_trailing_slash = true
                        }
                    }
                })
            });
        end
    }
}
