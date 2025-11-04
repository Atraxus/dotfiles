return {
  "Vigemus/iron.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local iron = require("iron.core")
    local view = require("iron.view")
    local common = require("iron.fts.common")

    iron.setup({
      config = {
        scratch_repl = true, -- discard REPL buffers on close
        repl_definition = {
          sh = {
            command = { "zsh" },
          },
          python = {
            command = { "python" },
            format = common.bracketed_paste_python,
            block_dividers = { "# %%", "#%%" },
            env = { 
                PYTHON_BASIC_REPL = "1",
            },
          },
        },
        repl_filetype = function(_, ft)
          return ft
        end,
        dap_integration = true,
        repl_open_cmd = view.right(80),
      },

      keymaps = {
        -- REPL management
        toggle_repl = "<leader>rr",
        restart_repl = "<leader>rR",
        interrupt = "<leader>ri",
        exit = "<leader>rq",
        clear = "<leader>rc",

        -- Sending code
        send_motion = "<leader>r",
        visual_send = "<leader>r",
        send_file = "<leader>rf",
        send_line = "<leader>rl",
        send_code_block = "<leader>rb",
        send_code_block_and_move = "<leader>rn",
        mark_motion = "<leader>mm",
        mark_visual = "<leader>mv",
        remove_mark = "<leader>md",
      },

      highlight = { italic = true },
      ignore_blank_lines = true,
    })

    -- Convenience keymaps
    -- vim.keymap.set("n", "<leader>rf", "<cmd>IronFocus<cr>", { desc = "Focus REPL" })
    -- vim.keymap.set("n", "<leader>rh", "<cmd>IronHide<cr>", { desc = "Hide REPL" })
  end,
}

