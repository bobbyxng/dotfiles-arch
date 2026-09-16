vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true

local ok, matugen = pcall(require, 'matugen')
if ok then
    pcall(matugen.setup)
end

-- Copy in visual mode with Ctrl+C
vim.keymap.set("v", "<C-c>", '"+y', { desc = "Copy to system clipboard" })

-- Paste in insert mode with Ctrl+V
vim.keymap.set("i", "<C-v>", '<C-r>+', { desc = "Paste from system clipboard" })

-- Paste in normal mode with Ctrl+V
vim.keymap.set("n", "<C-v>", '"+p', { desc = "Paste from system clipboard" })

-- Paste in command-line mode (e.g. in : or / prompts)
vim.keymap.set("c", "<C-v>", "<C-r>+", { desc = "Paste from system clipboard" })
