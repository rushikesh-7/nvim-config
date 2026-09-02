-- Set this to switch your default theme. Options below (see each block's
-- comment for style variants some themes support).
local active = "tokyonight"

-- Only the active theme is loaded at startup; the rest stay lazy so they can't
-- fight over `:colorscheme`. `setup`/`load` must stay inside `is(...)` because
-- some plugins (e.g. no-clown-fiesta) apply the colorscheme from that call.
local function is(name)
  return active == name
end

return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = not is("catppuccin"),
    priority = 1000,
    config = function()
      require("catppuccin").setup({})
      vim.cmd.colorscheme("catppuccin")
    end,
  },
  {
    "folke/tokyonight.nvim",
    lazy = not is("tokyonight"),
    priority = 1000,
    config = function()
      require("tokyonight").setup({})
      -- Styles: tokyonight-night, -storm, -moon, -day
      vim.cmd.colorscheme("tokyonight-night")
    end,
  },
  {
    "projekt0n/github-nvim-theme",
    name = "github-theme",
    lazy = not is("github-theme"),
    priority = 1000,
    config = function()
      require("github-theme").setup({})
      -- Styles: github_dark, github_dark_dimmed, github_light, ...
      vim.cmd.colorscheme("github_dark")
    end,
  },
  {
    "aktersnurra/no-clown-fiesta.nvim",
    name = "no-clown-fiesta",
    lazy = not is("no-clown-fiesta"),
    priority = 1000,
    config = function()
      require("no-clown-fiesta").load({})
    end,
  },
  {
    "marko-cerovac/material.nvim",
    name = "material",
    lazy = not is("material"),
    priority = 1000,
    config = function()
      require("material").setup({})
      -- Styles: material, deep ocean, oceanic, palenight, darker
      vim.g.material_style = "darker"
      vim.cmd.colorscheme("material")
    end,
  },
  {
    "ramojus/mellifluous.nvim",
    name = "mellifluous",
    lazy = not is("mellifluous"),
    priority = 1000,
    config = function()
      require("mellifluous").setup({})
      -- Styles: mellifluous, alduin, mountain, rigoletto
      vim.cmd.colorscheme("mellifluous")
    end,
  },
}
