-- <leader> key
vim.g.mapleader = ' '

-- open config
vim.cmd('nmap <leader>c :e ~/.config/nvim/init.lua<cr>')

-- save
vim.cmd('nmap <leader>s :w<cr>')

-- motion keys (left, down, up, right)
vim.keymap.set({'n', 'v'}, 'j', 'h')
vim.keymap.set({'n', 'v'}, 'k', 'j')
vim.keymap.set({'n', 'v'}, 'l', 'k')
vim.keymap.set({'n', 'v'}, ';', 'l')

-- repeat previous f, t, F or T movement
vim.keymap.set('n', '\'', ';')

-- paste without overwriting
vim.keymap.set('v', 'p', 'P')

-- redo
vim.keymap.set('n', 'U', '<C-r>')

-- clear search highlighting
vim.keymap.set('n', '<Esc>', ':nohlsearch<cr>')

-- skip folds (down, up)
vim.cmd('nmap k gj')
vim.cmd('nmap l gk')

-- sync system clipboard
vim.opt.clipboard = 'unnamedplus'

-- search ignoring case
vim.opt.ignorecase = true

-- disable "ignorecase" option if the search pattern contains upper case characters
vim.opt.smartcase = true

-- install lazy.nvim
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    vim.fn.system(
        {'git', 'clone', '--filter=blob:none', 'https://github.com/folke/lazy.nvim.git', '--branch=stable', -- latest stable release
         lazypath})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({{
    'vscode-neovim/vscode-multi-cursor.nvim',
    event = 'VeryLazy',
    cond = not not vim.g.vscode,
    opts = {}
}})

vim.keymap.set('n', '<c-d>', 'mciw*:nohl<cr>', {
    remap = true
})

vim.keymap.set({'n', 'x', 'i'}, '<c-d>', function()
    require('vscode-multi-cursor').addSelectionToNextFindMatch()
end)

vim.keymap.set({'n', 'x', 'i'}, '<cs-d>', function()
    require('vscode-multi-cursor').addSelectionToPreviousFindMatch()
end)

vim.keymap.set({'n', 'x', 'i'}, '<cs-l>', function()
    require('vscode-multi-cursor').selectHighlights()
end)
