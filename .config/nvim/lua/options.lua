-- Persistent Undo
vim.opt.undofile = true
-- Clipboard
vim.opt.clipboard = "unnamedplus"
-- Disabled creation of swap files
vim.opt.swapfile = false

-- Recursively search directories and sub-directories
vim.opt.path:append("**")
-- Ignore unwanted directories
vim.opt.wildignore:append("*/node_modules/*,*/dist/*,*/build/*")
-- Tree Style netrw
vim.g.netrw_liststyle = 3

-- Use spaces instead of tabs
vim.opt.expandtab = true
-- Spaces to use for each step of autoindent
vim.opt.shiftwidth = 4
-- Smart indent based on context in code
vim.opt.smartindent = true
-- Number of spaces a tab is
vim.opt.tabstop = 4
-- Insert specified amount of spaces when pressing Tab
vim.opt.softtabstop = 4

-- Ignore case in search patterns
vim.opt.ignorecase = true
-- Override ignorecase if the search contains uppercase letters
vim.opt.smartcase = true

-- Put my horizontal splits to the right instead of the left
vim.opt.splitright = true
-- Put my vertical splits under me instead of above me
vim.opt.splitbelow = true

-- Keep n amount of lines visible above and below the cursor when scrolling
vim.opt.scrolloff = 10
-- Enabled true colours (without it colours will be wrong in ssh/tmux)
vim.opt.termguicolors = true
-- Show sidebar numbers
vim.opt.number = true
vim.opt.relativenumber = true
-- Always have signcolumn visible so signs don't push everything to the right
vim.opt.signcolumn = "yes"
-- Border for windows
vim.opt.winborder = "single"
