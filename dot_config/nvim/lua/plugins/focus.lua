-- ~/.config/nvim/lua/plugins/focus.lua
return {
  {
    "folke/twilight.nvim",
    opts = {
      dimming = { alpha = 0.25 },
      context = 2,
      treesitter = true,
    },
  },

  {
    "joshuadanpeterson/typewriter.nvim",
    opts = {
      enable_with_zen_mode = true,
      keep_cursor_position = true,
      start_enabled = false,
    },
  },

  {
    "folke/zen-mode.nvim",
    dependencies = {
      "folke/twilight.nvim",
      "joshuadanpeterson/typewriter.nvim",
    },
    keys = {
      { "<leader>z", "<cmd>ZenMode<cr>", desc = "Toggle Focus Mode" },
    },
    opts = {
      window = {
        width = 80,
        options = {
          number = false,
          relativenumber = false,
          signcolumn = "no",
          cursorline = false,
        },
      },
      plugins = {
        twilight = { enabled = false }, -- handled manually in on_open
        gitsigns = { enabled = false },
        diagnostics = { enabled = false },
      },
      on_open = function()
        vim.b.completion = false
        vim.opt.wrap = true
        vim.opt.linebreak = true
        local prose = { markdown = true, text = true, tex = true, org = true }
        if prose[vim.bo.filetype] then
          vim.cmd("Twilight")
        end
      end,
      on_close = function()
        vim.b.completion = true
        vim.opt.wrap = false
        vim.opt.linebreak = false
        vim.cmd("TwilightDisable")
      end,
    },
  },
}
