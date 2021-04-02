-- ===========================================
-- LANGUAGE SERVER
-- ===========================================

local o = vim.o
local g = vim.g
local fn = vim.fn
local cmd = vim.cmd
local lsp = require('lspconfig')
local map = vim.api.nvim_set_keymap
local exec = vim.api.nvim_exec
local utils = require('utils')

local M = {}

-- set up common functionality for LSP servers, this is defined on the module to allow project-local config
function M.on_attach(client, bufnr)
  local function bmap(a, b, c) vim.api.nvim_buf_set_keymap(bufnr, a, b, c, { noremap = true, silent = true }) end

  -- mappings
  bmap('n', 'td', '<cmd>lua vim.lsp.buf.type_definition()<CR>')
  bmap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>')
  bmap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>')
  bmap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>')
  bmap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>')
  bmap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>')
  bmap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>')
  bmap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>')
  bmap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>')
  bmap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>')
  bmap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>')

  -- formatting
  if client.resolved_capabilities.document_formatting then
    bmap("n", "<space>fmt", "<cmd>lua vim.lsp.buf.formatting()<CR>")
  elseif client.resolved_capabilities.document_range_formatting then
    bmap("n", "<space>fmt", "<cmd>lua vim.lsp.buf.range_formatting()<CR>")
  end

  -- symbol highlighting
  if client.resolved_capabilities.document_highlight then
    exec([[
      hi LspReferenceRead cterm=bold ctermbg=red guibg=LightYellow
      hi LspReferenceText cterm=bold ctermbg=red guibg=LightYellow
      hi LspReferenceWrite cterm=bold ctermbg=red guibg=LightYellow
    ]], false)
  end

  -- autocompletion
  require('completion').on_attach()
end


-- rust analyzer settings, this is defined on the module to allow project-local config
M.rust_analyzer = {
    ["rust-analyzer"] = {
        server = {
            path = "~/.cargo/bin/rust-analyzer"
        },
        cargo = {
            allFeatures = false,
            loadOutDirsFromCheck = true,
        },
        procMacro = {
            enable = true
        }
    }
}

-- rust LSP
lsp.rust_analyzer.setup({
    on_attach = M.on_attach,
    settings = M.rust_analyzer,
})

-- .NET LSP
lsp.omnisharp.setup({
    on_attach = M.on_attach,
    cmd = { "/home/ibraheem/.dotnet/omnisharp/run", "--languageserver" , "--hostPID", tostring(fn.getpid()) };
})

-- go LSP
lsp.gopls.setup({
    on_attach = M.on_attach,
    cmd = { "/home/ibraheem/go/bin/gopls" };
})

-- navigate auto-completion menu
function _G.smart_tab()
    return fn.pumvisible() == 1 and utils.termcodes'<C-n>' or utils.termcodes'<Tab>'
end

function _G.smart_stab()
    return fn.pumvisible() == 1 and utils.termcodes'<C-p>' or utils.termcodes'<S-Tab>'
end

map('i', '<Tab>', 'v:lua.smart_tab()', { noremap = true, expr = true })
map('i', '<S-Tab>', 'v:lua.smart_stab()', { noremap = true, expr = true })

-- without this, completion is way to eager and unusable
o.completeopt = 'menuone,noinsert,noselect'

-- avoid showing messages when using completion
o.shortmess = o.shortmess .. 'c'

-- enable airline lsp features
g['airline#extensions#nvimlsp#enabled'] = 1

-- rust-analyzer inlay hints
inlay_hints = function()
    require('lsp_extensions').inlay_hints({
        enabled = { "ChainingHint", "ParameterHint", "TypeHint" }
    })
end

cmd('autocmd InsertLeave,BufEnter,BufWinEnter,TabEnter,BufWritePost *.rs :lua inlay_hints()')

return M
