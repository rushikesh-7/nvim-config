return {
  {
  'nvim-telescope/telescope.nvim', tag = '0.1.8',
  dependencies = {
      'nvim-lua/plenary.nvim',
    },
  config = function()
    local builtin = require('telescope.builtin')
    vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
    vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
    vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
    vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
    vim.keymap.set('n', '<leader>fr', builtin.oldfiles, { desc = 'Find recent files' })
    vim.keymap.set('n', '<leader>jl', builtin.jumplist, { desc = 'Show Jumplist entries' })
    vim.keymap.set('n', '<leader>fcg', function()
      local opts = {}  -- Options table

      local case_sensitive = vim.fn.input("Case sensitive? (y/n): ")
      if case_sensitive == "n" then
        opts['grep_open_files'] = false
        opts['additional_args'] = function()
          return { "--ignore-case" }  -- Add case-insensitive flag
        end
      end

      local whole_words = vim.fn.input("Whole words only? (y/n): ")
      if whole_words == "y" then
        opts['additional_args'] = function()
          return { "--word-regexp" }  -- Add whole word flag
        end
      end

      local file_pattern = vim.fn.input("File pattern (e.g., src/FV/*.cpp): ")
      if file_pattern ~= "" then
        opts['search_dirs'] = { file_pattern }
      end

      require('telescope.builtin').live_grep(opts)
    end, { desc = 'Telescope live grep with custom options' })
  end
  },
  {
  'nvim-telescope/telescope-ui-select.nvim',
  config = function()
      -- This is your opts table
      require("telescope").setup {
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown {
              -- even more opts
            }

            -- pseudo code / specification for writing custom displays, like the one
            -- for "codeactions"
            -- specific_opts = {
            --   [kind] = {
            --     make_indexed = function(items) -> indexed_items, width,
            --     make_displayer = function(widths) -> displayer
            --     make_display = function(displayer) -> function(e)
            --     make_ordinal = function(e) -> string
            --   },
            --   -- for example to disable the custom builtin "codeactions" display
            --      do the following
            --   codeactions = false,
            -- }
          }
        }
      }
      -- To get ui-select loaded and working with telescope, you need to call
      -- load_extension, somewhere after setup function:
      require("telescope").load_extension("ui-select")
  end

  }
}
