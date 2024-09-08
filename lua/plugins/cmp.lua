return {
    {
        "hrsh7th/nvim-cmp",
        event = "InsertEnter",
        dependencies = {
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-nvim-lua",
            "L3MON4D3/LuaSnip",
            "saadparwaiz1/cmp_luasnip",
            "rafamadriz/friendly-snippets",
            "hrsh7th/cmp-nvim-lsp",
            "onsails/lspkind.nvim",
            "luckasRanarison/tailwind-tools.nvim"
        },
        config = function()
            local cmp = require("cmp")
            local luasnip = require("luasnip")
            require("luasnip.loaders.from_vscode").lazy_load()

            local function tooBig(bufnr)
                local max_filesize = 10 * 1024 -- 100KB
                local check_stats = (vim.uv or vim.loop).fs_stat
                local ok, stats = pcall(check_stats, vim.api.nvim_buf_get_name(bufnr))
                if ok and stats and stats.size > max_filesize then
                    return true
                else
                    return false
                end
            end

            local preferred_sources = {
                { name = "luasnip" },
                { name = "nvim_lsp" },
                { name = "nvim_lua" },
                { name = "path" },
                { name = "lazydev", group_index = 0 }
            }

            vim.api.nvim_create_autocmd("BufRead", {
                group = vim.api.nvim_create_augroup("CmpBufferDisableGrp", { clear = true }),
                callback = function(ev)
                    local sources = preferred_sources
                    if not (tooBig(ev.buf)) then
                        sources[#sources + 1] = { name = "buffer", keyword_length = 4 }
                    end
                    cmp.setup.buffer({
                        sources = cmp.config.sources(sources),
                    })
                end,
            })

            cmp.setup({
                performance = {
                    max_view_entries = 7
                },
                window = {
                    completion = {
                        winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None",
                        col_offset = -3,
                        side_padding = 0,
                    },
                    documentation = {
                        winhighlight = "Normal:CmpDocNormal,FloatBorder:CmpNormal",
                    },
                },
                completion = {
                    completeopt = "menu,menuone,preview,noselect",
                },
                formatting = {
                    fields = { "kind", "abbr", "menu" },
                    format = function(entry, vim_item)
                        local kind = require("lspkind").cmp_format({
                            mode = "symbol_text",
                            maxwidth = 50,
                            before = require("tailwind-tools.cmp").lspkind_format
                        })(entry, vim_item)
                        local strings = vim.split(kind.kind, "%s", { trimempty = true })
                        kind.kind = " " .. (strings[1] or "") .. " "
                        kind.menu = "    (" .. (strings[2] or "") .. ")"

                        return kind
                    end,
                },
                snippet = {
                    expand = function(args)
                        luasnip.lsp_expand(args.body)
                    end,
                },
                mapping = cmp.mapping.preset.insert({
                    ["<C-k>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
                    ["<C-j>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
                    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
                    ["<C-f>"] = cmp.mapping.scroll_docs(4),
                    ["<C-Space>"] = cmp.mapping.complete(),
                    ["<C-e>"] = cmp.mapping.abort(),
                    ["<CR>"] = cmp.mapping.confirm({ select = true }),
                }),
                sources = cmp.config.sources(
                    {
                        { name = "luasnip" },
                        { name = "nvim_lsp" },
                        { name = "nvim_lua" },
                        { name = "path" },
                        { name = "buffer",  keyword_length = 4 }
                    }
                ),
            })
        end,
    },
}
