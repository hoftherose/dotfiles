local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
  -- see :help lsp-zero-keybindings
  -- to learn the available actions
  lsp_zero.default_keymaps({buffer = bufnr})
end)


-- to learn how to use mason.nvim
-- read this: https://github.com/VonHeikemen/lsp-zero.nvim/blob/v3.x/doc/md/guide/integrate-with-mason-nvim.md
mason = require('mason')
mason_lsp = require('mason-lspconfig')
mason.setup({})
mason_lsp.setup({
  ensure_installed = {
      "gopls",
  },
  handlers = {
    function(server_name)
      require('lspconfig')[server_name].setup({})
    end,
  },
})

vim.keymap.set('n', '<leader>mo', '<cmd>Mason<CR>', {})
-- https://www.reddit.com/r/neovim/comments/14gyqau/what_is_the_trick_theprimegen_is_using_to_search/
vim.keymap.set("n", "<leader>mf", function()
    vim.lsp.buf.format()
end)

