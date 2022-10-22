require 'nvim-tmux-navigation'.setup {
    disable_when_zoomed = true, -- defaults to false
    keybindings = {
        left = "<C-w>h",
        down = "<C-w>j",
        up = "<C-w>k",
        right = "<C-w>l",
        -- last_active = "<C-\\>",
        -- next = "<C-Space>",
    }
}
