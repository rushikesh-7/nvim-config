vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set nowrap")
vim.g.mapleader = " "
vim.opt.clipboard = "unnamedplus"
-- vim.o.mouse = ""

vim.cmd("set number")
vim.cmd("nnoremap <C-l> :set number!<CR>")
vim.cmd("set autoindent")
vim.cmd("set smartindent")

-- Navigate windows using Space + Arrow keys
vim.keymap.set('n', '<leader><Left>',  '<C-w>h', { desc = 'Move to left window' })
vim.keymap.set('n', '<leader><Down>',  '<C-w>j', { desc = 'Move to lower window' })
vim.keymap.set('n', '<leader><Up>',    '<C-w>k', { desc = 'Move to upper window' })
vim.keymap.set('n', '<leader><Right>', '<C-w>l', { desc = 'Move to right window' })

vim.cmd("set foldmethod=indent")
-- vim.cmd("set foldlevel=0")
vim.opt.foldlevel = 99
-- vim.opt.foldlevelstart = 1

vim.cmd("set colorcolumn=120")

vim.cmd("set listchars=trail:~")
vim.cmd("set list")

vim.keymap.set("n", "<F8>", function()
  vim.diagnostic.setloclist({ severity = vim.diagnostic.severity.ERROR })
end, { noremap = true, silent = true })

-- vim.keymap.set('n', '<leader>cf', function()
--   vim.cmd("!clang-tidy % -fix")
--   vim.cmd("edit") -- Reload the file after formatting
-- end, { desc = "Format with Clang-Tidy" })

vim.keymap.set("n", "<leader>fs", function()
  local ext = vim.fn.expand("%:e") == "h" and "cpp" or "h"
  vim.cmd("e " .. vim.fn.expand("%:r") .. "." .. ext)
end, { noremap = true, silent = true })

-- Create an augroup for managing file views (folds, cursor position, etc.)
local view_group = vim.api.nvim_create_augroup("RememberFolds", { clear = true })

-- Save fold settings when leaving a buffer
vim.api.nvim_create_autocmd("BufWinLeave", {
  group = view_group,
  pattern = "?*", -- Matches files with actual names, ignores empty/scratch buffers
  callback = function()
    vim.cmd("silent! mkview")
  end,
})

-- Restore fold settings when entering a buffer
vim.api.nvim_create_autocmd("BufWinEnter", {
  group = view_group,
  pattern = "?*",
  callback = function()
    vim.cmd("silent! loadview")
  end,
})
