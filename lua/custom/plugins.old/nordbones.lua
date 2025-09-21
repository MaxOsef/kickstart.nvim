return {
    {
        "zenbones-theme/zenbones.nvim",
        dependencies = "rktjmp/lush.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            vim.api.nvim_create_autocmd("ColorScheme", {
                desc = "Override Nordbones colors",
                callback = function()
                    local lush = require "lush"
                    local base = require "zenbones"

                    -- Create some specs
                    local specs = lush.parse(function()
                        return {
                            ColorColumn { base.ColorColumn, bg = "#353c49" },
                            Search { base.Search, fg="#2f3541", bg="#abb8cd" },
                            IncSearch { base.IncSearch, fg="#2f3541", bg="#abb8cd" },
                            CurSearch { base.IncSearch, fg="#2f3541", bg="#8296b5" },
                            MatchParen { base.MatchParen, bg="#556275" },
                        }
                    end)
                    -- Apply specs using lush tool-chain
                    lush.apply(lush.compile(specs))
                end,
            })

            vim.cmd.colorscheme('nordbones')
        end,
    },
}

