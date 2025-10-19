-- on définit la touche leader
vim.g.mapleader = " ";

-- press space to turn off highlighting
vim.keymap.set('n', '<leader><Space>', '<Cmd>nohlsearch<CR>', { desc = "Effacer le surlignage de la recherche" });

-- Changement de fenêtre avec Ctrl + déplacement au lieu de Ctrl-w + déplacement
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Focus sur la fenêtre à gauche" });
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Focus sur la fenêtre à droite" });
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Focus sur la fenêtre en bas" });
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Focus sur la fenêtre en haut" });

-- navigation entre les buffers
vim.keymap.set("n", "<S-l>", "<Cmd>bnext<CR>", { desc = "Focus sur le buffer à droite" });
vim.keymap.set("n", "<S-h>", "<Cmd>bprevious<CR>", { desc = "Focus sur le buffer à gauche" });

-- dans un fichier python, sauvegarder puis exécuter
vim.keymap.set("n", "<leader>R", function()
    -- check if the current buffer is for a python file
    if vim.bo.filetype == "python" then
        -- write the current buffer to the file system
        vim.cmd("w")

        -- convert keycodes to their internal representation using nvim_replace_termcodes()
        -- simulate a mapping being executed using nvim_feedkeys()
        -- the nvim command line will replace %:p with the current file's full path
        local keys = vim.api.nvim_replace_termcodes("<Cmd>!python %:p<Enter>", true, false, true)
        vim.api.nvim_feedkeys(keys, "m", false)
    else
        print("Buffer is not a python file")
    end
end, { desc = "Execute le fichier python courant" })

