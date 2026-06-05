return {
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

                    local client = vim.lsp.get_client_by_id(event.data.client_id)
                    if not client then return end
                    if client.server_capabilities.inlayHintProvider then
                        vim.lsp.inlay_hint.enable(true, { bufnr = buf })
                    end

                    local map = function(lhs, rhs, desc)
                        vim.keymap.set("n", lhs, rhs, {
                            buffer = buf,
                            desc = desc,
                        })
                    end

                    map("K", vim.lsp.buf.hover, "Hover")

                    map("<leader>rn", vim.lsp.buf.rename, "Rename")
                    map("<leader>ca", vim.lsp.buf.code_action, "Code action")
                end,
            })
            

            vim.api.nvim_create_user_command("Format", function()
                vim.lsp.buf.format()
            end, {})
        end
    },
}
