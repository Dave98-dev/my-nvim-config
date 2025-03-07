local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>ps', function()
    local grep_val = vim.fn.input("Grep > ")
    if(grep_val ~= "") then
        builtin.grep_string({search = grep_val})
    end
end)

vim.api.nvim_create_user_command("ListFunctions", function() require('telescope.builtin').lsp_document_symbols({ symbols='function' }) end, {nargs=0})
