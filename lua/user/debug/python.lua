return {
  plugins = {
    {
      "jay-babu/mason-nvim-dap.nvim",
      opts = {
        handlers = {
          python = function(source_name)
            -- From here https://github.com/mfussenegger/nvim-dap-python/blob/65ccab83fb3d0b29ead6c765c1c52a1ed49592e8/lua/dap-python.lua#L136-L162
            local dap = require "dap"
            adapter_python_path = adapter_python_path and vim.fn.expand(vim.fn.trim(adapter_python_path)) or "python3"
            opts = vim.tbl_extend("keep", opts or {}, default_setup_opts)
            dap.adapters.python = function(cb, config)
              if config.request == "attach" then
                ---@diagnostic disable-next-line: undefined-field
                local port = (config.connect or config).port
                ---@diagnostic disable-next-line: undefined-field
                local host = (config.connect or config).host or "127.0.0.1"
                cb {
                  type = "server",
                  port = assert(port, "`connect.port` is required for a python `attach` configuration"),
                  host = host,
                  enrich_config = enrich_config,
                  options = {
                    source_filetype = "python",
                  },
                }
              else
                cb {
                  type = "executable",
                  command = adapter_python_path,
                  args = { "-m", "debugpy.adapter" },
                  enrich_config = enrich_config,
                  options = {
                    source_filetype = "python",
                  },
                }
              end
            end
            dap.configurations.python = {
              {
                type = "python",
                request = "launch",
                name = "Launch file",
                program = "${file}", -- This configuration will launch the current file if used.
              },
            }
          end,
        },
      },
    },
  },
}
