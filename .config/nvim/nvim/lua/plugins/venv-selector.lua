return {
  "linux-cultist/venv-selector.nvim",
  event = "VeryLazy",
  opts = {
    auto_refresh = true,
    stay_on_this_version = false,
  },
  keys = {
    { "<leader>vs", "<cmd>VenvSelect<cr>", desc = "Select VirtualEnv" },
  },
}

