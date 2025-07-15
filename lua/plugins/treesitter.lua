return {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = ":TSUpdate",
    config = function()
        require("nvim-treesitter.configs").setup({
            -- activation de la coloration syntaxique
            highlight = { enable = true },

            -- activation de l'indentation améliorée
            indent = { enable = true },

            -- lors de l'appui sur <Ctrl-space> sélectionne le bloc
            -- courant spécifique au langage de programation
            incremental_selection = {
                enable = true,
                keymaps = {
                    init_selection = "<C-space>", -- set to `false` to disable one of the mappings
                    node_incremental = "<C-space>",
                    scope_incremental = false,
                    node_decremental = "<bs>",
                },
            },

            -- langages installés
            ensure_installed = {
                "bash",
                "dockerfile",
                "gitignore",
                "html",
                "javascript",
                "typescript",
                "json",
                "markdown",
                "markdown_inline",
                "python",
                "rust",
                "cpp",
                "c",
                "lua",
                "vim",
                "yaml",
                "haskell",
            },
        })
    end
}
