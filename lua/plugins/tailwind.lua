return {
    {
        "luckasRanarison/tailwind-tools.nvim",
        name = "tailwind-tools",
        build = ":UpdateRemotePlugins",
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
            "nvim-telescope/telescope.nvim",
            "neovim/nvim-lspconfig"
        },
        config = function()
            require("tailwind-tools").setup({
                server = {
                    override = false
                },
                document_color = {
                    enabled = false
                }
            })
        end
    }
}
