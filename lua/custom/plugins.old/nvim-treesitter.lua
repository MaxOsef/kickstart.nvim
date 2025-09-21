-- Install and configure tree-sitter languages
return {
    {
        "nvim-treesitter/nvim-treesitter",
        lazy = false,
        run = ":TSUpdate",
        dependencies = {
            "nvim-treesitter/nvim-treesitter-textobjects",
            "nushell/tree-sitter-nu"
        },
        config = function()
            require("nvim-treesitter.configs").setup({
                -- To install additional languages, do: `:TSInstall <mylang>`. `:TSInstall maintained` to install all maintained
                ensure_installed = {
                    "c",
                    "lua",
                    "vim",
                    "vimdoc",
                    "query",
                    "markdown",
                    "markdown_inline",
                    "comment",
                    "php",
                    "phpdoc",
                    "http",
                    "nu",
                    "zig",
                },
                sync_installed = true,
                highlight = {
                    enable = true, -- This is a MUST
                    additional_vim_regex_highlighting = { "markdown" },
                },
                context_commentstring = {
                    enable = true,
                    enable_autocmd = false,
                },
                indent = {
                    enable = true, -- Really breaks stuff if true
                },
                incremental_selection = {
                    enable = true,
                    keymaps = {
                        init_selection = "<C-space>",
                        node_incremental = "<C-space>",
                        scope_incremental = false,
                        node_decremental = "<bs>",
                    },
                },
            })

            -- Enable folds (zc and zo) on functions and classes but not by default
            vim.cmd([[
                set nofoldenable
                set foldmethod=expr
                set foldexpr=nvim_treesitter#foldexpr()
            ]])
        end,
    }
}
