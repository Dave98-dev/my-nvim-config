Elastic = require("elastic")

vim.keymap.set("v", "<leader>el", Elastic.Elastic_interactive)
vim.keymap.set("n", "<leader>cd", Elastic.Show_Projects)
vim.keymap.set("n", "<leader>ee", Elastic.Show_Files)

vim.api.nvim_create_user_command("AddDirectory", Elastic.Add_Current_Working_Directory, {nargs = 0})
vim.api.nvim_create_user_command("ShowProjects", Elastic.Show_Projects, {nargs = 0})
vim.api.nvim_create_user_command("AddFile", Elastic.Add_Current_File, {nargs = 0})
vim.api.nvim_create_user_command("ShowFiles", Elastic.Show_Files, {nargs = 0})
