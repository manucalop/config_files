-- require('telescope').load_extension('project')
lvim.builtin.telescope.defaults.file_ignore_patterns = { "node_modules", ".venv" }
lvim.builtin.telescope.load_extension = { "fzf", "project" }

lvim.builtin.telescope.extensions = {
  fzf = {
    fuzzy = true, -- false will only do exact matching
    override_generic_sorter = false, -- override the generic sorter
    override_file_sorter = true, -- override the file sorter
    case_mode = "smart_case", -- or "ignore_case" or "respect_case"
    -- the default case_mode is "smart_case"
  },
  project = {
    base_dirs = {
      "~/main_ws/projects/sparta/sparta-data-warehouse/",
    },
    hidden_files = true,
  },
  file_browser = {
    hidden = true,
    show_hidden = true,
    only_cwd = true,
    follow = true,
    file_icons = true,
    git_icons = true,
    hide_gitignore = true,
    hide_dotfiles = true,
    cwd_only = true,
    layout_strategy = "horizontal",
    layout_config = {
      width = 0.75,
      height = 0.75,
      prompt_position = "top",
      preview_cutoff = 120,
      horizontal = {
        mirror = false,
      },
      vertical = {
        mirror = false,
      },
    },
  },
}
