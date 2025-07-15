return {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
        "nvim-tree/nvim-web-devicons",
    },
    config = function()
        local telescope = require("telescope");
        local actions = require("telescope.actions");
        local builtin = require("telescope.builtin");

        telescope.setup({
            defaults = {

                -- Parce que c'est joli
                prompt_prefix = "  ",
                selection_caret = "» ",
                path_display = { "truncate" },

                mappings = {
                    i = {
                        ["<C-j>"] = actions.move_selection_next,
                        ["<C-k>"] = actions.move_selection_previous,
                    },
                },
            },
        });

        telescope.load_extension('fzf');

        vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = 'Telescope: Recherche de fichiers' });
        vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = 'Telescope: Recherche de chaînes dans le contenu des fichiers' });
        vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = 'Telescope: Recherche de buffers' });
        vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = 'Telescope: Recherche dans le help' });
        vim.keymap.set("n", "<leader>fx", builtin.grep_string, { desc = 'Telescope: Recherche la chaîne sous le curseur dans le dossier courant' });
        vim.keymap.set("n", "<leader>fv", builtin.treesitter, { desc = 'Telescope: Recherche de symboles du fichier courant avec treesitter' });
    end
}
