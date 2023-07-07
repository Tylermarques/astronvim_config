return {
  -- You can also add new plugins here as well:
  { "lambdalisue/suda.vim" },
  {
    "linux-cultist/venv-selector.nvim",
    opts = {
      fd_binary_name = "fdfind",
    },
  },
  lsp = {
    config = {
      pyright = {
        capabilities = (function()
          local capabilities = vim.lsp.protocol.make_client_capabilities()
          capabilities.textDocument.publishDiagnostics.tagSupport.valueSet = { 2 }
          return capabilities
        end)(),
        settings = {
          python = {
            analysis = {
              useLibraryCodeForTypes = true,
              diagnosticSeverityOverrides = {
                reportUnusedVariable = "warning", -- or anything
              },
              typeCheckingMode = "none",
            },
          },
        },
      },
    },
  },
}
