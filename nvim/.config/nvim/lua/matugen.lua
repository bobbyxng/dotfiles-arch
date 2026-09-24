 local M = {}

function M.setup()
  require('base16-colorscheme').setup({
    base00 = '#e1e5ea',
    base01 = '#d6dbe1',
    base02 = '#cfd5de',
    base03 = '#7b838f',
    base04 = '#4f5257',
    base05 = '#18191b',
    base06 = '#18191b',
    base07 = '#18191b',
    base08 = '#fd4663',
    base09 = '#37204a',
    base0A = '#221f51',
    base0B = '#1d3c63',
    base0C = '#4f2e6b',
    base0D = '#284871',
    base0E = '#2e2a6f',
    base0F = '#3e3894',
  })

  local hi = function(group, opts)
    vim.api.nvim_set_hl(0, group, opts)
  end

  -- telescope.nvim
  hi('TelescopeNormal',         { fg = '#18191b',          bg = '#e1e5ea' })
  hi('TelescopeBorder',         { fg = '#7b838f',             bg = '#e1e5ea' })
  hi('TelescopePromptNormal',   { fg = '#18191b',          bg = '#e1e5ea' })
  hi('TelescopePromptBorder',   { fg = '#7b838f',             bg = '#e1e5ea' })
  hi('TelescopePromptPrefix',   { fg = '#1d3c63',             bg = '#e1e5ea' })
  hi('TelescopePromptCounter',  { fg = '#4f5257',  bg = '#e1e5ea' })
  hi('TelescopePromptTitle',    { fg = '#e1e5ea',             bg = '#1d3c63' })
  hi('TelescopePreviewTitle',   { fg = '#e1e5ea',             bg = '#221f51' })
  hi('TelescopeResultsTitle',   { fg = '#e1e5ea',             bg = '#37204a' })
  hi('TelescopeSelection',      { fg = '#18191b',          bg = '#cfd5de' })
  hi('TelescopeSelectionCaret', { fg = '#1d3c63',             bg = '#cfd5de' })
  hi('TelescopeMatching',       { fg = '#1d3c63',             bold = true })

  -- mini.pick
  hi('MiniPickNormal',         { fg = '#18191b',          bg = '#e1e5ea' })
  hi('MiniPickBorder',         { fg = '#7b838f',             bg = '#e1e5ea' })
  hi('MiniPickPrompt',   { fg = '#18191b',          bg = '#e1e5ea' })
  hi('MiniPickPromptPrefix',   { fg = '#1d3c63',             bg = '#e1e5ea' })
  hi('MiniPickBorderText',    { fg = '#e1e5ea',             bg = '#1d3c63' })
  hi('MiniPickMatchCurrent',      { fg = '#18191b',          bg = '#cfd5de' })
  hi('MiniPickPromptCaret', { fg = '#1d3c63',             bg = '#cfd5de' })
  hi('MiniPickMatchRanges',       { fg = '#1d3c63',             bold = true })
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
