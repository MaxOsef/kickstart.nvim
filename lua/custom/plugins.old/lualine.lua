-- Install and configure lualine
return {
    {
        "nvim-lualine/lualine.nvim",
        dependencies = {
            'nvim-tree/nvim-web-devicons',
            opt = true
        },
        config = function()
            require('lualine').setup {
                options = {
                    icons_enabled = true,
                    theme = 'nordbones',
                    globalstatus = true,
                },
                sections = {
                    lualine_b = {
                        'filename',
                        'branch',
                        'diff'
                    },
                    lualine_c = {'aerial'},
                    lualine_x = {'encoding', 'filetype'},
                    lualine_y = {},
                },
            }
        end,
    },
}
