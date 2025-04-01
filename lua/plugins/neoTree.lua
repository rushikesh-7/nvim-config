return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
    -- {"3rd/image.nvim", opts = {}}, -- Optional image support in preview window: See `# Preview Mode` for more information
  },
  lazy = false, -- neo-tree will lazily load itself
  opts = {
    -- fill any relevant options here
    filesystem = {
      filtered_items = {
        visible = true, -- Show hidden files by default
        show_hidden_count = true, -- Show a count of hidden files
        hide_dotfiles = false, -- Do not hide dotfiles (like .git, .env)
        hide_gitignored = false, -- Do not hide gitignored files
      }
    }
  },
  config = function(_, opts)
    require("neo-tree").setup(opts)
    vim.keymap.set('n', '<leader>n', ':Neotree filesystem toggle left<CR>')
  end
}
