vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("n", "<C-n>", ":tabnew<CR>")
vim.keymap.set("n", "<C-F4>", ":tabclose<CR>")
vim.keymap.set("n", "<c-t>", ":tabnext<CR>")
vim.keymap.set("n", "<leader>bt", function ()
    local pos = vim.api.nvim_win_get_cursor(0)[2]
    local line = vim.api.nvim_get_current_line()
    local nline = line:sub(0, pos) .. '`' .. line:sub(pos + 1)
    vim.api.nvim_set_current_line(nline)    
end)

vim.keymap.set("v", "<leader>bt", ":s/\"/`/g<CR>:noh<CR>")
