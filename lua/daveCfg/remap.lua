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


vim.keymap.set("n", "<leader>cd", function()
    local projectsArray = {
        "C:\\Users\\div89\\source\\repos\\CmMateriePlastiche",
        "C:\\Users\\div89\\AppData\\Local\\nvim",
        "C:\\Users\\div89\\Documents\\lua\\nvim plugin"
    }

    vim.ui.select(projectsArray,{ nrompt = "selezionare un progetto" }, function (str)
        if str ~= nil then
            vim.cmd("cd " .. str)
        end
    end)


end)

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
