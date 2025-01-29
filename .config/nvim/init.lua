local map = vim.keymap.set
local autocmd = vim.api.nvim_create_autocmd

-- ===========================================
-- PLUGINS
-- ===========================================

-- disable netrw
vim.g.loaded_netrwPlugin = false

require('paq') {
  -- git working directory
  'airblade/vim-rooter',
  
  -- fuzzy finder
  'nvim-lua/plenary.nvim',
  'nvim-telescope/telescope.nvim',
  'nvim-telescope/telescope-ui-select.nvim',
  
  -- language server
  'neovim/nvim-lspconfig',

  -- lsp completion
  'hrsh7th/nvim-cmp',
  'hrsh7th/cmp-nvim-lsp',
  
  -- snippet engine
  'L3MON4D3/LuaSnip',
  'saadparwaiz1/cmp_luasnip',
  
  -- syntax highlighting
  { 'cespare/vim-toml', branch = 'main' },
  
  -- minimalist writing
  'junegunn/goyo.vim',
  
  -- file explorer
  'preservim/nerdtree',

  -- latex
  'lervag/vimtex'
}

-- ===========================================
-- GENERAL
-- ===========================================

-- status line
vim.o.statusline = '%< %f %=%-.(%l:%c%) '
vim.o.showmode = false

-- larger scrolloff
vim.o.scrolloff = 6

-- tabs/indent
vim.o.shiftwidth = 4
vim.o.tabstop    = 4
vim.o.expandtab  = true 

-- permanent redo
vim.o.undodir = os.getenv('HOME') .. '/.config/nvim/undodir'
vim.o.undofile = true

-- copy/paste to system clipboard
vim.o.clipboard = 'unnamedplus'

-- better search and replace
vim.o.smartcase = true
vim.o.gdefault = true

-- mouse support
vim.o.mouse = 'a'

-- give more space for displaying messages.
vim.o.cmdheight = 2

-- always show signcolumn
vim.wo.signcolumn = 'yes'

-- relative line numbering
vim.wo.number = true
vim.wo.relativenumber = true

-- intuitive splits
vim.g.splitright = true
vim.g.splitbelow = true

-- goyo plugin
vim.g.goyo_width = 100

-- colorscheme
vim.cmd.colorscheme('habamax')

-- syntax highlighting for markdown code blocks
vim.g.markdown_fenced_languages = {'rust', 'ruby', 'go', 'yaml'}

-- html syntax highlighting for templating languages
autocmd({'BufRead', 'BufNewFile'}, {
  pattern = {'*.cshtml', '*.erb', '*.tmpl'},
  callback = function() vim.bo.filetype = 'html' end,
})

-- better formatting
vim.g.formatoptions = 't,c,r,q,n,b'

-- hide help menu
vim.g.NERDTreeMinimalUI = true

-- vimtex
vim.g.vimtex_view_method = "zathura"
vim.g.vimtex_compiler_latexmk = { out_dir = '.build' }
vim.g.vimtex_quickfix_open_on_warning = 0

-- ===========================================
-- KEYMAPS
-- ===========================================

-- space as leader key
vim.g.mapleader = ' '

-- jump to start/end of line
map('', 'H', '^')
map('', 'L', '$')
map('', 'Y', 'yy')

-- yank register
map('', '\'', '\"0', { noremap = true })

-- easier to type
map('n', ';', ':', { noremap = true })

-- go to previous buffer
map('n', '<leader>o', ':b#<CR>', { noremap = true })

-- close current buffer, preserving splits
map('n', '<leader>d', ':bp|bd #<CR>', { noremap = true })

-- preserve cursor after yank
map('v', 'y', 'ygv<Esc>', { noremap = true })

-- suspend
map({'i', 'v', 'n'}, '<C-f>', ':sus<CR>', { noremap = true })

-- toggle nerdtree
map('n', '<leader>n', ':NERDTreeToggle<CR>', { noremap = true })

-- navigate splits
map('', '<C-k>', '<C-w>k', { silent = true })
map('', '<C-j>', '<C-w>j', { silent = true })
map('', '<C-h>', '<C-w>h', { silent = true })
map('', '<C-l>', '<C-w>l', { silent = true })

--
map('n', '<leader>c', ':VimtexCompile<CR>')

-- fuzzy finders
local defaults = require('telescope.themes').get_ivy()
defaults.initial_mode = "normal"
require('telescope').setup({ defaults = defaults })

local telescope = require('telescope.builtin')

map('', '<leader>p', telescope.find_files)
map('', '<leader>k', function() telescope.buffers({ sort_mru = true, ignore_current = true }) end)
map('', '<leader>s', telescope.live_grep)
map('', '<leader>g', telescope.lsp_references)
map('', '<leader>i', telescope.lsp_implementations)

