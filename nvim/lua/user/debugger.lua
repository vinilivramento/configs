--Config termdebug
-- vim.g.termdebug_wide = 1
-- vim.cmd [[packadd termdebug]]

-- --Config dap
-- require("dapui").setup()

-- local dap, dapui = require("dap"), require("dapui")

-- dap.listeners.after.event_initialized["dapui_config"] = function()
--   dapui.open()
-- end
-- dap.listeners.before.event_terminated["dapui_config"] = function()
--   dapui.close()
-- end
-- dap.listeners.before.event_exited["dapui_config"] = function()
--   dapui.close()
-- end

-- vim.fn.sign_define('DapBreakpoint', 
--     {
--         text='🔴', -- nerdfonts icon here
--         texthl='DapBreakpointSymbol', 
--         linehl='DapBreakpoint', 
--         numhl='DapBreakpoint'
--     })
-- vim.fn.sign_define('DapStopped', 
--     {
--         text ='▶️', 
--         texthl='DapStoppedSymbol', 
--         linehl='DapBreakpoint', 
--         numhl='DapBreakpoint'
--     })
