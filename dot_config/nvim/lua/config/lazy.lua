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
    vim.opt_local.linebreak = false   -- avoid breaking in middle of words
    vim.opt_local.showbreak = "↪ "    -- mark wrapped lines
    vim.opt_local.number = false
    vim.opt_local.relativenumber = false
  end
})

-- Increase scrolloff so cursor stays away from screen edges
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 5
vim.opt.conceallevel = 1

-- Toggle checkbox state
vim.keymap.set('n', '<leader>x', function()
  local line = vim.api.nvim_get_current_line()
  if line:match('%[ %]') then
    vim.api.nvim_set_current_line((line:gsub('%[ %]', '[x]')))
  elseif line:match('%[x%]') then
    vim.api.nvim_set_current_line((line:gsub('%[x%]', '[ ]')))
  end
end, { desc = 'Toggle checkbox' })

-- Setup lazy.nvim
require("lazy").setup({
  spec = {
    -- import your plugins
    { import = "plugins" },
  },
  -- automatically check for plugin updates
  checker = { enabled = false, frequency = 60*60*24*7 }, -- Check once per week
})
