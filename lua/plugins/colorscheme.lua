return {
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
        opts = {
            flavour = "mocha",
        },
        config = function()
            vim.cmd.colorscheme 'catppuccin'

            vim.cmd([[
                highlight! Pmenu guibg=#1E1E2E guifg=#D9E0EE
                highlight! PmenuSel guibg=#555555 guifg=#ffffff
            ]])
        end
    }
    -- {
    --     "dgox16/oldworld.nvim",
    --     lazy = false,
    --     priority = 1000,
    --     config = function()
    --         vim.cmd.colorscheme("oldworld")
    --     end
    -- }
    -- {
    --   'sainnhe/everforest',
    --   priority = 1000,
    --   lazy = false,
    --   config = function()
    --     vim.cmd.colorscheme("everforest")
    --   end
    -- }
    -- {
    --     "neanias/everforest-nvim",
    --     version = false,
    --     lazy = false,
    --     priority = 1000,
    --     config = function()
    --         require("everforest").setup()
    --         vim.cmd.colorscheme("everforest")
    --     end
    -- }
    -- {
    --     'PaideiaDilemma/penumbra.nvim',
    --     config = function()
    --         vim.cmd.colorscheme("penumbra")
    --     end
    -- }
    -- {
    --     "EdenEast/nightfox.nvim",
    --     priority = 1000,
    --     lazy = false,
    --     config = function()
    --         require("nightfox").setup({})
    --         vim.cmd.colorscheme("nightfox")
    --     end
    -- }
    -- {
    --     "ofirgall/ofirkai.nvim",
    --     branch = 'exp',
    --     priority = 1000,
    --     lazy = false,
    --     config = function()
    --         require('ofirkai').setup {
    --             theme = 'dark_blue'
    --         }
    --     end
    -- }
    -- {
    --     'polirritmico/monokai-nightasty.nvim',
    --     lazy = false,
    --     priority = 1000,
    --     config = function()
    --         vim.opt.background = 'dark'
    --         require("monokai-nightasty").setup({
    --             dark_style_background = "default"
    --         })
    --         require("monokai-nightasty").load()
    --     end
    -- }
    -- {
    --     "loctvl842/monokai-pro.nvim",
    --     priority = 1000,
    --     lazy = false,
    --     config = function()
    --         require("monokai-pro").setup({
    --             transparent_background = true,
    --             filter = "classic"
    --         })
    --         vim.cmd.colorscheme("monokai-pro")
    --     end
    -- }
}
