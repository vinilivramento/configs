require("mason").setup()
require("mason-lspconfig").setup {
    automatic_enable = false
}

-- To better investigate lsg issues 
-- vim.lsp.set_log_level("debug")

vim.lsp.inlay_hint.enable(true)

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

require('lspconfig')

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

--- Ansible 

-- lspconfig.ansiblels.setup({})
vim.lsp.config("ansiblels", {})
vim.lsp.enable({"ansiblels"})

--- Bash

vim.lsp.config("bashls", {})
vim.lsp.enable({"bashls"})

--- C/C++

vim.lsp.config("clangd", {
    cmd = { 'clangd' },
    filetypes = { "c", "cpp", "cc", "mpp", "ixx", "objc", "objcpp", "cuda" },
    single_file_support = true,
    capabilities = require("cmp_nvim_lsp").default_capabilities(),
    on_attach = function(client, bufnr)
      -- navic.attach(client, bufnr)
      -- require("clangd_extensions.inlay_hints").setup_autocmd()
      -- require("clangd_extensions.inlay_hints").set_inlay_hints()
    end,
})
vim.lsp.enable({"clangd"})

--- Cmake

vim.lsp.config("cmake", {
    cmd = { 'cmake-language-server' },
    buildDirectory = { 'build' },
    filetypes = { 'cmake' },
})
vim.lsp.enable({"cmake"})

--- Rust

-- Vini: Currently disabled to use rustaceanvim
-- vim.lsp.config("rust-tools", {
--   server = {
--     on_attach = function(_, bufnr)
--       -- Hover actions
--       -- vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
--       -- Code action groups
--       -- vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
--     end,
--   },
-- })
-- vim.lsp.enable({"rust-tools"})

vim.g.rustaceanvim = {
  -- Plugin configuration
  tools = {
  },
  -- LSP configuration
  server = {
    on_attach = function(client, bufnr)
      -- you can also put keymaps in here
    end,
    default_settings = {
      -- rust-analyzer language server configuration
      ['rust-analyzer'] = {
          linkedProjects = {
            vim.fn.getcwd() .. '/Cargo.toml', -- Avoid running rust-analyzer for entire workspace
          },
          workspace = {
            -- workspaceFolders = {vim.loop.cwd() },
            -- autoReload = false,
          },
          inlayHints= {
              enable = true,
          },
          cargo = {
            -- loadOutDirsFromCheck = true,  -- Adjust as needed
            allFeatures = false,          -- Disable all features if not needed
            autoreload = true,            -- re-run if Cargo.toml has been updated
          },
          procMacro = {
            enable =  true,                -- Enable procedural macros if needed
          },
          diagnostics = {
            enable = true,                -- Adjust diagnostics settings
            enableExperimental = false,   -- Disable experimental features
            disabled = {"unresolved-proc-macro"}  -- Disable warnings related to macros
          },
          check = {
            command = "clippy",           -- Use `clippy` for additional linting
          },
      },
    },
  },
  -- DAP configuration
  dap = {
  },
}

-- Temporary fix for error on rust-analyzer "server cancelled request": https://github.com/neovim/neovim/issues/30985
for _, method in ipairs({ 'textDocument/diagnostic', 'workspace/diagnostic' }) do
    local default_diagnostic_handler = vim.lsp.handlers[method]
    vim.lsp.handlers[method] = function(err, result, context, config)
        if err ~= nil and err.code == -32802 then
            return
        end
        return default_diagnostic_handler(err, result, context, config)
    end
end

--- Python

vim.lsp.config("pyright", {})
vim.lsp.enable({"pyright"})

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
vim.diagnostic.config({
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = " ",
      [vim.diagnostic.severity.WARN]  = " ",
      [vim.diagnostic.severity.INFO]  = " ",
      [vim.diagnostic.severity.HINT]  = "",
    },
  },
})
