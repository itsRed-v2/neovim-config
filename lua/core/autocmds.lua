-- create autocmd running when a new buffer is open for a ".py" file
vim.api.nvim_create_autocmd({ "BufNewFile", "BufReadPre" }, {
    pattern = "*.py",
    callback = function()
        -- Keymap to save and run the python file
        vim.keymap.set("n", "<leader>R", "<Cmd>w<Enter><Cmd>!python %:p<Enter>", {
            desc = "Executer le fichier python",
            buffer = true -- Make the keymap buffer-local
        });
    end
});
