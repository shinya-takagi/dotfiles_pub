-- Keymap for plugins

-- local keymap = vim.api.nvim_set_keymap
-- local opts = { noremap = true, silent = true }
--
-- -- Keymap for telescope
-- local status, builtin = pcall(require, "telescope.builtin")
-- if (status) then
--   vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
--   vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
--   vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
--   vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
--   -- Telescope extension
--   keymap('n', '<leader>fr', ':Telescope frecency<CR>', opts)
-- end
--
-- -- NvimTree
-- status = pcall(require, "nvim-tree")
-- -- vim.ketmap.set('n', '<leader>nt, )
-- if (status) then
--   keymap('n', '<leader>nt', ':NvimTreeToggle<CR>', opts)
-- end