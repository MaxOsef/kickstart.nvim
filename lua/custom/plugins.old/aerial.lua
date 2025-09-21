-- Install and configure aerial (Symbol outline)
return {
    {
        'stevearc/aerial.nvim',
        opts = {},
        -- Optional dependencies
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
            "nvim-tree/nvim-web-devicons"
        },
        config = function()
            require("aerial").setup({
                autojump = true,
                show_guides = true,
            })
            vim.keymap.set("n", "<leader>o", "<cmd>AerialToggle<CR>")
        end,
    },
}
