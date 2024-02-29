return {
  -- You can also add new plugins here as well:
  { "lambdalisue/suda.vim" },
  {
    "linux-cultist/venv-selector.nvim",
    dependencies = {
      { "neovim/nvim-lspconfig" },
      { "nvim-telescope/telescope.nvim" },
      { "mfussenegger/nvim-dap-python" },
    },
    keys = {
      -- Keymap to open VenvSelector to pick a venv.
      { "<leader>vs", "<cmd>VenvSelect<cr>" },
      -- Keymap to retrieve the venv from a cache (the one previously used for the same project directory).
      { "<leader>vc", "<cmd>VenvSelectCached<cr>" },
    },
    cmd = {
      "VenvSelect",
    },
    opts = {
      fd_binary_name = "fd",
    },
  },
  {
    "robitx/gp.nvim",
    config = function() require("gp").setup() end,
    lazy = false,
  },
  {
    "kristijanhusak/vim-dadbod-ui",
    dependencies = {
      { "tpope/vim-dadbod", lazy = true },
      { "kristijanhusak/vim-dadbod-completion", ft = { "sql", "mysql", "plsql" }, lazy = true },
    },
    cmd = {
      "DBUI",
      "DBUIToggle",
      "DBUIAddConnection",
      "DBUIFindBuffer",
    },
    init = function()
      -- Your DBUI configuration
      vim.g.db_ui_use_nerd_fonts = 1
    end,
  },
}
