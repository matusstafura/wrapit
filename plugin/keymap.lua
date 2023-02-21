vim.keymap.set("v", "<leader>l", ":lua require('linkit').link()<CR><CR>")
vim.keymap.set("v", "<leader>k", ":lua require('linkit').image()<CR><CR>")
vim.keymap.set("v", "<leader>j", ":lua P(require('linkit').helper())<CR><CR>")
