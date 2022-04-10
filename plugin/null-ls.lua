local null = require('null-ls')

null.setup({
-- debug = true,
diagnostics_format = "#{s}: #{m} [#{c}]",
sources = {
  null.builtins.diagnostics.php,
  }
})
