-- lua/plugins/autopairs.lua
local status_ok, autopairs = pcall(require, "nvim-autopairs")
if not status_ok then
  return
end

autopairs.setup({
  check_ts = true, -- Usa Treesitter para ser más inteligente
  ts_config = {
    lua = {'string'},
    javascript = {'template_string'},
    java = false,
  }
})
