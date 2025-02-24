require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

map("n", "<c-p>", "<cmd>Telescope find_files<cr>", { desc = "telescope find files" })
map("n", "\\", "<cmd>NvimTreeToggle<cr>", { desc = "close nerd tree" })
map("n", "\f", "<cmd>NvimTreeFocus<cr>", { desc = "focus on the open file" })


-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
