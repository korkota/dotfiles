return {
  "neovim/nvim-lspconfig",
  opts = {
    codelens = {
      enabled = true,
    },

    servers = {
      typos_lsp = {
        filetypes = {
          "bash",
          "javascript",
          "javascriptreact",
          "javascript.jsx",
          "lua",
          "sh",
          "typescript",
          "typescriptreact",
          "typescript.tsx",
        },
        init_options = {
          config = vim.fn.stdpath("config") .. "/typos.toml",
          diagnosticSeverity = "Warning",
        },
      },
      -- vtsls = {
      --   settings = {
      --     -- https://github.com/yioneko/vtsls/blob/bbe6d6f3b50a3ae9d929a65bbb5e9db07e25ce49/packages/service/configuration.schema.json
      --     typescript = {
      --       referencesCodeLens = {
      --         enabled = true,
      --       },
      --       implementationsCodeLens = {
      --         enabled = true,
      --       },
      --     },
      --   },
      -- },
    },
  },
}
