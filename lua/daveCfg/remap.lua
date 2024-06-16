vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("n", "<leader>n", ":tabnew<CR>")
vim.keymap.set("n", "<C-F4>", ":tabclose<CR>")
vim.keymap.set("n", "<c-t>", ":tabnext<CR>")
vim.keymap.set("n", "<leader>bt", function ()
    local pos = vim.api.nvim_win_get_cursor(0)[2]
    local line = vim.api.nvim_get_current_line()
    local nline = line:sub(0, pos) .. '`' .. line:sub(pos + 1)
    vim.api.nvim_set_current_line(nline)
end)

vim.keymap.set("v", "<leader>bt", ":s/\"/`/g<CR>:noh<CR>")



vim.keymap.set("n", "<M-j>", ":m .+1<CR>==", {silent = true})
vim.keymap.set("n", "<M-k>", ":m .-2<CR>==", {silent = true})
vim.keymap.set("i", "<M-j>", "<Esc>:m .+1<CR>==gi", {silent = true})
vim.keymap.set("i", "<M-k>", "<Esc>:m .-2<CR>==gi", {silent = true})
vim.keymap.set("v", "<M-j>", ":m '>+1<CR>gv=gv", {silent = true})
vim.keymap.set("v", "<M-k>", ":m '<-2<CR>gv=gv", {silent = true})

vim.keymap.set("n", "<M-Down>", ":m .+1<CR>==", {silent = true})
vim.keymap.set("n", "<M-Up>"  , ":m .-2<CR>==", {silent = true})
vim.keymap.set("i", "<M-Down>", "<Esc>:m .+1<CR>==gi", {silent = true})
vim.keymap.set("i", "<M-Up>"  , "<Esc>:m .-2<CR>==gi", {silent = true})
vim.keymap.set("v", "<M-Down>", ":m '>+1<CR>gv=gv", {silent = true})
vim.keymap.set("v", "<M-Up>"  , ":m '<-2<CR>gv=gv", {silent = true})

-- terminal mode
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")
vim.keymap.set("t", "<C-w>", "<C-\\><C-n><C-w>")

vim.keymap.set("n", "<C-w><S-Up>"  , "<C-w>K")
vim.keymap.set("n", "<C-w><S-Down>", "<C-w>J")
vim.keymap.set("n", "<C-w><S-Left>", "<C-w>H")
vim.keymap.set("n", "<C-w><S-Right>", "<C-w>L")
