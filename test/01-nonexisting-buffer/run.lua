local workspace = vim.loop.cwd() .. '/workspace/'
local util = require('vim.lsp.util')

local newFile = workspace .. 'new.php'
local oldFile = workspace .. 'old.php'

local bufNr = vim.fn.bufadd(workspace .. 'test.php')
vim.fn.bufload(bufNr)

os.rename(newFile, oldFile)
local timer = vim.loop.new_timer()
timer:start(1000, 0, vim.schedule_wrap(function()
  util.rename(oldFile, newFile)
end))

-- local function rename(params)
--   local oldFile = params.fargs[1]
--   local newFile = params.fargs[2]

--   util.rename(oldFile, newFile)
-- end

-- vim.api.nvim_add_user_command('Rename', rename, {complete = 'file', nargs = '+'})
