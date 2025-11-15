-- =============================================================
-- Neovim init.lua - C++ Android Project
-- =============================================================

-- ---------------- Bootstrap Lazy.nvim ----------------
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    lazypath
  })
end
vim.opt.rtp:prepend(lazypath)
require("lazy").setup("plugins")

-- ---------------- Keymaps ----------------
-- Jump-definition / jump-back / tag list (gutentags)
vim.keymap.set("n", "gd", "<C-]>", { noremap = true })   -- jump to definition (tags)
vim.keymap.set("n", "gb", "<C-t>", { noremap = true })   -- jump back
vim.keymap.set("n", "gT", ":ts<CR>", { noremap = true }) -- show tag list

-- Optional: Tagbar toggle
vim.keymap.set("n", "<F8>", ":TagbarToggle<CR>", { noremap = true, silent = true })

-- ---------------- Other Settings ----------------
vim.opt.completeopt = "menu,menuone,noselect"
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.showcmd = true
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.wrap = false
vim.opt.ruler = true
vim.opt.laststatus = 2

-- Optional: statusline
vim.opt.statusline = "%f%m%r%h%w [%{&ff}] [TYPE=%Y] [POS=%l,%v] [%p%%]"

-- Optional: mouse support
-- vim.opt.mouse = "a"
vim.keymap.set("n", "<leader>cs", ":cs find s <C-R><C-W><CR>", { noremap=true, silent=true })
vim.keymap.set("n", "<leader>cg", ":cs find g <C-R><C-W><CR>", { noremap=true, silent=true })
vim.keymap.set("n", "<leader>cc", ":cs find c <C-R><C-W><CR>", { noremap=true, silent=true })
vim.keymap.set("n", "<leader>ct", ":cs find t <C-R><C-W><CR>", { noremap=true, silent=true })
vim.keymap.set("n", "<leader>ce", ":cs find e <C-R><C-W><CR>", { noremap=true, silent=true })
vim.keymap.set("n", "<leader>cf", ":cs find f <C-R><C-W><CR>", { noremap=true, silent=true })
vim.keymap.set("n", "<leader>ci", ":cs find i <C-R><C-W><CR>", { noremap=true, silent=true })
-- Notes:
-- 1. gutentags.nvim tạo/update tags → jump-definition gd, gb, gT
-- 2. LSP/autocomplete được setup trong lua/plugins/cpp.lua