-- lsp keymaps
function lsp_map()
  local function bmap(mode, lhs, rhs)
      map(mode, lhs, rhs, { noremap = true, silent = true, buffer = buf })
  end

  -- navigation
  bmap('n', '<leader>j', vim.lsp.buf.definition)
  bmap('n', '<leader>a', vim.lsp.buf.code_action)
  bmap('n', '<leader>r', vim.lsp.buf.rename)
  bmap('n', '<leader>f', vim.diagnostic.open_float)
  bmap('n', '<leader>h', vim.diagnostic.goto_prev)
  bmap('n', '<leader>l', vim.diagnostic.goto_next)

  -- formatting
  vim.keymap.set('n', '<leader>m', function()
      vim.lsp.buf.format { async = true }
  end, opts)
end

-- latex shortcuts
autocmd({ 'FileType' }, {
    pattern = { "markdown", "tex" },
    callback = function()
        map('i', '^^', '^{}<left>', { noremap = true, buffer = true })
        map('i', '__', '_{}<left>', { noremap = true, buffer = true })
        map('i', '((', '\\(  \\)<left><left><left><left>', { noremap = true, buffer = true })
        map('i', '[[', '\\[  \\]<left><left><left><left>', { noremap = true, buffer = true })
    end
})

-- ===========================================
-- LANGUAGE SERVER
-- ===========================================

local cmp = require('cmp')

cmp.setup({
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  mapping = {
    -- next item
    ['<Tab>']   = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
    -- previous item
    ['<S-Tab>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
    -- confirm item
    ['<CR>']    = cmp.mapping.confirm({ select = true }),
  },
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  })
})

local sign = vim.fn.sign_define
local highlight = vim.api.nvim_set_hl

function highlights()
    -- underline references
    highlight(0, 'LspReferenceRead', { underline = true })
    highlight(0, 'LspReferenceText', { underline = true })
    highlight(0, 'LspReferenceWrite', { underline = true })

    local colors = {
        Error     = "#cc241d",
        Warn      = "#d79921",
        Reference = "#d79921",
        Info      = "#d79921",
    }

    -- set diagnostic colors
    for level, color in pairs(colors) do
        highlight(0, 'Diagnostic' .. level, { fg = color })
        highlight(0, 'DiagnosticUnderline' .. level, { fg = color })
    end

    -- underline warnings and bold errors
    highlight(0, 'DiagnosticUnderlineError', { fg = colors['Error'], underline = true, bold = true })
    highlight(0, 'DiagnosticUnderlineWarn',  { fg = colors['Warn'],  underline = true })

    -- set diagnostic symbols
    sign('DiagnosticSignError', { text = '', texthl = 'DiagnosticSignError' })
    sign('DiagnosticSignWarn',  { text = '', texthl = 'DiagnosticSignWarn'  })
    sign('DiagnosticSignInfo',  { text = '', texthl = 'DiagnosticSignInfo'  })
    sign('DiagnosticSignHint',  { text = '', texthl = 'DiagnosticSignHint'  })

    -- display float windows like diagnostic and hover
    highlight(0, 'NormalFloat', { fg = "#dadada", bg = "#3c3836" })
end

-- avoid showing messages when using completion
vim.o.shortmess = vim.o.shortmess .. 'c'

-- LSP setup
function on_attach(client, buf)
  -- setup keymaps
  lsp_map()

  -- symbol highlighting
  highlights()

  -- workaround for https://github.com/neovim/neovim/issues/30985
  for _, method in ipairs({ 'textDocument/diagnostic', 'workspace/diagnostic' }) do
      local default_diagnostic_handler = vim.lsp.handlers[method]
      vim.lsp.handlers[method] = function(err, result, context, config)
          if err ~= nil and err.code == -32802 then
              return
          end
          return default_diagnostic_handler(err, result, context, config)
      end
  end
end

-- default rust analyzer configuration
rust_analyzer = {
    server = { path = '~/.cargo/bin/rust-analyzer' },
    cargo = { allFeatures = true, loadOutDirsFromCheck = true },
    procMacro = { enable = true }
}

-- project local configuration
local f = loadfile(vim.fn.getcwd() .. '/.lspconfig.lua')

if f ~= nil then
    local cfg = f()

    if cfg ~= nil then
        if cfg.rust_analyzer ~= nil then
            print('applying local rust-analyzer config')

            for opt, val in pairs(cfg.rust_analyzer) do
                rust_analyzer[opt] = val
            end
        end
    end
end

local completion = require('cmp_nvim_lsp').default_capabilities()

-- LSP server config
servers = {
    zls      = {},
    gopls    = {},
    pyright  = {},
    clangd   = {},
    rust_analyzer = {
        settings = { ['rust-analyzer'] = rust_analyzer },
    },
    ruby_lsp = {
        init_options = { formatter = 'standard', linters = { 'standard' } },
    },
}

local lsp = require('lspconfig')

for server, config in pairs(servers) do
    config.on_attach    = on_attach
    config.capabilities = completion
    lsp[server].setup(config)
end
