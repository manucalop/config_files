lvim.builtin.telescope.defaults.file_ignore_patterns = {
  "node_modules",
  ".venv",
  ".git",
  "__pycache__",
}
lvim.builtin.project.active = true
lvim.builtin.project.manual_mode = true

lvim.builtin.telescope.on_config_done = function(telescope)
  pcall(telescope.load_extension, "frecency")
  pcall(telescope.load_extension, "neoclip")
  pcall(telescope.load_extension, "project")
  pcall(telescope.load_extension, "file_browser")
end
