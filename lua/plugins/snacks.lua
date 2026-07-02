return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = {
    -- -- your configuration comes here
    -- -- or leave it empty to use the default settings
    -- -- refer to the configuration section below
    bigfile = { enabled = true },
    dashboard = { enabled = true },
    -- explorer = { enabled = true },

    -- Customized Indent Module
    indent = {
      enabled = true,
      only_scope = true,    -- Keeps processing bound strictly to the active scope
      only_current = true,  -- Keeps it hidden on unfocused windows
      -- This fixes the issue: Turn off the generic background indent lines
      indent = {
        enabled = false,
      },
      -- Customize the active scope (the specific block your cursor is currently inside)
      scope = {
        enabled = true,      -- Highlight the active scope block
        char = "│",          -- Character for the active scope line
        hl = "SnacksIndentScope", -- Highlight group for the active scope
      },
      -- Customize smooth line animation (requires Neovim 0.10+)
      animate = {
        enabled = false,      -- Works natively on Neovim >= 0.10
        style = "out",       -- "out", "up_down", "down", or "up"
        duration = { step = 20, total = 500 }, -- Speed in ms
      },
    },

    input = { enabled = true },
    -- picker = { enabled = false },
    notifier = { enabled = true },
    quickfile = { enabled = true },
    scope = { enabled = true },
    scroll = { enabled = true },
    statuscolumn = { enabled = true },
    words = { enabled = true },
  }
}
