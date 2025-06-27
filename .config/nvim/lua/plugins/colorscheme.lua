-- ~/.config/nvim/lua/plugins/colorscheme.lua
-- return {
--   {
--     "catppuccin/nvim",
--     name = "catppuccin",
--     priority = 1000,
--     config = function()
--       vim.cmd.colorscheme("catppuccin-mocha")
--     end,
--   },
-- }

return {
  {
    "ellisonleao/gruvbox.nvim",
    priority = 1000,
    lazy = false,
    config = function()
      vim.cmd("colorscheme gruvbox")
    end,
  }
}
