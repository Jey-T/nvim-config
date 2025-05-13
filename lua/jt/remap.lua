vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" })
vim.keymap.set("n", "<D-F>", builtin.live_grep, { desc = "Telescope live grep" })
vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })
vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" })
vim.keymap.set("n", "<leader>n", "<Cmd>Neotree toggle<CR>")

--save with command s
vim.keymap.set("n", "<D-s>", ":w<CR>", { noremap = true })
vim.keymap.set("i", "<D-s>", "<Esc>:w<CR>", { noremap = true }) -- save in insert mode

--undo command z
vim.keymap.set("n", "<D-z>", "u", { noremap = true }) -- undo save in normal mode
vim.keymap.set("i", "<D-z>", "<Esc>u", { noremap = true }) -- undo save in insert mode
--redo command z
vim.keymap.set("n", "<D-Z>", "<C-r>", { noremap = true })
vim.keymap.set("i", "<D-Z>", "<Esc><C-r>", { noremap = true }) -- save in insert mode
