-- on définit la touche leader
vim.g.mapleader = " ";

-- press space to turn off highlighting
vim.keymap.set('n', '<leader><Space>', ':nohlsearch<CR>', { desc = "Effacer le surlignage de la recherche" });

-- Changement de fenêtre avec Ctrl + déplacement au lieu de Ctrl-w + déplacement
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Focus sur la fenêtre à gauche" });
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Focus sur la fenêtre à droite" });
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Focus sur la fenêtre en bas" });
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Focus sur la fenêtre en haut" });

-- navigation entre les buffers
vim.keymap.set("n", "<S-l>", ":bnext<CR>");
vim.keymap.set("n", "<S-h>", ":bprevious<CR>");
