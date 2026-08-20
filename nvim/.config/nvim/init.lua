vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true

local ok, matugen = pcall(require, 'matugen')
if ok then
    pcall(matugen.setup)
end
