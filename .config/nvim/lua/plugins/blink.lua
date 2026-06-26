return {
  {
    "BlinkResearchLabs/blink-edit.nvim",
    commit = "220f577",
    event = "InsertEnter",
    opts = {
      llm = {
        provider = "sweep",
        backend = "ollama",
        url = "http://localhost:11434",
        model = "sweep-edit-fast:latest",
        timeout_ms = 10000,
      },
    },
    keys = {
      {
        "<leader>ut",
        function()
          require("blink-edit").toggle()
        end,
        mode = { "n" },
        desc = "Toggle blink-edit predictions",
      },
      {
        "<leader>bp",
        function()
          require("blink-edit").trigger()
        end,
        mode = { "n" },
        desc = "Trigger blink-edit prediction",
      },
    },
  },
}
