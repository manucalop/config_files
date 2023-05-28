-- Append github/copilot.vim to lvim.plugins
-- lvim.plugins.insert(1, { "github/copilot.vim" })

vim.g.copilot_no_tab_map = true
vim.g.copilot_assume_mapped = true
vim.g.copilot_tab_fallback = ""
vim.g.copilot_filetypes = { markdown = true }
-- vim.g.copilot_node_command = "~/.asdf/installs/nodejs/17.9.1/bin/node"
-- vim.g.copilot_enabled = false

lvim.builtin.cmp.mapping["<Tab>"] = function(fallback)
  local copilot_keys = vim.fn["copilot#Accept"]()
  if copilot_keys ~= "" then
    vim.api.nvim_feedkeys(copilot_keys, "i", true)
  else
    fallback()
  end
end
