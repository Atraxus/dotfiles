-- ~/.config/nvim/lua/plugins/telescope.lua
return {
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8", -- Use the latest stable release
    dependencies = { "nvim-lua/plenary.nvim" },
    cmd = "Telescope",
    keys = {
      { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
      { "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Live Grep" },
      { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Buffers" },
      { "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Help Tags" },
      { "<leader>fG", function() require('telescope.builtin').grep_string({ search = vim.fn.expand('<cword>') }) end, desc = "Grep word under cursor" },
    },
    config = function()
      require("telescope").setup({
        defaults = {
          layout_config = {
            horizontal = { width = 0.9 },
            vertical = { width = 0.5 },
          },
          mappings = {
            i = {
              ["<C-h>"] = "which_key", -- Show available key mappings
            },
          },
        },
      })
    end,
  },
}

