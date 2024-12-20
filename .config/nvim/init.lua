-- ===========================================
-- IMPORTS
-- ===========================================

local lsp = require('lspconfig')
local paq = require('paq')

local o = vim.o
local g = vim.g
local fn = vim.fn
local wo = vim.wo
local bo = vim.bo
local fn = vim.fn
local cmd = vim.cmd
local api = vim.api
local hl = vim.api.nvim_set_hl
local exec = vim.api.nvim_exec
local sign = vim.fn.sign_define
local map = vim.api.nvim_set_keymap

-- ===========================================
-- PLUGINS
-- ===========================================

-- disable netrw
g.loaded_netrwPlugin = false

paq {
  -- statusline
  'itchyny/lightline.vim',
  'mengelbrecht/lightline-bufferline',

  -- colorscheme
  'ellisonleao/gruvbox.nvim',
  
  -- changes working directory to git root.
  'airblade/vim-rooter',
  
  -- a command-line fuzzy finder.
  'junegunn/fzf',
  'junegunn/fzf.vim',
  
  -- LSP
  'neovim/nvim-lspconfig',
  
  'hrsh7th/nvim-cmp',
  'hrsh7th/cmp-nvim-lsp',
  
  -- nvim-cmp requires a snippet engine for <enter> completion
  'L3MON4D3/LuaSnip',
  'saadparwaiz1/cmp_luasnip',
  
  -- provides inlay hints for rust-analyzer
  'nvim-lua/lsp_extensions.nvim',
  
  -- syntax highlighting.
  'MaxMEllon/vim-jsx-pretty',
  { 'cespare/vim-toml', branch = 'main' },
  
  -- distraction-free writing.
  'junegunn/goyo.vim',
  
  -- NERDTree
  'preservim/nerdtree'
}

-- ===========================================
-- UTILS
-- ===========================================

function termcodes(str)
    return vim.api.nvim_replace_termcodes(str, true, true, true)
end

function smart_tab()
    return fn.pumvisible() == 1 and termcodes'<C-n>' or termcodes'<Tab>'
end

function smart_stab()
    return fn.pumvisible() == 1 and termcodes'<C-p>' or termcodes'<S-Tab>'
end

-- ===========================================
-- GENERAL CONFIGURATION 
-- ===========================================

-- no vi compat
vim.o.compatible = false
o.encoding = 'utf-8'

-- larger scrolloff
o.scrolloff = 6

-- already in my statusline
o.showmode = false

-- tabs/indent
cmd('set shiftwidth=4')
cmd('set tabstop=4')
cmd('set expandtab')
cmd('set autoindent')

-- enable filetype plugins
cmd('filetype plugin indent on')

cmd('set showtabline=2')

-- permanent red
o.undodir = os.getenv('HOME') .. '/.config/nvim/undodir'
o.undofile = true
bo.undofile = true

-- copy/paste to system clipboard
o.clipboard = 'unnamedplus'

-- faster diagnostics
o.updatetime = 300

-- better wildmenu
o.wildmenu = true
o.wildmode = 'longest:full,full'

-- better search
o.incsearch = true
o.ignorecase = true
o.smartcase = true
o.gdefault = true

-- show command in status line
o.showcmd = true

-- mouse support
o.mouse = 'a'

-- always display status bar
o.laststatus = 2

-- give more space for displaying messages.
o.cmdheight = 2

-- always show signcolumn
wo.signcolumn = 'yes'

-- relative line numbering
wo.number = true
wo.relativenumber = true

-- hide buffers
cmd('set hidden')

-- intuitive splits
g.splitright = true
g.splitbelow = true

-- syntax highlighting
o.syntax = 'enable'

-- only one space for joins
g.joinspaces = false

-- true color (24-bit)
if fn.exists('+termguicolors') then
    o.termguicolors = true
end

g.goyo_width = 100

-- colorscheme
require("gruvbox").setup({ contrast = "hard" })
o.background = "dark"
vim.cmd("colorscheme gruvbox")

-- syntax highlighting for markdown code blocks
g.markdown_fenced_languages = {'rust', 'ruby', 'go', 'yaml'}

