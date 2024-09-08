return {
    {
        "williamboman/mason.nvim",
        dependencies = {
            "williamboman/mason-lspconfig.nvim",
        },
        config = function()
            require("mason").setup({
                ui = {
                    icons = {
                        package_installed = "✓",
                        package_pending = "➜",
                        package_uninstalled = "✗",
                    },
                },
            })
        end,
    },
    {
        "williamboman/mason-lspconfig",
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = {
                    "ts_ls",
                    "html",
                    "cssls",
                    "tailwindcss",
                    "lua_ls",
                    "rust_analyzer",
                    "pyright",
                    "kotlin_language_server",
                    "clangd",
                    "mdx_analyzer",
                    "markdown_oxide",
                    "jsonls"
                },
                automatic_installation = true,
            })
        end,
    },
    {
        "neovim/nvim-lspconfig",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            { "antosha417/nvim-lsp-file-operations", config = true },
        },
        config = function()
            local lspconfig = require("lspconfig")
            local mason_lspconfig = require("mason-lspconfig")
            local cmp_nvim_lsp = require("cmp_nvim_lsp")
            local keymap = vim.keymap

            vim.api.nvim_create_autocmd("LspAttach", {
                group = vim.api.nvim_create_augroup("UserLspConfig", {}),
                callback = function(ev)
                    local opts = { buffer = ev.buf, silent = true }

                    opts.desc = "Show LSP references"
                    keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts)

                    opts.desc = "Go to declaration"
                    keymap.set("n", "gD", vim.lsp.buf.declaration, opts)

                    opts.desc = "Show LSP definitions"
                    keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts)

                    opts.desc = "Show LSP implementations"
                    keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts)

                    opts.desc = "Show LSP type definitions"
                    keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts)

                    opts.desc = "See available code actions"
                    keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)

                    opts.desc = "Smart rename"
                    keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)

                    opts.desc = "Show buffer diagnostics"
                    keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts)

                    opts.desc = "Show line diagnostics"
                    keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts)

                    opts.desc = "Go to previous diagnostic"
                    keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)

                    opts.desc = "Go to next diagnostic"
                    keymap.set("n", "]d", vim.diagnostic.goto_next, opts)

                    opts.desc = "Show documentation for what is under cursor"
                    keymap.set("n", "K", vim.lsp.buf.hover, opts)

                    opts.desc = "Restart LSP"
                    keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts)
                end,
            })

            local capabilities = cmp_nvim_lsp.default_capabilities()

            local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
            for type, icon in pairs(signs) do
                local hl = "DiagnosticSign" .. type
                vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
            end

            mason_lspconfig.setup_handlers({
                function(server_name)
                    lspconfig[server_name].setup({
                        capabilities = capabilities,
                    })
                end,
                ["html"] = function()
                    lspconfig["html"].setup({
                        capabilities = capabilities,
                    })
                end,
                ["ts_ls"] = function()
                    lspconfig["ts_ls"].setup({
                        capabilities = capabilities,
                    })
                end,
                ["tailwindcss"] = function()
                    lspconfig["tailwindcss"].setup({
                        capabilities = capabilities,
                    })
                end,
                ["cssls"] = function()
                    lspconfig["cssls"].setup({
                        capabilities = capabilities,
                        settings = {
                            css = {
                                validate = true,
                                lint = {
                                    unknownAtRules = "ignore"
                                }
                            }
                        },
                        scss = {
                            validate = true,
                            lint = {
                                unknownAtRules = "ignore"
                            }
                        },
                        less = {
                            validate = true,
                            lint = {
                                unknownAtRules = "ignore"
                            }

                        }
                    })
                end,
                ["emmet_ls"] = function()
                    lspconfig["emmet_ls"].setup({
                        capabilities = capabilities,
                        filetypes = {
                            "html",
                            "typescriptreact",
                            "javascriptreact",
                            "css",
                            "sass",
                            "scss",
                        },
                    })
                end,
                ["kotlin_language_server"] = function()
                    lspconfig["kotlin_language_server"].setup({
                        capabilities = capabilities,
                    })
                end,
                ["clangd"] = function()
                    lspconfig["clangd"].setup({
                        capabilities = capabilities,
                    })
                end,
                -- ["denols"] = function()
                --     lspconfig["denols"].setup({
                --         capabilities = capabilities
                --     })
                -- end,
                ["lua_ls"] = function()
                    -- configure lua server (with special settings)
                    lspconfig["lua_ls"].setup({
                        capabilities = capabilities,
                        settings = {
                            Lua = {
                                diagnostics = {
                                    globals = { "vim" },
                                },
                                completion = {
                                    callSnippet = "Replace",
                                },
                                workspace = {
                                    library = {
                                        [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                                        [vim.fn.stdpath("config") .. "/lua"] = true,
                                    },
                                },
                                hint = { enable = true },
                            },
                        },
                    })
                end,
                -- ["jdtls"] = function()
                -- 	lspconfig["jdtls"].setup({
                -- 		capabilities = capabilities,
                -- 		-- handlers = {
                -- 		-- 	["language/status"] = function(_, result) end,
                -- 		-- 	["$/progress"] = function(_, result, ctx) end,
                -- 		-- },
                -- 	})
                -- end,
            })
        end,
    },
    {
        "stevearc/conform.nvim",
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            local conform = require("conform")

            conform.setup({
                formatters_by_ft = {
                    javascript = { "prettierd", "prettier" },
                    typescript = { "prettierd", "prettier" },
                    javascriptreact = { "prettierd", "prettier" },
                    typescriptreact = { "prettierd", "prettier" },
                    rust = { "rustfmt" },
                    css = { "prettierd", "prettier" },
                    html = { "prettierd", "prettier" },
                    json = { "fixjson", "deno_fmt" },
                    yaml = { "yamlfix" },
                    markdown = { "markdownlint", "markdownfmt" },
                    lua = { "stylua" },
                    python = { "isort", "black" },
                    java = { "google-java-format" },
                    kotlin = { "ktlint", "ktfmt" },
                    c = { "clang-format" },
                    cpp = { "clang-format" },
                    bash = { "shfmt" },
                    sh = { "shfmt" },
                    zsh = { "shfmt" },
                    fish = { "shfmt" },
                    xml = { "xmllint", "xmlformat" }
                },
                format_on_save = {
                    lsp_format = "fallback",
                    async = false,
                    timeout_ms = 500,
                },
                formatters = {
                }
            })

            vim.keymap.set({ "n", "v" }, "<leader>mp", function()
                conform.format({
                    lsp_fallback = true,
                    async = false,
                    timeout_ms = 1000,
                })
            end, { desc = "Format file or range (in visual mode)" })
        end,
    },
    {
        "zeioth/garbage-day.nvim",
        dependencies = "neovim/nvim-lspconfig",
        event = "VeryLazy",
        opts = {},
    }
}
