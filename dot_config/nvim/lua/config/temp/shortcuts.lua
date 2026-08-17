require('shortcuts').setup(
    {
        override = true,
        defaults = {
            empty = {},
            default = {},
            python = {
                n = {
                    l = {
                      command_type = "background",
                      command = "uv run black ."
                    }
                }
            },
            docker = {
                n = {
                    b = {
                      command_type = "terminal",
                      command = "docker compose build"
                    },
                    u = {
                      command_type = "background",
                      command = "docker compose up -d",
                    },
                    d = {
                      command_type = "background",
                      command = "docker compose down",
                    },
                },
            },
            golang = {
                n = {
                    u = {
                        command_type = "terminal",
                        command = "go run main.go",
                    },
                    b = {
                        command_type = "terminal",
                        command = "go build main.go",
                    },
                },
            },
            lua = {
                n = {
                    l = {
                        command = "print('Example lua command')",
                        command_type = "lua",
                    }
                }
            },
            javascript = {
                n = {
                    u = {
                        command = "npm run dev",
                        command_type = "terminal",
                    }
                }
            },
        },
    }
)

vim.keymap.set('n', '<leader>aa', '<Cmd>ShortcutsToggle<CR>')

