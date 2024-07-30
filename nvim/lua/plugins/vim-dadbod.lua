return {
  {
    "tpope/vim-dadbod",
    "kristijanhusak/vim-dadbod-ui",
    "kristijanhusak/vim-dadbod-completion",
    config = function()
      vim.g.db_ui_auto_execute_table_helpers = 1
      vim.g.db_ui_debug = 1
    end,
    "tpope/vim-dotenv",
  },
}
