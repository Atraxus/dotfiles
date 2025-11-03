-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Soft wrap for text / prose
vim.api.nvim_create_autocmd({"FileType"}, {
  pattern = {"markdown", "text", "org"}, 
  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.linebreak = true   -- avoid breaking in middle of words
    vim.opt_local.showbreak = "↪ "    -- mark wrapped lines
    vim.opt_local.number = false
    vim.opt_local.relativenumber = false
  end
})

-- Increase scrolloff so cursor stays away from screen edges
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 5

-- Example toggle for “focus mode”
vim.keymap.set("n", "<leader>z", function()
  -- toggling numbers, statusline, tabline, etc.
  vim.opt.laststatus = (vim.opt.laststatus:get() == 3) and 0 or 3
  vim.opt.showtabline = (vim.opt.showtabline:get() == 2) and 0 or 2
  vim.opt.number = not vim.opt.number:get()
  vim.opt.relativenumber = not vim.opt.relativenumber:get()
end, { desc = "Toggle distraction-free mode" })

-- Setup lazy.nvim
require("lazy").setup({
  spec = {
    -- import your plugins
    { import = "plugins" },
  },
  -- Configure any other settings here. See the documentation for more details.
  -- colorscheme that will be used when installing plugins.
  install = { colorscheme = { "habamax" } },
  -- automatically check for plugin updates
  checker = { enabled = true },
})
