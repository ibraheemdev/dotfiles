-- ===========================================
-- KEY MAPPINGS
-- ===========================================

local g = vim.g
local utils = require('utils')
local map = vim.api.nvim_set_keymap

-- space as leader key
g.mapleader = utils.termcodes'<Space>'

-- jump to start/end of line
map('', 'H', '^', {})
map('', 'L', '$', {})

-- easier to type
map('n', ';', ':', { noremap = true })

-- search
map('', '<leader>s', ':Rg', { noremap = true })

-- navigate buffers
map('n', '<C-l>', ':bnext<CR>', { noremap = true })
map('n', '<C-h>', ':bprev<CR>', { noremap = true })
map('n', '<C-w>', ':bdelete<CR>', { noremap = true })

-- open fzf files searcher
map('', '<C-p>', ':Files<CR>', {})

-- disable arrow keys
for _, key in ipairs({'<Up>', '<Down>', '<Left>', '<Right>'}) do
  map('n', key, '<Nop>', { noremap = true })
  map('i', key, '<Nop>', { noremap = true })
  map('v', key, '<Nop>', { noremap = true })
end

-- switch to English
map('n', '<Leader>e', ':<C-U>set norightleft<CR>', {})

-- switch to Arabic
map('n', '<Leader>a', ':<C-U>set rightleft<CR>', {})
