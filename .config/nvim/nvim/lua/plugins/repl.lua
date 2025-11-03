return {
  "Vigemus/iron.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local iron = require("iron.core")
    local common = require("iron.fts.common")

    iron.setup({
      config = {
        scratch_repl = true, -- dedicated repl buffer
        repl_definition = {
          python = {
            command = function()
              local venv = os.getenv("VIRTUAL_ENV")
              if venv then
                return { venv .. "/bin/ipython" }
              else
                return { "ipython" }
              end
            end,
            format = common.bracketed_paste_python,
            block_dividers = { "# %%", "#%%" },
            env = {PYTHON_BASIC_REPL = "1"} --this is needed for python3.13 and up.
          },
          lua = { command = { "lua" } },
          bash = { command = { "bash" } },
        },
        repl_open_cmd = "vertical botright 80 split", -- or "botright 15 split"
      },
      keymaps = {
        send_motion = "<leader>r",
        visual_send = "<leader>r",
        send_file = "<leader>rf",
        send_line = "<leader>rl",
        send_until_cursor = "<leader>ru",
        send_code_block = "<space>sb",
        cr = "<leader>r<CR>",
        interrupt = "<leader>ri",
        exit = "<leader>rq",
        clear = "<leader>rc",
      },
      highlight = {
        italic = true,
      },
      ignore_blank_lines = true,
    })
  end,
}

