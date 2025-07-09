return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
        require("nvim-treesitter.configs").setup({
            ensure_installed = { "python", "javascript", "cpp", "c", "lua" },
            highlight = {
                enable = true,
            }
        })
    end
}
