return {
  {
    "neovim/nvim-lspconfig",
    config = function()
      local capabilities = require('cmp_nvim_lsp').default_capabilities()

      vim.lsp.config("lua_ls", {
        capabilities = capabilities,
      })

      vim.lsp.config("clangd", {
        cmd = {
          "clangd",
          "--background-index",          -- Enables project-wide symbol indexing
          "--clang-tidy",                -- Enables extra linting
          "--completion-style=detailed", -- More precise completion
          "--header-insertion=iwyu",     -- "Include What You Use"
          "--cross-file-rename",         -- Allows renaming across multiple files
        },
        filetypes = {"c", "cpp", "objc", "objcpp", "h"},
        root_dir = function(fname)
          return vim.fs.root(fname, { "compile_commands.json", ".git" })
        end,
        capabilities = capabilities,

        -- DYNAMICALLY FIND COMPILE_COMMANDS.JSON FOR EACH BUFFER
        on_new_config = function(new_config, new_root_dir)
          local fallback_dir = "/home/rushikesh/Desktop/master_maia/Solver"

          -- Search upwards from the current file for compile_commands.json
          local match = vim.fs.find("compile_commands.json", { 
            path = new_root_dir, 
            upward = true, 
            stop = vim.env.HOME 
          })[1]

          -- If found, use its parent directory. If not, use fallback_dir.
          local compile_commands_dir = match and vim.fs.dirname(match) or fallback_dir

          -- Inject the argument dynamically into this instance of clangd
          table.insert(new_config.cmd, "--compile-commands-dir=" .. compile_commands_dir)
        end,
        on_attach = function(client, bufnr)
          require("nvim-navic").attach(client, bufnr)
        end
      })

      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('UserLspConfig', {}),
        callback = function(ev)
          vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'
          local opts = { buffer = ev.buf }
          vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
          vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
          vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
          vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
          vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, opts)
          vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
          vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, opts)
          vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
        end
      })
    end
  },
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup({
        ui = {
          icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
          }
        }
      })
    end
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        -- FIXED: changed "c" and "cpp" to "clangd"
        ensure_installed = {"lua_ls", "clangd", "pylsp", "bashls", "cmake", "texlab"}
      })
    end
  }
}
