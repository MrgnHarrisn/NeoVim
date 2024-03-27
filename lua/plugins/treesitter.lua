
return {
    "nvim-treesitter/nvim-treesitter",
    built = ":TSUpdate",
    config = function()
        local config = require("nvim-treesitter.configs")
        config.setup({
            auto_install = true,
            -- ensure_installed = {"lua", "rust", "cpp", "c", "zig"},
            highlight = { enable = true },
            indent = { enable = true }
        })
    end
}
