vim.opt.number = true
vim.opt.cursorline = true
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.expandtab = true
vim.opt.scrolloff = 5
vim.opt.list = true
vim.opt.listchars = {
    tab = '→ ',
    trail = '•',
    nbsp = '¬'
}

vim.g.python3_host_prog = "/home/paul/.asdf/shims/python"

-- press space to turn off highlighting
vim.keymap.set('n', '<Space>', ':nohlsearch<CR>', { silent = true });
