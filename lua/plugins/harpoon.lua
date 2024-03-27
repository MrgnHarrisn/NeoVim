return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    lazy = false,
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        local harpoon = require("harpoon")
        harpoon:setup()
        
        -- adding to harpoon list
        vim.keymap.set('n', '<leader>a', function() harpoon:list():append() end)
        vim.keymap.set('n', '<C-e>', function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)
        
        -- Select one of 4 quick picks
        vim.keymap.set('n', '<C-u>', function() harpoon:list():select(1) end)
        vim.keymap.set('n', '<C-i>', function() harpoon:list():select(2) end)
        vim.keymap.set('n', '<C-o>', function() harpoon:list():select(3) end)
        vim.keymap.set('n', '<C-p>', function() harpoon:list():select(4) end)

        -- generic next and previous


    end
}
