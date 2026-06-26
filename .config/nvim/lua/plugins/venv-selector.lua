return {
  "linux-cultist/venv-selector.nvim",
  ft = "python",
  opts = {
    options = {
      notify_user_on_venv_activation = true,
    },
  },
  keys = {
    { "<leader>vs", "<cmd>VenvSelect<cr>", desc = "Select VirtualEnv" },
  },
}
