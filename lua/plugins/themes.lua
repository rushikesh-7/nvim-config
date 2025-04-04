return {
  {
    "catppuccin/nvim", 
    name = "catppuccin", 
    priority = 1000,
    config = function ()
      vim.cmd.colorscheme "catppuccin"
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
    {
      'projekt0n/github-nvim-theme',
      name = 'github-theme',
      lazy = false, -- make sure we load this during startup if it is your main colorscheme
      priority = 1000, -- make sure to load this before all the other start plugins
      config = function()
        require('github-theme').setup({
        })
        -- vim.cmd('colorscheme github_dark')
      end,
    }
  }
}
