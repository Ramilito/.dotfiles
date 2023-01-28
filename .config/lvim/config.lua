local home = os.getenv("HOME")
package.path = package.path .. ";" .. home .. "/.config/lvim/?.lua"

-- general
lvim.log.level = "info"
lvim.format_on_save = false
lvim.colorscheme = "tokyonight"
lvim.transparent_window = false

-- customization
lvim.builtin.terminal.active = true
lvim.builtin.alpha.active = false

-- lvim.builtin.project.patterns = { ".git" }
-- lvim.builtin.project.detection_methods = { "pattern" }

lvim.builtin.lualine.active = true
lvim.builtin.lualine.options.globalstatus = true

lvim.builtin.indentlines.active = true
lvim.builtin.dap.active = false
lvim.builtin.project.active = false
lvim.builtin.bufferline.active = false
lvim.builtin.lir.active = false
lvim.builtin.breadcrumbs.active = true
lvim.builtin.nvimtree.active = true

lvim.builtin.telescope.theme = "center"
require("user.init")
-- require("lsp.init")

-- lvim.builtin.cmp.formatting.source_names["copilot"] = "(Copilot)"
-- table.insert(lvim.builtin.cmp.sources, 1, { name = "copilot" })
