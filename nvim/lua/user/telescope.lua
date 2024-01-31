local teleconfig = require('telescope')

teleconfig.setup {
    defaults = {
        file_ignore_patterns = {
            ".git/",
            "build/",
            "target/",
            ".clangd/",
            "LICENSE*"
        },
    },
    extensions = {
        media_files = {
            filetypes = { "png", "webp", "jpg", "jpeg", "ppm", "pdf" },
            find_cmd = "rg", -- find command (defaults to `fd`)
        },
    },
}
-- load extension to support preview of media files
teleconfig.load_extension('media_files');

-- search files, even hidden ones
vim.keymap.set('n', '<leader>ff', ':lua require"telescope.builtin".find_files({no_ignore=true, hidden=true})<CR>', {})
vim.keymap.set('n', '<C-p>', ':lua require"telescope.builtin".find_files({no_ignore=true, hidden=true})<CR>', {})

-- ripgrep files, respects gitignore
vim.keymap.set('n', '<leader>fg', ':lua require"telescope.builtin".live_grep()<CR>', {})

-- search word under cursor
vim.keymap.set('n', '<leader>gg', ':lua require"telescope.builtin".grep_string({search = vim.fn.expand("<cword>")})<CR>', {})
