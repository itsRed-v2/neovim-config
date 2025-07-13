return {
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        config = function()
            local lazy_status = require("lazy.status"); -- Permet d'afficher le nombre de mises à jour plugins lazy dans la barre.

            require('lualine').setup({
                options = {
                    ignore_focus = { "neo-tree" },
                    disabled_filetypes = { "neo-tree" },
                },
                sections = {
                    lualine_a = { "mode" },
                    lualine_b = { "branch", "diff", "diagnostics" },
                    lualine_c = { { "filename", path = 1, file_status = true, newfile_status = true } },
                    lualine_x = {
                        {
                            lazy_status.updates,
                            cond = lazy_status.has_updates,
                            color = { fg = "#ff9e64" },
                        },
                        { "encoding" },
                        { "fileformat" },
                        { "filetype" },
                    },
                    lualine_y = { "filesize", "progress" },
                    lualine_z = { "location" },
                }
            });
        end
    }
}
