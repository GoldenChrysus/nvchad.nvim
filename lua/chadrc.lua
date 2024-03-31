-- This file  needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/NvChad/blob/v2.5/lua/nvconfig.lua

---@type ChadrcConfig
local M = {}

M.ui = {
  theme = "everblush",

  -- hl_override = {
  -- 	Comment = { italic = true },
  -- 	["@comment"] = { italic = true },
  -- },

  statusline = {
    theme = "vscode_colored",
    separator_style = "round",
    modules = {
      lsp = function()
        local stl_utils = require "nvchad.stl.utils"
        local default = "%#St_Lsp#" .. stl_utils.lsp()

        if not pcall(require, "lsp_signature") then
          return default
        end

        local lsp_sig = require("lsp_signature").status_line()

        return lsp_sig.label .. " " .. default
      end,
    },
  },
}

return M
