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

      -- Transparent background
      vim.api.nvim_set_hl(0, "Normal",       { bg = "none" })
      vim.api.nvim_set_hl(0, "NormalNC",     { bg = "none" })
      vim.api.nvim_set_hl(0, "NormalFloat",  { bg = "none" })
      vim.api.nvim_set_hl(0, "FloatBorder",  { bg = "none" })
      vim.api.nvim_set_hl(0, "VertSplit",    { bg = "none" })
      vim.api.nvim_set_hl(0, "SignColumn",   { bg = "none" })
      vim.api.nvim_set_hl(0, "StatusLine",   { bg = "none" })
      vim.api.nvim_set_hl(0, "LineNr",       { bg = "none" })
      vim.api.nvim_set_hl(0, "EndOfBuffer",  { bg = "none" })
    end,
  }
}