-- html syntax highlighting for templating languages
cmd('autocmd BufRead,BufNewFile *.cshtml,*.erb,*.tmpl set filetype=html')
cmd('autocmd BufRead,BufNewFile *.cr set filetype=ruby')
cmd('autocmd BufRead,BufNewFile *.lalrpop set filetype=rust')

-- better grep
if fn.executable('ag') then
    g.grepprg = 'ag --nogroup --nocolor'
elseif executable('rg') then
	g.grepprg = 'rg --no-heading --vimgrep'
	g.grepformat = '%f:%l:%c:%m'
end

-- better formatting
g.formatoptions = "t,c,r,q,n,b"

-- backspace should work as expected
g.backspace = 'indent,eol,start'

-- Exit Vim if NERDTree is the only window left.
-- TODO: This is exiting immediately
-- cmd([[
--    autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | 
--    quit | endif
-- ]])

g.NERDTreeMinimalUI = true

-- If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
-- TODO: this is messing up autocomplete
-- cmd([[autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 | 
-- let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif]])

-- ===========================================
-- KEY MAPPINGS
-- ===========================================

-- space as leader key
g.mapleader = termcodes'<Space>'

-- jump to start/end of line
map('', 'H', '^', {})
map('', 'L', '$', {})
map('', 'Y', 'yy', {})

-- easier to type
map('n', ';', ':', { noremap = true })

-- search
map('', '<leader>s', ':Rg ', { noremap = true })

-- go to previous/next buffer
map('n', '<leader>l', ':bnext<CR>', { noremap = true })
map('n', '<leader>h', ':bprev<CR>', { noremap = true })

map('v', 'y', 'ygv<Esc>', { noremap = true })

-- close current buffer
-- move to previous buffer, close the last one (to keep split positions)
map('n', '<leader>d', ':bp|bd #<CR>', { noremap = true })

-- close current buffer
map('n', '<leader><leader>', ':b#<CR>', { noremap = true })

-- buffer search (fzf)
map('', '<leader>b', ':Buffers<CR>', {})

-- command search (fzf)
map('', '<leader>c', ':Commands<CR>', {})

-- open fzf files searcher
map('', '<C-p>', ':Files<CR>', {})

-- Suspend with Ctrl+f
map('i', '<C-f>', ':sus<CR>', { noremap = true })
map('v', '<C-f>', ':sus<CR>', { noremap = true })
map('n', '<C-f>', ':sus<CR>', { noremap = true })

-- disable arrow keys
for _, key in ipairs({'<Up>', '<Down>', '<Left>', '<Right>'}) do
  map('n', key, '<Nop>', { noremap = true })
  map('i', key, '<Nop>', { noremap = true })
  map('v', key, '<Nop>', { noremap = true })
end

-- toggle nerdtree
map('n', '<leader>n', ':NERDTreeToggle<CR>', { noremap = true })

-- navigate windows
map('', '<C-k>', '<C-w>k', { silent = true })
map('', '<C-j>', '<C-w>j', { silent = true })
map('', '<C-h>', '<C-w>h', { silent = true })
map('', '<C-l>', '<C-w>l', { silent = true })

-- remap 0 to first non-blank character
map('', '0', '^', {})

