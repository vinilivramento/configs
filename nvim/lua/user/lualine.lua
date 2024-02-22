require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'auto', -- can also be 'dracula-nvim' or 'nightfly' for example
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
  },
  sections = {
    lualine_a = {
      {
        'filename',
        path = 1, --relative path
      }
    }
  }
}
