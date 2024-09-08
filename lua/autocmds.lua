-- Enable wrap when viewing Markdown files.
local group = vim.api.nvim_create_augroup("Markdown Wrap settings", { clear = true })
vim.api.nvim_create_autocmd('BufEnter', {
    pattern = { '*.md' },
    group = group,
    command = "setlocal wrap | set linebreak"
})
