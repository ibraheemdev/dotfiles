-- ===========================================
-- GENERAL CONFIGURATION 
-- ===========================================

local o = vim.o
local g = vim.g
local wo = vim.wo
local bo = vim.bo
local fn = vim.fn
local cmd = vim.cmd

o.encoding = 'utf-8'

-- decent scrolloff
o.scrolloff = 2

-- already in my statusline
o.showmode = false

-- tabs/indent
bo.shiftwidth = 4 bo.softtabstop = 4
bo.tabstop = 4
bo.expandtab= true
bo.autoindent = true

cmd('filetype plugin indent on')

-- permanent redo
o.undodir = 'undodir'
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
g.hidden = true

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
g.airline_theme = 'base16_gruvbox_dark_hard'
g.airline = {
    extensions = {
        tabline = {
            enabled = 1;
            formatter = 'unique_tail_improved'
        }
    }
}

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

-- better backspace 
g.backspace = 'indent,eol,start'
