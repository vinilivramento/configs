local teleconfig = require('telescope')

teleconfig.setup {
    defaults = {
        file_ignore_patterns = {
            ".git/",
            "build/",
            "target/",
            ".clangd/",
            ".venv/",
            ".mypy/",
            ".mypy_cache/",
            ".ruff_cache/",
            "__pycache__/",
            ".pytest_cache/",
            "_deps",
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
