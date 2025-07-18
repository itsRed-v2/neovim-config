return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "MunifTanjim/nui.nvim",
    },
    config = function()
        require("neo-tree").setup({
            close_if_last_window = true,
            window = {
                width = 35
            },
            filesystem = {
                position = "current",
            }
        })

        vim.keymap.set("n", "<leader>t", "<Cmd>Neotree toggle<CR>", { desc = "Ouvrir / fermer l'explorateur de fichiers " });
        vim.keymap.set("n", "<leader>b", "<Cmd>Neotree toggle show buffers right<CR>", { desc = "Ouvrir/fermer les buffers" });
        vim.keymap.set("n", "<leader>s", "<Cmd>Neotree float git_status<CR>", { desc = "Ouvrir/fermer le git status" });
    end,
}
