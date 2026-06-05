return {
    {
        "mason-org/mason.nvim",
        opts = {},
    },

    {
        "mason-org/mason-lspconfig.nvim",
        opts = {
            automatic_enable = true,
        },
    },

    {
        "neovim/nvim-lspconfig",
        config = function ()
            vim.diagnostic.config({
                virtual_text = true,
                underline = true,
                signs = true,
                update_in_insert = false,
            })

            vim.api.nvim_create_autocmd("LspAttach", {
                callback = function(event)
                    local buf = event.buf

                    local map = function(lhs, rhs, desc)
                        vim.keymap.set("n", lhs, rhs, {
                            buffer = buf,
                            desc = desc,
                        })
                    end

                    map("gd", vim.lsp.buf.definition, "Go to definition")
                    map("gr", vim.lsp.buf.references, "References")
                    map("gi", vim.lsp.buf.implementation, "Implementation")
                    map("K", vim.lsp.buf.hover, "Hover")

                    map("<leader>rn", vim.lsp.buf.rename, "Rename")
                    map("<leader>ca", vim.lsp.buf.code_action, "Code action")
                    map("<leader>f", function()
                        vim.lsp.buf.format()
                    end, "Format")
                end,
            })
        end
    },
}
