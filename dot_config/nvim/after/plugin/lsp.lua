local lsp_zero = require('lsp-zero')

local function opt(desc)
    return { buffer = bufnr, desc = "LSP " .. desc }
end

function custom_on_attach(client, bufnr)
  -- see :help lsp-zero-keybindings
  -- to learn the available actions
  -- lsp_zero.default_keymaps({buffer = bufnr})
  vim.keymap.set('n', '<leader>jd', vim.lsp.buf.definition, opt 'Go to definition')
  vim.keymap.set('n', '<leader>jt', vim.lsp.buf.type_definition, opt 'Go to type definition')
  vim.keymap.set('n', '<leader>jl', vim.lsp.buf.references, opt 'List references of symbol')
  vim.keymap.set('n', '<leader>mh', vim.lsp.buf.hover, opt 'Displays hover about the symbol')
  vim.keymap.set('n', '<leader>ms', vim.lsp.buf.signature_help, opt 'Get signature_help')
  vim.keymap.set('n', '<leader>mf', vim.lsp.buf.format, opt 'Format buffer/file')
  vim.keymap.set('n', '<leader>ma', vim.lsp.buf.code_action, opt 'Select a code action')
  vim.keymap.set('n', '<leader>dh', vim.diagnostic.open_float, opt 'Open diagnostic window')
  vim.keymap.set('n', '<leader>dj', vim.diagnostic.goto_next, opt 'Move to next diagnostic')
  vim.keymap.set('n', '<leader>dk', vim.diagnostic.goto_prev, opt 'Move to prev diagnostic')
end

lsp_zero.on_attach(custom_on_attach)

lsp_zero.setup_servers({ 'gopls', 'basedpyright', 'dockerls', 'yamlls', 'bashls', 'lua_ls' })
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
lsp_zero.use('basedpyright', {
    settings = {
        basedpyright = {
            analysis = {
                diagnosticSeverityOverrides = {
                    reportPrivateLocalImportUsage = "none",
                    reportImplicitRelativeImport = "none",
                    reportIgnoreCommentWithoutRule = "none",
                }
            },
        },
    },
})

-- to learn how to use mason.nvim
-- read this: https://github.com/VonHeikemen/lsp-zero.nvim/blob/v3.x/doc/md/guide/integrate-with-mason-nvim.md
require('mason').setup({
  ensure_installed = {
      "black",
      "yamlfmt",
      "debugpy",
      "shellcheck", -- Doesn't work with null_ls, manually install
  },
})
require('mason-lspconfig').setup({
  ensure_installed = {
      "gopls",
      "basedpyright",
      "dockerls",
      "yamlls",
      "bashls",
      "lua_ls",
  },
})
local null_ls = require('null-ls')
null_ls.setup({
    sources = {
        null_ls.builtins.formatting.black,
        null_ls.builtins.formatting.yamlfmt.with({
            extra_args = { "-formatter", "indent=4" },
        }),
    }
})
require('mason-null-ls').setup({
    automatic_installation = true,
})
require("dapui").setup()
vim.api.nvim_create_user_command("DapUiToggle", function()
  require("dapui").toggle()
end, {})
vim.keymap.set('n', '<leader>mo', '<cmd>Mason<CR>')
vim.keymap.set('n', '<leader>dt', '<cmd>DapUiToggle<CR>', {noremap=true})
vim.keymap.set('n', '<leader>db', '<cmd>DapToggleBreakpoint<CR>', {noremap=true})
vim.keymap.set('n', '<leader>dc', '<cmd>DapContinue<CR>', {noremap=true})


local has_words_before = function()
    unpack = unpack or table.unpack
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local cmp = require('cmp')
cmp.setup({
    mapping = {
        ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                if #cmp.get_entries() == 1 then
                    cmp.confirm({ select = true })
                else
                    cmp.select_next_item()
                end
            elseif has_words_before() then
                cmp.complete()
                if #cmp.get_entries() == 1 then
                    cmp.confirm({ select = true })
                end
            else
                fallback()
            end
        end, { "i", "s" }),
    }
})

