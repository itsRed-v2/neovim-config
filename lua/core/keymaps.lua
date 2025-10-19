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

-- si dans un fichier python, executer le fichier
vim.keymap.set("n", "<leader>R", function()
    -- check if the current buffer is for a python file
    if vim.bo.filetype == "python" then
        -- get the internal representation of the "enter" key
        local key = vim.api.nvim_replace_termcodes("<Enter>", true, false, true)
        -- simulate a mapping being executed using nvim_feedkeys()
        -- %:p is getting replaced by the nvim command line by the current buffer's file full path
        vim.api.nvim_feedkeys(":!python %:p"..key, "m", false)
    else
        print("Buffer is not a python file")
    end
end, { desc = "Execute le fichier python courant" })

