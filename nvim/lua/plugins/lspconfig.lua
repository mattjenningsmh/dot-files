return {
    -- LSP configuration plugin
    {
        "neovim/nvim-lspconfig",
        event = { "BufReadPre", "BufNewFile" }, -- Load LSP only when needed
        dependencies = {
            "williamboman/mason.nvim",         -- LSP server manager
            "williamboman/mason-lspconfig.nvim", -- Mason + LSPConfig bridge
        },
        config = function()
            require("mason").setup() -- Setup Mason
            require("mason-lspconfig").setup() -- Bridge between Mason and LSPConfig

            -- Add LSP server configurations
            local lspconfig = require("lspconfig")

            -- Define a global `on_attach` function for keybindings
            local on_attach = function(client, bufnr)
                -- Keybinding options
                local opts = { buffer = bufnr, silent = true }

                -- General LSP keybindings
                vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)         -- Go to definition
                vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)        -- Go to declaration
                vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)         -- Show references
                vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)     -- Go to implementation
                vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, opts)    -- Go to type definition
                vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)               -- Show hover documentation
                vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)     -- Rename symbol
                vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts) -- Code actions
                vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts) -- Show diagnostics
                vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)       -- Go to previous diagnostic
                vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)       -- Go to next diagnostic
                vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, opts) -- Diagnostics to loclist
                vim.keymap.set("n", "<leader>f", function()
                    vim.lsp.buf.format({ async = true })                        -- Format buffer
                end, opts)
            end

            -- Add LSP server setups
            local capabilities = require("cmp_nvim_lsp").default_capabilities()

            -- Example: Lua (sumneko_lua)
            lspconfig.lua_ls.setup({
                on_attach = on_attach, -- Attach keybindings
                capabilities = capabilities,
                settings = {
                    Lua = {
                        diagnostics = { globals = { "vim" } },
                        workspace = { checkThirdParty = false },
                    },
                },
            })

            -- Example: Python (pyright)
            lspconfig.pyright.setup({
                on_attach = on_attach, -- Attach keybindings
                capabilities = capabilities,
            })
            -- Java (jdtls)
            require("lspconfig").jdtls.setup({
                on_attach = on_attach,
                capabilities = capabilities,
                root_dir = function(fname)
                    return vim.loop.cwd()
                end,
            })

            -- C and C++ (clangd)
            require("lspconfig").clangd.setup({
                on_attach = on_attach,
                capabilities = capabilities,
            })

            -- cmake 
            require("lspconfig").cmake.setup({
                on_attach = on_attach, 
                capabilities = capabilities, 
                root_dir = function(fname)
                    return lspconfig.util.root_pattern("CMakeLists.txt", "build")(fname)
                        or lspconfig.util.find_git_ancestor(fname)
                        or vim.loop.os_homedir()
                end,
                init_options = {
                    buildDirectory = "build", -- Adjust this if your build directory is different
                },
            })


            -- TypeScript and JavaScript (tsserver)
            require("lspconfig").ts_ls.setup({
                on_attach = on_attach,
                capabilities = capabilities,
            })

            -- Python (pyright)
            require("lspconfig").pyright.setup({
                on_attach = on_attach,
                capabilities = capabilities,
            })

            -- HTML (html)
            require("lspconfig").html.setup({
                on_attach = on_attach,
                capabilities = capabilities,
            })

            -- CSS (cssls)
            require("lspconfig").cssls.setup({
                on_attach = on_attach,
                capabilities = capabilities,
            })

            --go (gopls)
            require("lspconfig").gopls.setup({
                on_attach=on_attach,
                capabilities = capabilities,
            })

        end,
    },
}