-- ===========================================
-- MARKDOWN MATHJAX
-- ===========================================
--
vim.api.nvim_exec([[
    autocmd FileType markdown inoremap <buffer> ^^ ^{}<left>
    autocmd FileType markdown inoremap <buffer> __ _{}<left>
    autocmd FileType markdown inoremap <buffer> (( \\(  \\)<left><left><left><left>
    autocmd FileType markdown inoremap <buffer> [[ \\[  \\]<left><left><left><left>
]], false)

-- ===========================================
-- LANGUAGE SERVER
-- ===========================================

-- TODO switch to nvim_set_hl: https://github.com/neovim/neovim/issues/13246
function lsp_highlights(ns)
    local colors = {
        Error = "#cc241d",
        Warn = "#d79921",
        Reference = "#d79921",
        Info = "#d79921",
        Hint = "#d79921"
    }

    -- underline references
    cmd('highlight LspReferenceRead gui=underline')
    cmd('highlight LspReferenceText gui=underline')
    cmd('highlight LspReferenceWrite gui=underline')
   
    cmd('highlight LspReferenceRead gui=underline')
    cmd('highlight LspReferenceText gui=underline')
    cmd('highlight LspReferenceWrite gui=underline')

    for _, level in pairs({'Error'; 'Warn'; 'Info'; 'Hint'}) do
        cmd('highlight DiagnosticSign' .. level .. ' guifg=' .. colors[level])
        cmd('highlight DiagnosticVirtualText' .. level .. ' guifg=' .. colors[level])
        cmd('highlight DiagnosticUnderline' .. level .. ' guifg=' .. colors[level])
        cmd('highlight DiagnosticFloating' .. level .. ' guifg=' .. colors[level])
    end

    -- underline and bold errors
    cmd('highlight DiagnosticUnderlineError gui=underline,bold')
    cmd('highlight DiagnosticUnderlineWarn gui=underline')

    -- set diagnostic symbols
    sign("DiagnosticSignError", {text = "", texthl = "DiagnosticSignError"})
    sign("DiagnosticSignWarn", {text = "", texthl = "DiagnosticSignWarn"})
    sign("DiagnosticSignInfo", {text = "", texthl = "DiagnosticSignInfo"})
    sign("DiagnosticSignHint", {text = "", texthl = "DiagnosticSignHint"})

    -- display float windows like diagnostic and hover
    cmd('highlight NormalFloat guifg=#dadada guibg=#3c3836')
end

local cmp = require'cmp'

cmp.setup({
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  mapping = {
    ['<Tab>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
    ['<S-Tab>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
    ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
    ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
    ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
    ['<C-y>'] = cmp.config.disable,
    ['<C-e>'] = cmp.mapping({
      i = cmp.mapping.abort(),
      c = cmp.mapping.close(),
    }),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
  },
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  })
})

local completion = require('cmp_nvim_lsp').default_capabilities()

-- set up common functionality for LSP servers
function on_attach(client, bufnr)
  local function bmap(a, b, c) vim.api.nvim_buf_set_keymap(bufnr, a, b, c, { noremap = true, silent = true }) end

  -- mappings
  bmap('n', 'ft', '<cmd>lua vim.lsp.buf.type_definition()<CR>')
  bmap('n', 'fk', '<Cmd>lua vim.lsp.buf.declaration()<CR>')
  bmap('n', 'fd', '<Cmd>lua vim.lsp.buf.definition()<CR>')
  bmap('n', 'fa', '<Cmd>lua vim.lsp.buf.code_action()<CR>')
  bmap('n', 'ff', '<Cmd>lua vim.lsp.buf.hover()<CR>')
  bmap('n', 'fi', '<cmd>lua vim.lsp.buf.implementation()<CR>')
  bmap('n', 'fs', '<cmd>lua vim.lsp.buf.signature_help()<CR>')
  bmap('n', 'fn', '<cmd>lua vim.lsp.buf.rename()<CR>')
  bmap('n', 'fr', '<cmd>lua vim.lsp.buf.references()<CR>')
  bmap('n', 'fc', '<cmd>lua vim.diagnostic.open_float()<CR>')
  bmap('n', 'fh', '<cmd>lua vim.diagnostic.goto_prev()<CR>')
  bmap('n', 'fl', '<cmd>lua vim.diagnostic.goto_next()<CR>')

  -- formatting
  vim.keymap.set("n", "fm", function()
      vim.lsp.buf.format { async = true }
  end, opts)


  -- symbol highlighting
  local ns = api.nvim_create_namespace('lsp-highlight')
  lsp_highlights(ns)
end

-- default rust analyzer config
rust_analyzer = {
    server = {
        path = "~/.cargo/bin/rust-analyzer"
    },
    cargo = {
        allFeatures = true,
        loadOutDirsFromCheck = true,
    },
    procMacro = {
        enable = true
    }
}

-- project local settings
local f = loadfile(vim.fn.getcwd() .. '/.lspconfig.lua')

if f ~= nil then
    local cfg = f()

    if cfg ~= nil then
        if cfg.rust_analyzer ~= nil then
            print("merging local rust-analyzer config")

            for opt, val in pairs(cfg.rust_analyzer) do
                rust_analyzer[opt] = val
            end
        end
    end
end
 
lsp.rust_analyzer.setup({
    on_attach = on_attach,
    settings = { ["rust-analyzer"] = rust_analyzer },
    capabilities = completion
})

lsp.pyright.setup({
    on_attach = on_attach,
    capabilities = completion
})

-- lsp.omnisharp.setup({
--     on_attach = on_attach,
--     cmd = { "mono", "/home/ibraheem/.dotnet/omnisharp-new/omnisharp/OmniSharp.exe", "--hostPID", tostring(fn.getpid()), "--loglevel", "Debug", "--languageserver" };
-- })


lsp.clangd.setup({
    on_attach = on_attach,
    cmd = { "clangd" },
    capabilities = completion
})


lsp.gopls.setup({
    on_attach = on_attach,
    cmd = { "/home/ibraheem/go/bin/gopls" },
    capabilities = completion
})

lsp.ruby_lsp.setup({
    on_attach = on_attach,
    init_options = { formatter = 'standard', linters = { 'standard' } },
    capabilities = completion
})

lsp.zls.setup({
    on_attach = on_attach,
    capabilities = completion
})

-- navigate auto-completion menu
map('i', '<Tab>', 'v:lua.smart_tab()', { noremap = true, expr = true })
map('i', '<S-Tab>', 'v:lua.smart_stab()', { noremap = true, expr = true })

-- without this, completion is way to eager and unusable
o.completeopt = 'menuone,noselect'

-- avoid showing messages when using completion
o.shortmess = o.shortmess .. 'c'

-- ===========================================
-- STATUSLINE
-- ===========================================

g.lightline = {
    colorscheme = 'deus',
    active = {
        right = { 
            { 'lsp_errors', 'lsp_warnings', 'lsp_info', 'lsp_ok', 'lineinfo' },
            { 'percent' },
            { 'fileformat', 'fileencoding', 'filetype' }
        }
    },
    tabline = {
        left = { { 'buffers' } },
        right = { { 'close' } },
    },
    component_expand = {
        lsp_errors = '{ -> luaeval(\'LspStatus(vim.diagnostic.severity.ERROR, [[E]])\') }',
        lsp_warnings = '{ -> luaeval(\'LspStatus(vim.diagnostic.severity.WARN, [[W]])\') }',
        lsp_ok = '{ -> luaeval(\'LspOk()\') }',
        buffers = 'lightline#bufferline#buffers'
    },
    component_type = {
        lsp_ok = 'left',
        lsp_info = 'middle',
        lsp_warnings = 'warning',
        lsp_errors = 'error',
        buffers = 'tabsel'
    },
}


g['lightline#bufferline#enable_devicons'] = 1

vim.api.nvim_exec([[
    augroup lightline#lsp
      autocmd!
      autocmd DiagnosticChanged * call lightline#update()
    augroup END
]], false)


function _G.LspStatus(severity, sym)
    if next(vim.lsp.buf_get_clients(0)) == 0 then
        return ''
    end

    local bufnr = vim.api.nvim_get_current_buf()
    local diagnostics = vim.diagnostic.get(bufnr, { severity = severity })
    local count = 0

    for _, diagnostic in ipairs(diagnostics) do
      namespace = vim.diagnostic.get_namespace(diagnostic.namespace).name
      if vim.startswith(namespace, 'vim.lsp') then
        count = count + 1
      end
    end

    if count == 0 then 
        return ''
    else 
        return sym .. ': ' .. count
    end
end

function _G.LspOk()
    if next(vim.lsp.buf_get_clients(0)) == 0 then
        return ''
    end

    local bufnr = vim.api.nvim_get_current_buf()
    local diagnostics = vim.diagnostic.get(bufnr)
    local ok = true

    for _, diagnostic in ipairs(diagnostics) do
      namespace = vim.diagnostic.get_namespace(diagnostic.namespace).name
      if vim.startswith(namespace, 'vim.lsp') then
          ok = false
      end
    end

    if ok then 
        return 'OK'
    else 
        return ''
    end
end

-- for rustc dev:
-- local rust_analyzer = {
--     checkOnSave = {
--         overrideCommand = {
--             "./x.py",
--             "check",
--             "--json-output"
--         }
--     },
--     cargo = {
--         runBuildScripts = false
--     },
--     procMacro = {
--         enable = false
--     }
-- }
-- 
-- return { rust_analyzer = rust_analyzer }
