return {
  "nvim-treesitter/nvim-treesitter", 
  build = ":TSUpdate",
  config = function()
    local configs = require("nvim-treesitter.configs")
    configs.setup({
      ensure_installed = { "c", "lua", "vim", "vimdoc", "javascript", "html", "make", "python", "cmake", "cpp", "bash"},
      highlight = { enable = true},
      indent = { enable = true },
    })

    -- Load nvim-navic for function name tracking
    local navic = require("nvim-navic")
    navic.setup({ highlight = true })
  end
}
