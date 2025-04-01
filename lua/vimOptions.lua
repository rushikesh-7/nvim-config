vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.g.mapleader = " "

vim.cmd("set number")
vim.cmd("nnoremap <C-l> :set number!<CR>")
vim.cmd("set autoindent")
vim.cmd("set smartindent")

vim.cmd("set foldmethod=indent")
vim.opt.foldlevel = 99
-- vim.opt.foldlevelstart = 1

vim.cmd("set colorcolumn=120")

vim.keymap.set("n", "<F8>", function()
  vim.diagnostic.setloclist({ severity = vim.diagnostic.severity.ERROR })
end, { noremap = true, silent = true })

vim.keymap.set('n', '<leader>cf', function()
  vim.cmd("!clang-tidy % -fix")
  vim.cmd("edit") -- Reload the file after formatting
end, { desc = "Format with Clang-Tidy" })

