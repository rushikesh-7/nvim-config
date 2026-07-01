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
        theme = "dark",
        transparent = false,
      })
      vim.cmd('colorscheme no-clown-fiesta')
    end,
  },
  {
    "marko-cerovac/material.nvim",
    name = "material",
    priority = 1000,
    lazy = false,
    config = function()
      require('material').setup({})
      -- vim.cmd('colorscheme material') -- (Styles: material, deep ocean, oceanic, palenight, darker)
    end
  },
  {
    "ramojus/mellifluous.nvim",
    name = "mellifluous",
    priority = 1000,
    lazy = false,
    config = function()
      require("mellifluous").setup({})
      -- vim.cmd('colorscheme mellifluous')  -- (Styles: mellifluous, alduin, mountain, rigoletto)
    end
  }
}
