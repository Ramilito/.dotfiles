vim.pack.add({ "https://github.com/hrsh7th/cmp-nvim-lsp" })
vim.pack.add({ "https://github.com/hrsh7th/cmp-buffer" })
vim.pack.add({ "https://github.com/hrsh7th/cmp-path" })
vim.pack.add({ "https://github.com/hrsh7th/nvim-cmp" })

local cmp = require("cmp")
cmp.setup({
  mapping = cmp.mapping.preset.insert({
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<CR>"] = cmp.mapping.confirm({ select = true }),
  }),
  sources = cmp.config.sources({
    { name = "nvim_lsp", { name = "buffer" } },
  }),
})

vim.lsp.config("*", { capabilities = require("cmp_nvim_lsp").default_capabilities() })
