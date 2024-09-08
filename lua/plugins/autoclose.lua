return {
    {
        "cohama/lexima.vim",
        event = { "InsertEnter" },
    },
    {
        "windwp/nvim-ts-autotag",
        dependencies = "nvim-treesitter/nvim-treesitter",
        ft = { "html", "ts", "js", "tsx", "jsx", "xml" },
        lazy = true,
        event = "VeryLazy",
        config = function()
            local options = {
                auto_install = true,
                highlight = {
                    enable = true,
                    use_languagetree = true
                },
                autotag = {
                    enable = true,
                    filetypes = {
                        'html', 'javascript', 'typescript', 'javascriptreact', 'typescriptreact', 'css', 'lua', 'xml',
                        'markdown', 'php'
                    }
                },
                indent = { enable = true }
            }
            require('nvim-ts-autotag').setup(options)
        end
    },
}
