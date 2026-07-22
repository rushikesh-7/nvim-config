-- Set this to switch your default theme. Options below (see each block's
-- comment for style variants some themes support).
local active = "no-clown-fiesta"

return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function ()
      if active == "catppuccin" then vim.cmd.colorscheme("catppuccin") end
    end
  },
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
    config = function()
      if active == "tokyonight" then vim.cmd.colorscheme("tokyonight-night") end
    end
  },
  {
    'projekt0n/github-nvim-theme',
    name = 'github-theme',
    lazy = false,
    priority = 1000,
    config = function()
      require('github-theme').setup({})
      if active == "github-theme" then vim.cmd.colorscheme("github_dark") end
    end,
  },
  {
    "aktersnurra/no-clown-fiesta.nvim",
    name = 'no-clown-fiesta',
    priority = 1000,
    lazy = false,
    config = function()
      require('no-clown-fiesta').load({})
      if active == "no-clown-fiesta" then vim.cmd.colorscheme("no-clown-fiesta") end
    end,
  },
  {
    "marko-cerovac/material.nvim",
    name = "material",
    priority = 1000,
    lazy = false,
    config = function()
      require('material').setup({})
      -- Styles: material, deep ocean, oceanic, palenight, darker
      if active == "material" then vim.cmd.colorscheme("material") end
    end
  },
  {
    "ramojus/mellifluous.nvim",
    name = "mellifluous",
    priority = 1000,
    lazy = false,
    config = function()
      require("mellifluous").setup({})
      -- Styles: mellifluous, alduin, mountain, rigoletto
      if active == "mellifluous" then vim.cmd.colorscheme("mellifluous") end
    end
  }
}
