return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function ()
      -- vim.cmd.colorscheme "catppuccin"
    end
  },
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
    config = function()
      -- vim.cmd.colorscheme "tokyonight-night"
    end
  },
  {
    'projekt0n/github-nvim-theme',
    name = 'github-theme',
    lazy = false,
    priority = 1000,
    config = function()
      require('github-theme').setup({})
      -- vim.cmd('colorscheme github_dark')
    end,
  },
  {
    "aktersnurra/no-clown-fiesta.nvim",
    name = 'no-clown-fiesta',
    priority = 1000,
    lazy = false,
    config = function()
      require('no-clown-fiesta').load({
        theme = "dark", -- options: "dark", "dim", "light"
        transparent = false,
      })

      vim.cmd('colorscheme no-clown-fiesta')
    end,
  }
}
