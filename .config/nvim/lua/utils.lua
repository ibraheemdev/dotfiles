local M = {}

function M.termcodes(str)
    return vim.api.nvim_replace_termcodes(str, true, true, true)
end

return M
