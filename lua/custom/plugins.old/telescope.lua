return {
    { -- Install and configure telescope
        'nvim-telescope/telescope.nvim',
        branch = '0.1.x',
        dependencies = {
            'nvim-lua/plenary.nvim'
        },
        config = function()
            require('telescope').setup {
                defaults = {
                    mappings = {
                        i = {
                            ['<C-u>'] = false,
                            ['<C-d>'] = false,
                        },
                    },
                },
                pickers = {
                    find_files = {
                        theme = 'dropdown',
                        previewer = false,
                    },
                    grep_string = {
                        theme = 'dropdown',
                    },
                    live_grep = {
                        theme = 'dropdown',
                    },
                    buffers = {
                        theme = 'dropdown',
                        previewer = false,
                    },
                    oldfiles = {
                        theme = 'dropdown',
                        previewer = false,
                    },
                    help_tags = {
                        theme = 'dropdown',
                    },
                    diagnostics = {
                        theme = 'dropdown',
                    },
                }
            }

            -- Enable telescope fzf native, if installed
            pcall(require('telescope').load_extension, 'fzf')

            -- See `:help telescope.builtin`
            vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
            vim.keymap.set('n', '<leader>s<space>', require('telescope.builtin').buffers, { desc = '[ ] Find existing buffers' })
            vim.keymap.set('n', '<leader>/', require('telescope.builtin').current_buffer_fuzzy_find, { desc = '[/] Fuzzily search in current buffer]' })
            vim.keymap.set('n', '<leader>sf', require('telescope.builtin').find_files, { desc = '[S]earch [F]iles' })
            vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
            vim.keymap.set('n', '<leader>sw', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' })
            vim.keymap.set('n', '<leader>sg', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' })
            vim.keymap.set('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })
            vim.keymap.set('n', '<leader>sc', function ()
                require('telescope.builtin').find_files({
                    cwd = vim.fn.stdpath('config') .. '/lua',
                })
            end,
                { desc = '[S]earch Neovim [C]onfig' }
            )
            vim.keymap.set('n', '<leader>sr', function ()
                require('telescope.builtin').find_files({
                    cwd = vim.env.HOME .. '/.config',
                })
            end,
                { desc = '[S]earch [R]iver Config' }
            )
        end,
    },
}

-- lua/jazz/config/telescope.lua

-- [[ Configure Telescope ]]
-- See `:help telescope` and `:help telescope.setup()`
