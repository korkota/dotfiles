return {
  "VonHeikemen/lsp-zero.nvim",
  branch = "v4.x",
  config = function()
    local lsp_zero = require("lsp-zero")

    -- lsp_attach is where you enable features that only work
    -- if there is a language server active in the file
    local lsp_attach = function(_, bufnr)
      local opts = { buffer = bufnr }

      vim.keymap.set("n", "gh", "<cmd>lua vim.lsp.buf.hover()<cr>", opts)
      vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", opts)
      vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", opts)
      vim.keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>", opts)
      vim.keymap.set("n", "go", "<cmd>lua vim.lsp.buf.type_definition()<cr>", opts)
      vim.keymap.set("n", "grr", "<cmd>lua vim.lsp.buf.references()<cr>", opts)
      vim.keymap.set("n", "gs", "<cmd>lua vim.lsp.buf.signature_help()<cr>", opts)
      vim.keymap.set("i", "<C-s>", "<cmd>lua vim.lsp.buf.signature_help()<cr>", opts)
      vim.keymap.set("n", "grn", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)
      -- vim.keymap.set({ "n", "x" }, "<F3>", "<cmd>lua vim.lsp.buf.format({async = true})<cr>", opts)
      vim.keymap.set({ "n", "v" }, "gra", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)
    end

    lsp_zero.extend_lspconfig({
      sign_text = true,
      lsp_attach = lsp_attach,
      capabilities = require("cmp_nvim_lsp").default_capabilities(),
    })

    local ensure_installed = { "eslint", "tsserver", "lua_ls" }
    require("mason").setup({})
    require("mason-lspconfig").setup({
      -- Replace the language servers listed here
      -- with the ones you want to install
      -- https://github.com/williamboman/mason-lspconfig.nvim?tab=readme-ov-file#available-lsp-servers
      ensure_installed = ensure_installed,
      handlers = {
        function(server_name)
          require("lspconfig")[server_name].setup({})
        end,
      },
    })

    require("mason-tool-installer").setup({ "stylua" })

    local cmp = require("cmp")
    local luasnip = require("luasnip")
    luasnip.config.setup({})
    local cmp_action = require("lsp-zero").cmp_action()
    local cmp_format = require("lsp-zero").cmp_format({ details = true })

    cmp.setup({
      sources = {
        { name = "nvim_lsp" },
        { name = "luasnip" },
      },
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      mapping = cmp.mapping.preset.insert({
        ["<C-f>"] = cmp_action.luasnip_jump_forward(),
        ["<C-b>"] = cmp_action.luasnip_jump_backward(),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<CR>"] = cmp.mapping.confirm({ select = true }),
        ["<Tab>"] = cmp_action.luasnip_supertab(),
        ["<S-Tab>"] = cmp_action.luasnip_shift_supertab(),
      }),
      formatting = cmp_format,
    })
  end,
}
