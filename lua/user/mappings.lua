-- Mapping data with "desc" stored directly by vim.keymap.set().
--
-- Please use this mappings table to set keyboard mapping since this is the
-- lower level configuration and more robust one. (which-key will
-- automatically pick-up stored data by this setting.)
return {
  -- first key is the mode
  n = {
    -- second key is the lefthand side of the map
    -- mappings seen under group name "Buffer"
    ["<leader>bn"] = { "<cmd>tabnew<cr>", desc = "New tab" },
    ["<leader>bD"] = {
      function()
        require("astronvim.utils.status").heirline.buffer_picker(
          function(bufnr) require("astronvim.utils.buffer").close(bufnr) end
        )
      end,
      desc = "Pick to close",
    },
    -- tables with the `name` key will be registered with which-key if it's installed
    -- this is useful for naming menus
    ["<leader>b"] = { name = "Buffers" },
    ["<leader>L"] = { name = "LLM Powered" },

    ["<leader>La"] = { "<cmd>GpAppend<cr>", desc = "Appends the response to the current line" },
    ["<leader>Lr"] = { "<cmd>GpRewrite<cr>", desc = "Rewrites the current selected text with the response" },
    -- quick save
    -- ["<C-s>"] = { ":w!<cr>", desc = "Save File" },  -- change description but the same command
    ["<Tab>"] = { ":bnext<CR>" },
    ["<S-Tab>"] = { ":bprev<CR>" },
  },
  v = {

    ["<leader>Lr"] = { "<cmd>GpRewrite<cr>", desc = "Rewrites the current selected text with the response" },
  },
  t = {
    -- setting a mapping to false will disable it
    -- ["<esc>"] = false,
  },
}
