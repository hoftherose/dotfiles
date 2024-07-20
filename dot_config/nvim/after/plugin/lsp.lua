local lsp_zero = require('lsp-zero')

local function opt(desc)
    return { buffer = bufnr, desc = "LSP " .. desc }
end

function custom_on_attach(client, bufnr)
  -- see :help lsp-zero-keybindings
  -- to learn the available actions
  -- lsp_zero.default_keymaps({buffer = bufnr})
  vim.keymap.set('n', '<leader>gd', vim.lsp.buf.definition, opt 'Go to definition')
  vim.keymap.set('n', '<leader>gt', vim.lsp.buf.type_definition, opt 'Go to type definition')
  vim.keymap.set('n', '<leader>gl', vim.lsp.buf.references, opt 'List references of symbol')
  vim.keymap.set('n', '<leader>mh', vim.lsp.buf.hover, opt 'Displays hover about the symbol')
  vim.keymap.set('n', '<leader>ms', vim.lsp.buf.signature_help, opt 'Get signature_help')
  vim.keymap.set('n', '<leader>mf', vim.lsp.buf.format, opt 'Format buffer/file')
  vim.keymap.set('n', '<leader>ma', vim.lsp.buf.code_action, opt 'Select a code action')
  vim.keymap.set('n', '<leader>dh', vim.diagnostic.open_float, opt 'Open diagnostic window')
  vim.keymap.set('n', '<leader>dj', vim.diagnostic.goto_prev, opt 'Move to prev diagnostic')
  vim.keymap.set('n', '<leader>dk', vim.diagnostic.goto_next, opt 'Move to next diagnostic')
end

lsp_zero.on_attach(custom_on_attach)

lsp_zero.setup_servers({ 'gopls', 'basedpyright' })--, 'ruff_lsp' })
lsp_zero.configure('gopls', {
    cmd = {'gopls'},
    settings = {
        gopls = {
            completeUnimported = true,
            usePlaceholders = true,
            analyses = {
                unusedparams = true
            },
        }
    }
})

lsp_zero.configure('basedpyright', {})

-- lsp_zero.configure('ruff_lsp', {
--     settings = {
--         codeAction = {
--             disableRuleComment = {
--                 enable = false,
--             },
--         },
--         lint = {
--             run = 'onSave',
--         },
--     }
-- })

-- to learn how to use mason.nvim
-- read this: https://github.com/VonHeikemen/lsp-zero.nvim/blob/v3.x/doc/md/guide/integrate-with-mason-nvim.md
mason = require('mason')
mason_lsp = require('mason-lspconfig')

mason.setup({})
mason_lsp.setup({
  ensure_installed = {
      "gopls",
      "ruff_lsp",
      "basedpyright",
  },
})

vim.keymap.set('n', '<leader>mo', '<cmd>Mason<CR>', {})

