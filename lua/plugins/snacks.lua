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
    picker = {
      enabled = true,
      ui_select = true,
    },
    notifier = { enabled = true },
    quickfile = { enabled = true },
    scope = { enabled = true },
    -- scroll = { enabled = true },
    statuscolumn = { enabled = true },
    words = { enabled = true },
  },
  keys = {
    { '<leader>ff', function() Snacks.picker.files() end, desc = 'Find files' },
    { '<leader>fg', function() Snacks.picker.grep() end, desc = 'Live grep' },
    { '<leader>fb', function() Snacks.picker.buffers() end, desc = 'Buffers' },
    { '<leader>fh', function() Snacks.picker.help() end, desc = 'Help tags' },
    { '<leader>fr', function() Snacks.picker.recent() end, desc = 'Find recent files' },
    { '<leader>fw', function() Snacks.picker.grep_word() end, desc = 'Find word under cursor' },
    { '<leader>jl', function() Snacks.picker.jumps() end, desc = 'Show Jumplist entries' },
    { '<leader>ts', function() Snacks.picker.lsp_symbols() end, desc = 'Document symbols' },
    {
      '<leader>fcg',
      function()
        local args = {}
        local glob

        -- 1. Case Sensitive prompt (Instant keypress)
        print("Case sensitive? (y/n): ")
        local case_sensitive = vim.fn.getcharstr()
        if case_sensitive == "n" or case_sensitive == "N" then
          table.insert(args, "--ignore-case")
        end

        -- 2. Whole Words prompt (Instant keypress)
        print("Whole words only? (y/n): ")
        local whole_words = vim.fn.getcharstr()
        if whole_words == "y" or whole_words == "Y" then
          table.insert(args, "--word-regexp")
        end

        local file_pattern = vim.fn.input("File pattern/folder (e.g., src/ or *.cpp): ")
        if file_pattern ~= "" then
          if file_pattern:sub(-1) == "/" then
            file_pattern = file_pattern .. "**/*"
          elseif vim.fn.isdirectory(file_pattern) == 1 then
            file_pattern = file_pattern .. "/**/*"
          end

          glob = file_pattern
        end

        Snacks.picker.grep({ args = args, glob = glob })
      end,
      desc = 'Live grep with custom options',
    },
  },
}
