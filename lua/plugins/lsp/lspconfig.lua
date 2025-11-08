return {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        -- Permet d'utiliser les résultats du LSP dans la complétion automatique
        "hrsh7th/cmp-nvim-lsp",
        -- Ajoute les "code actions" de type renommage de fichiers intelligent, etc
        { "antosha417/nvim-lsp-file-operations", config = true },
        -- Utile pour éditer les fichiers lua spécifique à la configuration neovim
        -- Permet notamment d'éviter le "Undefined global `vim`"
        { "folke/lazydev.nvim", opts = {} },
    },
    keys = {
        { "<leader>ca", vim.lsp.buf.code_action, desc = "Code Action", mode = { "n", "v" } },
        { "gR", "<Cmd>Telescope lsp_references<CR>", desc = "Show LSP references", mode = "n" },
        { "gD", vim.lsp.buf.declaration, desc = "Go to declaration", mode = "n" },
        { "gd", "<Cmd>Telescope lsp_definitions<CR>", desc = "Show LSP definitions", mode = "n" },
        { "gi", "<Cmd>Telescope lsp_implementations<CR>", desc = "Show LSP implementations", mode = "n" },
        { "gt", "<Cmd>Telescope lsp_type_definitions<CR>", desc = "Show LSP type definitions", mode = "n" },
        { "gs", vim.lsp.buf.signature_help, desc = "Show LSP signature help", mode = "n" },
        { "<C-s>", vim.lsp.buf.signature_help, desc = "Show LSP signature help", mode = { "n", "i" } },
        { "<leader>rn", vim.lsp.buf.rename, desc = "Smart rename", mode = "n" },
        { "<leader>D", "<Cmd>Telescope diagnostics bufnr=0<CR>", desc = "Show buffer diagnostics", mode = "n" },
        { "<leader>d", vim.diagnostic.open_float, desc = "Show line diagnostics", mode = "n" },
        { "K", vim.lsp.buf.hover, desc = "Show documentation for symbol under cursor", mode = "n" },
        { "<leader>F", vim.lsp.buf.format, desc = "Format buffer", mode = { "n", "x" } },
        { "<leader>rs", ":LspRestart<CR>", desc = "Restart LSP", mode = "n" },
    },
    config = function()
        -- Customize error signs
        vim.diagnostic.config({
            signs = {
                text = {
                    [vim.diagnostic.severity.ERROR] = "",
                    [vim.diagnostic.severity.WARN] = "",
                    [vim.diagnostic.severity.INFO] = "",
                    [vim.diagnostic.severity.HINT] = "󰌵",
                }
            }
        });

        local util = require("lspconfig.util")

        local function detect_root_dir(fname)
            return util.root_pattern(
                '*.ino',
                '.clangd',
                '.clang-tidy',
                '.clang-format',
                'compile_commands.json',
                'compile_flags.txt',
                '.git'
            )(fname);
        end

        local function has_ino_file(root)
            local handle = vim.uv.fs_scandir(root)
            if not handle then return false end

            while true do
                local name, type = vim.uv.fs_scandir_next(handle)
                if not name then break end
                if type == "file" and name:match("%.ino$") then
                    return true
                end
            end
            return false
        end

        vim.lsp.config("basedpyright", {
            settings = {
                basedpyright = {
                    analysis = {
                        typeCheckingMode = "standard"
                    }
                }
            }
        });

        vim.lsp.config("clangd", {
            root_dir = function(bufnr, on_dir)
                local fname = vim.api.nvim_buf_get_name(bufnr)
                local root_dir = detect_root_dir(fname)
                if not has_ino_file(root_dir) then
                    vim.api.nvim_echo({ { "Using clangd LSP", "ModeMsg" } }, false, {})
                    on_dir(root_dir)
                end
            end
        });

        vim.lsp.config("arduino_language_server", {
            capabilities = {
                textDocument = {
                  semanticTokens = vim.NIL,
                },
                workspace = {
                  semanticTokens = vim.NIL,
                },
            },
            cmd = {
                "arduino-language-server",
                "-cli", "arduino-cli",
                "-cli-config", vim.fn.expand("~/.arduino15/arduino-cli.yaml"),
                "-fqbn", "esp32:esp32:esp32",
                "-clangd", "clangd"
            },
            filetypes = { "arduino", "c", "cpp" },
            root_dir = function(bufnr, on_dir)
                local fname = vim.api.nvim_buf_get_name(bufnr)
                local root_dir = detect_root_dir(fname)
                if has_ino_file(root_dir) then
                    vim.api.nvim_echo({ { "Using arduino LSP", "ModeMsg" } }, false, {})
                    on_dir(root_dir)
                end
            end,
        });

        vim.lsp.inlay_hint.enable();
    end
}
