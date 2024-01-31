require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'monokaipro'
    -- theme = 'nightfly',
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
