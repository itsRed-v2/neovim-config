-- on définit la touche leader
vim.g.mapleader = " ";

-- press space to turn off highlighting
vim.keymap.set('n', '<leader><Space>', '<Cmd>nohlsearch<CR>', { desc = "Effacer le surlignage de la recherche" });

-- Changement de fenêtre avec Ctrl + déplacement au lieu de Ctrl-w + déplacement
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Focus sur la fenêtre à gauche" });
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Focus sur la fenêtre à droite" });
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Focus sur la fenêtre en bas" });
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Focus sur la fenêtre en haut" });
-- De même depuis le mode Terminal
vim.keymap.set("t", "<C-h>", "<C-\\><C-n><C-w>h", { desc = "Focus sur la fenêtre à gauche en mode Terminal" });
vim.keymap.set("t", "<C-l>", "<C-\\><C-n><C-w>l", { desc = "Focus sur la fenêtre à droite en mode Terminal" });
vim.keymap.set("t", "<C-j>", "<C-\\><C-n><C-w>j", { desc = "Focus sur la fenêtre en bas en mode Terminal" });
vim.keymap.set("t", "<C-k>", "<C-\\><C-n><C-w>k", { desc = "Focus sur la fenêtre en haut en mode Terminal" });

-- sortir du mode TERMINAL
vim.keymap.set('t', '<Esc><Esc>', [[<C-\><C-n>]])

-- navigation entre les buffers
vim.keymap.set("n", "<S-l>", "<Cmd>bnext<CR>", { desc = "Focus sur le buffer à droite" });
vim.keymap.set("n", "<S-h>", "<Cmd>bprevious<CR>", { desc = "Focus sur le buffer à gauche" });

-- activer / désactiver les inlay hints
vim.keymap.set("n", "<leader>i", function()
    vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled());
end, { desc = "Toggle inlay hints" });

