return {
  {
    "neovim/nvim-lspconfig",
    config = function()
      vim.lsp.enable('pyright')
      vim.lsp.enable('clangd')

      vim.diagnostic.config({
        virtual_text = false,
        virtual_lines = { current_line = true },
      })

      local opts = { noremap = true, silent = true }
      vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    end,
  }
}
