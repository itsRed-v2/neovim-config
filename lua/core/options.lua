vim.opt.number = true -- affiche les numéros de ligne
vim.opt.cursorline = true -- surlignage de la ligne active

-- plein d'options pour que l'indentation soit de 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.expandtab = true

vim.opt.scrolloff = 5 -- scroll pour que les 5 lignes autour de la ligne active soient toujours visibles

vim.opt.ignorecase = true -- ignore la casse lors d'une recherche
vim.opt.smartcase = true -- sauf si la recherche contient des lettres majuscules

vim.opt.undofile = true -- persistence du undo même après avoir fermé un buffer

-- affichage des caractères spéciaux invisibles
vim.opt.list = true
vim.opt.listchars = {
    tab = '→ ',
    trail = '•',
    nbsp = '¬'
}

-- the path to the python executable
vim.g.python3_host_prog = "/home/paul/.asdf/shims/python"

