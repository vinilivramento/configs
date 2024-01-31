require("nvim-tree").setup({
     git = {
        enable = true,
    },
    renderer = {
        highlight_git = true,
        icons = {
        show = {
            git = true,
            },
        },
    },
})

vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { silent = true })
