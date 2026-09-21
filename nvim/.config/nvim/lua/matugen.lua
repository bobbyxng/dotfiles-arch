 local M = {}

function M.setup()
  require('base16-colorscheme').setup({
    base00 = '#eae8e1',
    base01 = '#e1dfd6',
    base02 = '#dedbcf',
    base03 = '#888674',
    base04 = '#595751',
    base05 = '#1b1a18',
    base06 = '#1b1a18',
    base07 = '#1b1a18',
    base08 = '#fd4663',
    base09 = '#417d36',
    base0A = '#759438',
    base0B = '#a9973c',
    base0C = '#386b2e',
    base0D = '#716528',
    base0E = '#586f2a',
    base0F = '#759438',
  })

  local hi = function(group, opts)
    vim.api.nvim_set_hl(0, group, opts)
  end

  -- telescope.nvim
  hi('TelescopeNormal',         { fg = '#1b1a18',          bg = '#eae8e1' })
  hi('TelescopeBorder',         { fg = '#888674',             bg = '#eae8e1' })
  hi('TelescopePromptNormal',   { fg = '#1b1a18',          bg = '#eae8e1' })
  hi('TelescopePromptBorder',   { fg = '#888674',             bg = '#eae8e1' })
  hi('TelescopePromptPrefix',   { fg = '#a9973c',             bg = '#eae8e1' })
  hi('TelescopePromptCounter',  { fg = '#595751',  bg = '#eae8e1' })
  hi('TelescopePromptTitle',    { fg = '#eae8e1',             bg = '#a9973c' })
  hi('TelescopePreviewTitle',   { fg = '#eae8e1',             bg = '#759438' })
  hi('TelescopeResultsTitle',   { fg = '#eae8e1',             bg = '#417d36' })
  hi('TelescopeSelection',      { fg = '#1b1a18',          bg = '#dedbcf' })
  hi('TelescopeSelectionCaret', { fg = '#a9973c',             bg = '#dedbcf' })
  hi('TelescopeMatching',       { fg = '#a9973c',             bold = true })

  -- mini.pick
  hi('MiniPickNormal',         { fg = '#1b1a18',          bg = '#eae8e1' })
  hi('MiniPickBorder',         { fg = '#888674',             bg = '#eae8e1' })
  hi('MiniPickPrompt',   { fg = '#1b1a18',          bg = '#eae8e1' })
  hi('MiniPickPromptPrefix',   { fg = '#a9973c',             bg = '#eae8e1' })
  hi('MiniPickBorderText',    { fg = '#eae8e1',             bg = '#a9973c' })
  hi('MiniPickMatchCurrent',      { fg = '#1b1a18',          bg = '#dedbcf' })
  hi('MiniPickPromptCaret', { fg = '#a9973c',             bg = '#dedbcf' })
  hi('MiniPickMatchRanges',       { fg = '#a9973c',             bold = true })
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
