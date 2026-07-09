return {
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope-ui-select.nvim',
      { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    },
    config = function()
      local telescope = require('telescope')
      local builtin = require('telescope.builtin')

      -- Define the explicit path to your standalone ripgrep binary
      -- local custom_rg_path = vim.fn.expand("$HOME") .. "/.local/bin/rg"

      telescope.setup({
        defaults = {
          -- 1. Point Telescope explicitly to your local ripgrep binary without changing $PATH
          -- vimgrep_arguments = {
          --   custom_rg_path,
          --   "--color=never",
          --   "--no-heading",
          --   "--with-filename",
          --   "--line-number",
          --   "--column",
          --   "--smart-case",
          -- },
          -- 2. Performance tweaks for shared HPC network filesystems
          file_ignore_patterns = { "node_modules", "%%.git/", "target/", "build/", "dist/" },
        },
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown {}
          },
          fzf = {
            fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter = true,
            case_mode = "smart_case",
          }
        }
      })

      telescope.load_extension("ui-select")
      telescope.load_extension("fzf")

      -- Standard Keymaps (These will now use your isolated 'rg' binary seamlessly)
      vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
      vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
      vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
      vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
      vim.keymap.set('n', '<leader>fr', builtin.oldfiles, { desc = 'Find recent files' })
      vim.keymap.set('n', '<leader>fw', function()
        builtin.grep_string({ search = vim.fn.expand('<cword>') })
      end, { desc = 'Find word under cursor' })
      vim.keymap.set('v', '<leader>fv', function()
        vim.cmd('normal! "vy')
        builtin.grep_string({ search = vim.fn.getreg('v') })
      end, { desc = 'Find visual selection' })
      vim.keymap.set('n', '<leader>jl', builtin.jumplist, { desc = 'Show Jumplist entries' })
      vim.keymap.set("n", "<leader>ts", builtin.lsp_document_symbols, { noremap = true, silent = true })

      -- Custom Interactive Live Grep Mapping (Also updated to cleanly pass args)
      vim.keymap.set('n', '<leader>fcg', function()
        local args = {}
        local opts = {}

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

          table.insert(args, "-g")
          table.insert(args, file_pattern)
        end

        if #args > 0 then
          opts.additional_args = function()
            return args
          end
        end

        builtin.live_grep(opts)
      end, { desc = 'Telescope live grep with custom options' })
    end
  }
}
