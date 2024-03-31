
local lsp_zero = require('lsp-zero')

lsp_zero.preset("recommended")

lsp_zero.on_attach(function(client, bufnr)
  -- see :help lsp-zero-keybindings
  -- to learn the available actions
  lsp_zero.default_keymaps({buffer = bufnr})
end)



require('mason').setup({})
require('mason-lspconfig').setup({
    -- Replace the language servers listed here 
    -- with the ones you want to install
    ensure_installed = {'lua_ls'},
    handlers = {
        lsp_zero.default_setup,
    },
})


local cmp = require('cmp')

lsp_zero.defaults.cmp_mappings({
    ["<C-Space>"] = cmp.mapping.complete()
})

lsp_zero.on_attach(function(client, buffer)
    local opts = {buffer=buffer, remap=false}

    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
end)

require'lspconfig'.lua_ls.setup {
  settings = {
    Lua = {
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {'vim'},
      },
    },
  },
}
