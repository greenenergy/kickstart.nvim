vim.g.mapleader = ' '

vim.opt.backspace = '2'
vim.opt.showcmd = true
vim.opt.laststatus = 2
vim.opt.autowrite = true
vim.opt.cursorline = true
vim.opt.autoread = true

-- use spaces for tabs and whatnot
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.shiftround = true
vim.opt.expandtab = true

vim.keymap.set('n', '<leader>h', ':nohlsearch<CR>')

vim.keymap.set('n', '<leader>pv', vim.cmd.Ex)

-- Toggle line numbers with Ctrl-n
vim.api.nvim_set_keymap('n', '<leader>n', ':lua vim.wo.number = not vim.wo.number<CR>', { noremap = true, silent = true })

-- Function to toggle whitespace visibility
local function toggle_whitespace()
  if vim.o.list then
    vim.o.list = false
  else
    vim.o.list = true
    vim.o.listchars = 'eol:↲,tab:▸ ,trail:·,space:␣'
  end
end

local cmp = require 'cmp'
local function toggleAutoCmp()
  vim.showing_cmp = not vim.showing_cmp
  if vim.showing_cmp then
    cmp.setup {
      completion = {
        autocomplete = { require('cmp.types').cmp.TriggerEvent.TextChanged },
      },
    }
  else
    cmp.setup {
      completion = {
        autocomplete = false,
      },
    }
  end
end
vim.api.nvim_create_user_command('ToggleAutoCMP', toggleAutoCmp, {})
vim.api.nvim_set_keymap('n', '<leader>o', ':ToggleAutoCMP<CR>', { noremap = true, silent = true })

-- Mapping the function to <leader>i
vim.api.nvim_create_user_command('ToggleWhitespace', toggle_whitespace, {})
vim.api.nvim_set_keymap('n', '<leader>i', ':ToggleWhitespace<CR>', { noremap = true, silent = true })

return {}
