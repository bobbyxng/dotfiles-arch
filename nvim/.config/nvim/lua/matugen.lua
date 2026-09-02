 local M = {}

function M.setup()
  require('base16-colorscheme').setup({
    base00 = '#eae1e2',
    base01 = '#e1d6d7',
    base02 = '#decfd0',
    base03 = '#917d7f',
    base04 = '#574e4f',
    base05 = '#1b1819',
    base06 = '#1b1819',
    base07 = '#1b1819',
    base08 = '#d51624',
    base09 = '#7d7836',
    base0A = '#945f38',
    base0B = '#b2343d',
    base0C = '#6b672e',
    base0D = '#71282d',
    base0E = '#6f472a',
    base0F = '#945f38',
  })

  local hi = function(group, opts)
    vim.api.nvim_set_hl(0, group, opts)
  end

  hi('TelescopeNormal',         { fg = '#1b1819',          bg = '#eae1e2' })
  hi('TelescopeBorder',         { fg = '#917d7f',             bg = '#eae1e2' })
  hi('TelescopePromptNormal',   { fg = '#1b1819',          bg = '#eae1e2' })
  hi('TelescopePromptBorder',   { fg = '#917d7f',             bg = '#eae1e2' })
  hi('TelescopePromptPrefix',   { fg = '#b2343d',             bg = '#eae1e2' })
  hi('TelescopePromptCounter',  { fg = '#574e4f',  bg = '#eae1e2' })
  hi('TelescopePromptTitle',    { fg = '#eae1e2',             bg = '#b2343d' })
  hi('TelescopePreviewTitle',   { fg = '#eae1e2',             bg = '#945f38' })
  hi('TelescopeResultsTitle',   { fg = '#eae1e2',             bg = '#7d7836' })
  hi('TelescopeSelection',      { fg = '#1b1819',          bg = '#decfd0' })
  hi('TelescopeSelectionCaret', { fg = '#b2343d',             bg = '#decfd0' })
  hi('TelescopeMatching',       { fg = '#b2343d',             bold = true })
end

-- Register a signal handler for SIGUSR1 (matugen updates).
-- The handler re-requires this module, which re-runs the code below, so the
-- previous handle is stopped first; otherwise handlers double on every signal.
if _G.__matugen_signal then
  _G.__matugen_signal:stop()
  _G.__matugen_signal:close()
end

local signal = vim.uv.new_signal()
_G.__matugen_signal = signal
signal:start(
  'sigusr1',
  vim.schedule_wrap(function()
    package.loaded['matugen'] = nil
    require('matugen').setup()
  end)
)

return M
