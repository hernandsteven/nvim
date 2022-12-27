-- Keymap variable (for conciseness)
local keymap = vim.keymap
local opts = { noremap = true, silent = true }
local g = vim.g
local v = vim.v
------------------------------------
-- Leader Key (space)
g.mapleader = " "

--copilot
vim.cmd([[
  imap <silent><script><expr> <C-J> copilot#Accept("")
  let g:copilot_no_tab_map = v:true
]])

-- [General Keymaps]
-- set a keymap that interrupts the current process in terminal mode using the keys <C-c>
--keymap.set("n", "<C-c", ":<C-u>stop<CR>", opts)
keymap.set("n", "<C-s>", "<Cmd>w<CR>") -- save file
keymap.set("i", "kj", "<ESC>") -- Go into normal mode using (kj)
keymap.set("n", "<leader>nh", ":nohl<CR>") -- No highlights when using search mode (leader+nh)
keymap.set("n", "x", '"_x') -- No saving to register when deleting using X
keymap.set("n", "<leader>+", "<C-a>") -- Increment number
keymap.set("n", "<leader>-", "<C-x>") -- Decrement number

-- [Window Splitting] --
keymap.set("n", "<leader>sv", "<C-w>v") -- split vertically
keymap.set("n", "<leader>sh", "<C-w>s") -- split horizontally
keymap.set("n", "<leader>se", "<C-w>=") -- equal width
keymap.set("n", "<leader>sx", ":close<CR>") -- close current window

-- [Tabs] --
keymap.set("n", "<leader>to", ":tabnew<CR>:NvimTreeToggle<CR>") -- new tab
keymap.set("n", "<C-]>", "<Cmd>BufferNext<CR>") -- next tab
keymap.set("n", "<C-[>", "<Cmd>BufferPrevious<CR>") -- previous tab
keymap.set("n", "<leader>tx", "<Cmd>BufferClose<CR>") -- close current tab
keymap.set("n", "<C-p>", "<Cmd>BufferPick<CR>", opts)

-- [Plugin Keymaps] --
-- vim maximizer
keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>") -- maximize window
-- nvim tree
keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>") -- toggle tree
-- telescope
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>")
keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>")
keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>")
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>")
keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>")
-- lazy git
keymap.set("n", "<leader>lg", "<cmd>LazyGit<cr>")
