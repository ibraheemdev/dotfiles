-- ===========================================
-- IMPORTS
-- ===========================================

local paq = require('paq').paq
local lsp = require('lspconfig')

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

-- lean & mean status/tabline
paq 'vim-airline/vim-airline'
paq 'vim-airline/vim-airline-themes'

-- base16 color schemes.
paq 'chriskempson/base16-vim'

-- changes working directory to git root.
paq 'airblade/vim-rooter'

-- a command-line fuzzy finder.
paq 'junegunn/fzf'
paq 'junegunn/fzf.vim'

-- configuration for Neovim's LSP.
paq 'neovim/nvim-lspconfig'

-- a async completion framework for Neovim's LSP.
paq 'nvim-lua/completion-nvim'

-- provides inlay hints for rust-analyzer
paq 'nvim-lua/lsp_extensions.nvim'

-- tOML syntax highlighting.
paq 'cespare/vim-toml'

-- jsx/tsx syntax highlighting.
paq 'MaxMEllon/vim-jsx-pretty'

-- distraction-free writing.
paq 'junegunn/goyo.vim'

-- disable netrw
vim.g.loaded_netrwPlugin = 1

-- because NERDTree is better
paq 'preservim/nerdtree'

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

-- I don't need vi compat
vim.o.compatible = false

-- set utf8 as standard encoding 
o.encoding = 'utf-8'

-- larger scrolloff
o.scrolloff = 6

-- already in my statusline
o.showmode = false

-- project local config
cmd('set exrc')

-- tabs/indent
cmd('set shiftwidth=4')
cmd('set tabstop=4')
cmd('set expandtab')
cmd('set autoindent')

-- enable filetype plugins
cmd('filetype plugin indent on')

-- permanent redo
o.undodir = os.getenv('HOME') .. '/.config/nvim/undodir'
o.undofile = true
bo.undofile = true

-- copy/paste to system clipboard
o.clipboard = 'unnamedplus'

-- faster diagnostics
o.updatetime = 300

-- better wildmenu
o.wildmenu = true
o.wildmode = 'list:longest'

-- better search
o.incsearch = true
o.ignorecase = true
o.smartcase = true
o.gdefault = true

-- show command in status line
o.showcmd = true

-- mouse support always
o.mouse = 'a'

-- always display status bar
o.laststatus = 2

-- give more space for displaying messages.
o.cmdheight = 2

-- always show signcolumn
wo.signcolumn = 'yes'

-- relative line numbering
wo.relativenumber = true

-- and show current line
wo.number = true

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

-- colorscheme
g.colors_name = 'base16-gruvbox-dark-hard'
o.background = 'dark'

-- airline
g['airline_theme'] = 'base16_gruvbox_dark_hard'
g['airline#extensions#tabline#enabled'] = 1;
g['airline#extensions#tabline#formatter'] = 'unique_tail_improved';

-- syntax highlighting for markdown code blocks
g.markdown_fenced_languages = {'rust'}

-- html syntax highlighting for templating languages
cmd('autocmd BufRead,BufNewFile *.cshtml,*.erb,*.tmpl set filetype=html')

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

-- ===========================================
-- KEY MAPPINGS
-- ===========================================

-- space as leader key
g.mapleader = termcodes'<Space>'

-- jump to start/end of line
map('', 'H', '^', {})
map('', 'L', '$', {})

-- easier to type
map('n', ';', ':', { noremap = true })

-- search
map('', '<leader>s', ':Rg ', { noremap = true })

-- go to previous/next buffer
map('n', '<leader>l', ':bnext<CR>', { noremap = true })
map('n', '<leader>h', ':bprev<CR>', { noremap = true })

-- close current buffer
map('n', '<leader>d', ':bdelete<CR>', { noremap = true })

-- close current buffer
map('n', '<leader><leader>', ':b#<CR>', { noremap = true })

-- buffer search (fzf)
map('', '<leader>b', ':Buffers<CR>', {})

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

-- switch text direction
map('n', '<leader>rl', ':<C-U>set norightleft<CR>', { noremap = true })
map('n', '<leader>a', ':<C-U>set rightleft<CR>', { noremap = true })

-- toggle nerdtree
map('n', '<leader>n', ':NERDTreeToggle<CR>', { noremap = true })

-- navigate windows
map('n', '<C-k>', ':wincmd k<CR>', { silent = true })
map('n', '<C-j>', ':wincmd j<CR>', { silent = true })
map('n', '<C-h>', ':wincmd h<CR>', { silent = true })
map('n', '<C-l>', ':wincmd l<CR>', { silent = true })

-- fast saving
map('n', '<leader>w', ':w<cr>', {})

-- remap 0 to first non-blank character
map('', '0', '^', {})

-- ===========================================
-- LANGUAGE SERVER
-- ===========================================

