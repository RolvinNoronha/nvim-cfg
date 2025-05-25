require("core.keymaps")
require("core.options")

-- [[ Install `lazy.nvim` plugin manager ]]
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
    if vim.v.shell_error ~= 0 then
        error("Error cloning lazy.nvim:\n" .. out)
    end
end

---@type vim.Option
local rtp = vim.opt.rtp
rtp:prepend(lazypath)

-- NOTE: Here is where you install your plugins.
require("lazy").setup({
    require("plugins.alpha"),
    require("plugins.autocompletion"),
    require("plugins.autoformatting"),
    require("plugins.bufferline"),
    require("plugins.colortheme"),
    require("plugins.gitsigns"),
    require("plugins.indentblankline"),
    require("plugins.lsp"),
    require("plugins.lualine"),
    require("plugins.misc"),
    require("plugins.neotree"),
    require("plugins.telescope"),
    require("plugins.treesitter"),
})

