 local M = {}

function M.setup()
  require('base16-colorscheme').setup({
    base00 = '#e1e4ea',
    base01 = '#d6d9e1',
    base02 = '#cfd3de',
    base03 = '#7c8290',
    base04 = '#4e5157',
    base05 = '#18191b',
    base06 = '#18191b',
    base07 = '#18191b',
    base08 = '#fd4663',
    base09 = '#382640',
    base0A = '#2f2a47',
    base0B = '#2d3853',
    base0C = '#543960',
    base0D = '#364363',
    base0E = '#3f3960',
    base0F = '#fab7c2',
  })

  local hi = function(group, opts)
    vim.api.nvim_set_hl(0, group, opts)
  end

  hi('TelescopeNormal',         { fg = '#18191b',          bg = '#e1e4ea' })
  hi('TelescopeBorder',         { fg = '#7c8290',             bg = '#e1e4ea' })
  hi('TelescopePromptNormal',   { fg = '#18191b',          bg = '#e1e4ea' })
  hi('TelescopePromptBorder',   { fg = '#7c8290',             bg = '#e1e4ea' })
  hi('TelescopePromptPrefix',   { fg = '#2d3853',             bg = '#e1e4ea' })
  hi('TelescopePromptCounter',  { fg = '#4e5157',  bg = '#e1e4ea' })
  hi('TelescopePromptTitle',    { fg = '#e1e4ea',             bg = '#2d3853' })
  hi('TelescopePreviewTitle',   { fg = '#e1e4ea',             bg = '#2f2a47' })
  hi('TelescopeResultsTitle',   { fg = '#e1e4ea',             bg = '#382640' })
  hi('TelescopeSelection',      { fg = '#18191b',          bg = '#cfd3de' })
  hi('TelescopeSelectionCaret', { fg = '#2d3853',             bg = '#cfd3de' })
  hi('TelescopeMatching',       { fg = '#2d3853',             bold = true })
end

 -- Register a signal handler for SIGUSR1 (matugen updates)
 local signal = vim.uv.new_signal()
 signal:start(
   'sigusr1',
   vim.schedule_wrap(function()
     package.loaded['matugen'] = nil
     require('matugen').setup()
   end)
 )

 return M
