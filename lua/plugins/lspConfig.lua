return{
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require('lspconfig')
      local capabilities = require('cmp_nvim_lsp').default_capabilities()
      lspconfig.lua_ls.setup({
        capabilities = capabilities,
      })
      lspconfig.clangd.setup({
        cmd = { 
          "clangd", 
          "--compile-commands-dir=/home/rushikesh/Desktop/master_maia/Solver",
          "--background-index",  -- Enables project-wide symbol indexing
          "--clang-tidy",        -- Enables extra linting
          "--completion-style=detailed", -- More precise completion
          "--header-insertion=iwyu",  -- "Include What You Use" (suggests necessary headers)
          "--cross-file-rename",  -- Allows renaming across multiple files  
        },
        filetypes = {"c", "cpp", "objc", "objcpp", "h"},
        root_dir = lspconfig.util.root_pattern("compile_commands.json", ".git"),
        capabilities = capabilities,
        on_attach = function(client, bufnr)
          require("nvim-navic").attach(client, bufnr)
        end
      })

      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('UserLspConfig', {}),
        callback = function(ev)
          -- Enable completion triggered by <c-x><c-o>
          vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

          -- Buffer local mappings.
          -- See `:help vim.lsp.*` for documentation on any of the below functions
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
      ensure_install = {"lua_ls", "cpp", "c", "pylsp", "bash", "make", "cmake", "texlab"}
      })
    end
  }
}
