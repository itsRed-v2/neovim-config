return {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    ---@type snacks.Config
    opts = {
        bufdelete = { enabled = true },
        scroll = { enabled = true },
        indent = {
            scope = {
                hl = "SnacksIndent2",
            },
        },
    },
    keys = {
        { "<leader>x", function() Snacks.bufdelete.delete() end, desc = "Close current buffer without closing current window." },

    }
}
