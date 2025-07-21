return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
        preset = "classic",
        icons = {
            keys = {
                Up = " ",
                Down = " ",
                Left = " ",
                Right = " ",
                C = "󰘴 ",
                M = "󰘵 ",
                D = "󰘳 ",
                S = "󰘶 ",
                CR = "󰌑 ",
                Esc = "ESC",
                ScrollWheelDown = "󱕐 ",
                ScrollWheelUp = "󱕑 ",
                NL = "󰌑 ",
                BS = "󰁮",
                Space = "󱁐 ",
                Tab = "󰌒 ",
                F1 = "F1",
                F2 = "F2",
                F3 = "F3",
                F4 = "F4",
                F5 = "F5",
                F6 = "F6",
                F7 = "F7",
                F8 = "F8",
                F9 = "F9",
                F10 = "F10",
                F11 = "F11",
                F12 = "F12",
            }
        }
    },
    keys = {
        {
            "<leader>?",
            function ()
                require("which-key").show({ global = false });
            end,
            desc = "Buffer local keymaps (which-key)"
        }
    }
}
