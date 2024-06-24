local ld = require('lazydocker.config')

vim.keymap.set('n', '<leader>lg', vim.cmd.LazyGit)
vim.keymap.set('n', '<leader>ld', vim.cmd.LazyDocker)

ld.options = {
  popup_window = {
    enter = true,
    focusable = true,
      zindex = 40,
      position = "50%",
      relative = "editor",
      size = {
        width = "90%",
        height = "90%",
      },
      buf_options = {
        modifiable = true,
        readonly = false,
      },
      win_options = {
        winhighlight = "Normal:Normal,FloatBorder:FloatBorder",
        winblend = 0,
      },
      border = {
        highlight = "FloatBorder",
        style = "rounded",
        text = {
          top = " Lazydocker ",
        },
      },
    }
}

