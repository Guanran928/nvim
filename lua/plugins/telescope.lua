require("telescope").setup()
local builtin = require("telescope.builtin")

vim.keymap.set("n", "<Space>f", builtin.find_files, {})
vim.keymap.set("n", "<Space><Space>", builtin.oldfiles, {})

vim.keymap.set("n", "<Space>sg", builtin.live_grep, {})
vim.keymap.set("n", "<Space>sh", builtin.help_tags, {})