-- TODO switch to nvim_set_hl: https://github.com/neovim/neovim/issues/13246
function lsp_highlights(ns)
    local colors = {
        Error = "#cc241d",
        Warning = "#d79921",
        Reference = "#d79921",
        Information = "#d79921",
        Hint = "#d79921"
    }

    -- underline references
    -- hl(ns, "LspReferenceRead", {underline = true})
    -- hl(ns, "LspReferenceText", {underline = true})
    -- hl(ns, "LspReferenceWrite", {underline = true})
    cmd('highlight LspReferenceRead gui=underline')
    cmd('highlight LspReferenceText gui=underline')
    cmd('highlight LspReferenceWrite gui=underline')
   
    cmd('highlight LspReferenceRead gui=underline')
    cmd('highlight LspReferenceText gui=underline')
    cmd('highlight LspReferenceWrite gui=underline')

    for _, level in pairs({'Error'; 'Warning'; 'Information'; 'Hint'}) do
        -- hl(ns, 'LspDiagnosticsSign' .. level, { fg = colors[level] }) hl(ns, 'LspDiagnosticsVirtualText' .. level, { fg = colors[level] })
        -- hl(ns, 'LspDiagnosticsUnderline' .. level, { fg = colors[level] })
        -- hl(ns, 'LspDiagnosticsFloating' .. level, { fg = colors[level] })
        cmd('highlight LspDiagnosticsSign' .. level .. ' guifg=' .. colors[level])
        cmd('highlight LspDiagnosticsVirtualText' .. level .. ' guifg=' .. colors[level])
        cmd('highlight LspDiagnosticsUnderline' .. level .. ' guifg=' .. colors[level])
        cmd('highlight LspDiagnosticsFloating' .. level .. ' guifg=' .. colors[level])
    end

    -- underline and bold errors
    cmd('highlight LspDiagnosticsUnderlineError gui=underline,bold')

    -- set diagnostic symbols
    sign("LspDiagnosticsSignError", {text = "", texthl = "LspDiagnosticsSignError"})
    sign("LspDiagnosticsSignWarning", {text = "", texthl = "LspDiagnosticsSignWarning"})
    sign("LspDiagnosticsSignInformation", {text = "", texthl = "LspDiagnosticsSignInformation"})
    sign("LspDiagnosticsSignHint", {text = "", texthl = "LspDiagnosticsSignHint"})

    -- hl(ns, "NormalFloat", {fg = "#dadada"; bg = "#335261"})
    -- Float windows like diagnostic and hover
    cmd('highlight NormalFloat guifg=#dadada guibg=#3c3836')
end

-- set up common functionality for LSP servers
function on_attach(client, bufnr)
  local function bmap(a, b, c) vim.api.nvim_buf_set_keymap(bufnr, a, b, c, { noremap = true, silent = true }) end

  -- mappings
  bmap('n', '<leader>it', '<cmd>lua vim.lsp.buf.type_definition()<CR>')
  bmap('n', '<leader>ic', '<Cmd>lua vim.lsp.buf.declaration()<CR>')
  bmap('n', '<leader>id', '<Cmd>lua vim.lsp.buf.definition()<CR>')
  bmap('n', '<leader>ia', '<Cmd>lua vim.lsp.buf.code_action()<CR>')
  bmap('n', '<leader>ii', '<Cmd>lua vim.lsp.buf.hover()<CR>')
  bmap('n', '<leader>ip', '<cmd>lua vim.lsp.buf.implementation()<CR>')
  bmap('n', '<leader>ih', '<cmd>lua vim.lsp.buf.signature_help()<CR>')
  bmap('n', '<leader>irn', '<cmd>lua vim.lsp.buf.rename()<CR>')
  bmap('n', '<leader>ir', '<cmd>lua vim.lsp.buf.references()<CR>')
  bmap('n', '<leader>ild', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>')
  bmap('n', '<leader>ih', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>')
  bmap('n', '<leader>il', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>')

  -- formatting
  if client.resolved_capabilities.document_formatting then
    bmap("n", "<space>fmt", "<cmd>lua vim.lsp.buf.formatting()<CR>")
  elseif client.resolved_capabilities.document_range_formatting then
    bmap("n", "<space>fmt", "<cmd>lua vim.lsp.buf.range_formatting()<CR>")
  end

  -- symbol highlighting
  -- if client.resolved_capabilities.document_highlight then
  -- end
  local ns = api.nvim_create_namespace('lsp-highlight')
  lsp_highlights(ns)

  -- autocompletion
  require('completion').on_attach()
end


-- rust analyzer settings
rust_analyzer = {
    ["rust-analyzer"] = {
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
}

-- rust LSP
lsp.rust_analyzer.setup({
    on_attach = on_attach,
    settings = rust_analyzer,
})

-- .NET LSP
lsp.omnisharp.setup({
    on_attach = on_attach,
    cmd = { "/home/ibraheem/.dotnet/omnisharp/run", "--languageserver" , "--hostPID", tostring(fn.getpid()) };
})

-- go LSP
lsp.gopls.setup({
    on_attach = on_attach,
    cmd = { "/home/ibraheem/go/bin/gopls" };
})

-- navigate auto-completion menu
map('i', '<Tab>', 'v:lua.smart_tab()', { noremap = true, expr = true })
map('i', '<S-Tab>', 'v:lua.smart_stab()', { noremap = true, expr = true })

-- without this, completion is way to eager and unusable
o.completeopt = 'menuone,noinsert,noselect'

-- avoid showing messages when using completion
o.shortmess = o.shortmess .. 'c'

-- enable airline lsp features
g['airline#extensions#nvimlsp#enabled'] = 1

-- rust-analyzer inlay hints
function inlay_hints()
    require('lsp_extensions').inlay_hints({
        enabled = { "ChainingHint", "ParameterHint", "TypeHint" }
    })
end

cmd('autocmd InsertLeave,BufEnter,BufWinEnter,TabEnter,BufWritePost *.rs :lua inlay_hints()')
