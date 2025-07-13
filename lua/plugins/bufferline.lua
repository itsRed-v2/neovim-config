return {
    "akinsho/bufferline.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    version = "*",
    opts = {
        options = {
            separator_style = "slant",
            offsets = {
                { filetype =  "neo-tree", text = "File Explorer", highlight = "WarningMsg", padding = 1 },
            },
        }
    }
}
