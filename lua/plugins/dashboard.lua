local theme = require('alpha.themes.startify')
local version = vim.version().major .. '.' .. vim.version().minor .. '.' .. vim.version().patch
theme.section.header.val = {
  [[ Neovim Version: ]]  .. version .. [[ (run :version for more details)]],
}
require('alpha').setup(theme.opts)
