-- Install and configure dadbod (database manager)
return {
    {
        "tpope/vim-dadbod",
        dependencies = {
            "kristijanhusak/vim-dadbod-ui",
            "kristijanhusak/vim-dadbod-completion",
        },
        config = function()
            local M = {}

            local function db_completion()
                require("blink").setup.buffer { sources = { { name = "vim-dadbod-completion" } } }
            end

            function M.setup()
                vim.g.db_ui_save_location = vim.fn.stdpath "config" .. require("plenary.path").path.sep .. "db_ui"

                vim.api.nvim_create_autocmd("FileType", {
                    pattern = {
                        "sql",
                    },
                    command = [[setlocal omnifunc=vim_dadbod_completion#omni]],
                })

                vim.api.nvim_create_autocmd("FileType", {
                    pattern = {
                        "sql",
                        "mysql",
                        "plsql",
                    },
                    callback = function()
                        vim.schedule(db_completion)
                    end,
                })

                vim.api.nvim_create_autocmd("FileType", {
                    pattern = {
                        'dbui',
                        'dbout',
                    },
                    callback = function()
                        vim.api.nvim_buf_set_keymap(0, 'n', 'r', 'k', { noremap = true, silent = true })
                    end,
                })
            end

            return M
        end,
    },
}
