return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "MunifTanjim/nui.nvim",
    },
    opts = {
        close_if_last_window = false,
        popup_border_style = "rounded",
        -- enable_git_status = true,
        -- enable_diagnostics = true,
        -- open_files_do_not_replace_types = { "terminal", "trouble", "qf" },
        filesystem = {
            filtered_items = {
                visible = true,
                show_hidden_count = true,
                hide_dotfiles = false,
                hide_gitignored = false,
                never_show = {},
            },
        },
    },
    config = function()
        vim.keymap.set("n", "<C-n>", "<Cmd>Neotree filesystem reveal right toggle<CR>", {})
        vim.keymap.set("n", "<leader>bf", "<Cmd>Neotree buffers reveal float<CR>", {})
    end,
}
