require("mason").setup()
require("mason-lspconfig").setup()

--- LspSaga

require("lspsaga").setup({
    symbol_in_winbar = {
      enable = false,
      separator = " ",
      hide_keyword = true,
      show_file = true,
      folder_level = 2,
    },
    lightbulb= {enable = false, enable_in_insert = false}, 
})

---

--- LspConfig

local lspconfig = require('lspconfig')

vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local opts = { buffer = ev.buf }
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', '<leader>f', function()
      vim.lsp.buf.format { async = true }
    end, opts)
  end,
})

--- Bash

lspconfig.bashls.setup({})

--- C/C++

lspconfig.clangd.setup({
    cmd = { 'clangd' },
    filetypes = { "c", "cpp", "cc", "mpp", "ixx", "objc", "objcpp", "cuda" },
    single_file_support = true,
    capabilities = require("cmp_nvim_lsp").default_capabilities(),
    on_attach = function(client, bufnr)
      navic.attach(client, bufnr)
      require("clangd_extensions.inlay_hints").setup_autocmd()
      require("clangd_extensions.inlay_hints").set_inlay_hints()
    end,
})

--- Rust
--
vim.g.rustaceanvim = function()
    local mason_registry = require("mason-registry")

    local codelldb_root = mason_registry.get_package("codelldb"):get_install_path() .. "/extension/"
    local codelldb_path = codelldb_root .. "adapter/codelldb"
    local liblldb_path = codelldb_root .. "lldb/lib/liblldb.so"

    local cfg = require("rustaceanvim.config")

    return {
          dap = {
            adapter = cfg.get_codelldb_adapter(codelldb_path, liblldb_path),
          },
          inlay_hints = {
            highlight = "NonText",
          },
          tools = {
            hover_actions = {
              auto_focus = true,
            },
          },
          server = {
            on_attach = function(client, bufnr)
              require("lsp-inlayhints").on_attach(client, bufnr)
            end,
          },
    }
end

--- Python

lspconfig.pyright.setup({})

--- 

--- Nvim Cmp config

local cmp = require("cmp")
cmp.setup({ 
    mapping = {
        -- Shift+TAB to go to the Previous Suggested item
        ['<S-Tab>'] = cmp.mapping.select_prev_item(),
        ['<C-n>'] = cmp.mapping.select_prev_item(),
        -- Tab to go to the next suggestion
        ['<Tab>'] = cmp.mapping.select_next_item(),
        ['<C-p>'] = cmp.mapping.select_next_item(),
        -- CTRL+SHIFT+f to scroll backwards in description
        ['<C-S-f>'] = cmp.mapping.scroll_docs(-4),
        -- CTRL+F to scroll forwards in the description
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        -- CTRL+SPACE to bring up completion at current Cursor location
        ['<C-Space>'] = cmp.mapping.complete(),
        -- CTRL+e to exit suggestion and close it
        ['<C-e>'] = cmp.mapping.close(),
        -- CR (enter or return) to CONFIRM the currently selection suggestion
        -- We set the ConfirmBehavior to insert the Selected suggestion
        ['<CR>'] = cmp.mapping.confirm({
          behavior = cmp.ConfirmBehavior.Insert,
          select = true,
        })
    },
    sorting = {
        comparators = {
            require("clangd_extensions.cmp_scores"),
            cmp.config.compare.offset,
            cmp.config.compare.exact,
            cmp.config.compare.score,
            cmp.config.compare.recently_used,
            cmp.config.compare.locality,
            cmp.config.compare.kind,
            cmp.config.compare.sort_text,
            cmp.config.compare.length,
            cmp.config.compare.order,
      },
    }, 
    sources = {
        { name = 'path' },                         -- file paths
        { name = 'nvim_lsp', keyword_length = 3 }, -- from language server
        { name = 'nvim_lsp_signature_help'},       -- function signature with parameters
        { name = 'nvim_lua', keyword_length = 2},  -- neovim lua runtime API
        { name = 'buffer', keyword_length = 2 },   -- current buffer
        { name = 'vsnip', keyword_length = 2 },    -- from vim-vsnip 
        { name = 'calc' }                          -- source for match calculation
    },
    snippet = {
        expand = function(args)
            vim.fn["vsnip#anonymous"](args.body)
        end,
    },
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },
    formatting = {
        fields = {'menu', 'abbr', 'kind'},
        format = function(entry, item)
            local menu_icon ={
                nvim_lsp = 'λ',
                vsnip = '⋗',
                buffer = 'Ω',
                path = '🖫',
            }
            item.menu = menu_icon[entry.source.name]
            return item
        end,
  },
})

---

-- Format on save
vim.cmd [[autocmd BufWritePre <buffer> lua vim.lsp.buf.format()]]

-- diagnostics signs
vim.fn.sign_define("DiagnosticSignError", { text = " ", texthl = "DiagnosticSignError" })
vim.fn.sign_define("DiagnosticSignWarn",  { text = " ", texthl = "DiagnosticSignWarn" })
vim.fn.sign_define("DiagnosticSignInfo",  { text = " ", texthl = "DiagnosticSignInfo" })
vim.fn.sign_define("DiagnosticSignHint",  { text = "", texthl = "DiagnosticSignHint" })
