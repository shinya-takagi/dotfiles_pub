-- Setup trouble.nvim
--
local status_ok, trouble = pcall(require, "trouble")
if (not status_ok) then return end

trouble.setup {
  -- here is your configuration.
}
-- Show trouble on Shift+t.
vim.api.nvim_set_keymap('n', '<S-t>', '<cmd>TroubleToggle<CR>', { noremap = true })
