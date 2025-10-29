-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

_G._packer = _G._packer or {}
_G._packer.inside_compile = true

local time
local profile_info
local should_profile = false
if should_profile then
  local hrtime = vim.loop.hrtime
  profile_info = {}
  time = function(chunk, start)
    if start then
      profile_info[chunk] = hrtime()
    else
      profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
    end
  end
else
  time = function(chunk, start) end
end

local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end
  if threshold then
    table.insert(results, '(Only showing plugins that took longer than ' .. threshold .. ' ms ' .. 'to load)')
  end

  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/badger/.cache/nvim/packer_hererocks/2.1.1760617492/share/lua/5.1/?.lua;/home/badger/.cache/nvim/packer_hererocks/2.1.1760617492/share/lua/5.1/?/init.lua;/home/badger/.cache/nvim/packer_hererocks/2.1.1760617492/lib/luarocks/rocks-5.1/?.lua;/home/badger/.cache/nvim/packer_hererocks/2.1.1760617492/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/badger/.cache/nvim/packer_hererocks/2.1.1760617492/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  LuaSnip = {
    loaded = true,
    path = "/home/badger/.local/share/nvim/site/pack/packer/start/LuaSnip",
    url = "https://github.com/L3MON4D3/LuaSnip"
  },
  ["alpha-nvim"] = {
    config = { "\27LJ\2\n\v\0\2\2\0\0\0\1L\1\2\0�\22\1\0\t\0002\1�\0016\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0029\2\3\0019\2\4\0025\3\6\0=\3\5\0029\2\3\0019\2\4\0029\2\a\2'\3\t\0=\3\b\0029\2\3\0019\2\n\0024\3\n\0009\4\v\1'\6\f\0'\a\r\0'\b\14\0B\4\4\2>\4\1\0039\4\v\1'\6\15\0'\a\16\0'\b\17\0B\4\4\2>\4\2\0039\4\v\1'\6\18\0'\a\19\0'\b\20\0B\4\4\2>\4\3\0039\4\v\1'\6\21\0'\a\22\0'\b\23\0B\4\4\2>\4\4\0039\4\v\1'\6\24\0'\a\25\0'\b\26\0B\4\4\2>\4\5\0039\4\v\1'\6\27\0'\a\28\0'\b\29\0B\4\4\2>\4\6\0039\4\v\1'\6\30\0'\a\31\0'\b \0B\4\4\2>\4\a\0039\4\v\1'\6!\0'\a\"\0B\4\3\2>\4\b\0039\4\v\1'\6#\0'\a$\0'\b%\0B\4\4\0?\4\0\0=\3\5\0029\2\3\0019\2\n\0029\2\a\2'\3&\0=\3\b\0029\2\3\0019\2'\0025\3(\0=\3\5\0029\2\3\0019\2'\0029\2\a\2'\3)\0=\3\b\0024\2\6\0005\3+\0009\4\3\0019\4\4\0049\4\5\4=\4\5\0039\4\3\0019\4\4\0049\4\a\4=\4\a\3>\3\1\0025\3,\0>\3\2\0025\3-\0009\4\3\0019\4\n\0049\4\5\4=\4\5\0039\4\3\0019\4\n\0049\4\a\4=\4\a\3>\3\3\0025\3.\0003\4/\0=\4\5\3>\3\4\0025\0030\0009\4\3\0019\4'\0049\4\5\4=\4\5\0039\4\3\0019\4'\0049\4\a\4=\4\a\3>\3\5\2=\2*\0019\0021\0009\4\a\1B\2\2\1K\0\1\0\nsetup\1\0\3\bval\0\ttype\vfooter\topts\0\0\1\0\2\bval\0\ttype\fpadding\1\0\3\bval\0\ttype\fbuttons\topts\0\1\0\2\bval\3\5\ttype\fpadding\1\0\3\bval\0\ttype\vheader\topts\0\vlayout\fComment\1\4\0\0@🕉️ Sabiduría: Visión correcta, pensamiento correcto.JConducta ética: Habla correcta, acción correcta, sustento correcto._Disciplina mental: Esfuerzo correcto, atención correcta, concentración correcta. 🕉️\vfooter\rFunction\f:qa<CR>\16󰈆  Salir\6q\24󰥩  File explorer\14Space + e\29:Telescope live_grep<CR>\"  Buscar texto en proyecto\6t\20:e $MYVIMRC<CR>!⚙️ Editar configuración\6c\30:Telescope git_status<CR>\29󰊢  Ver cambios de Git\6g\15:Mason<CR>.  Mason para lenguajes de programacion\6m\20:PackerSync<CR>\31󰄴  Sincronizar plug-ins\6S\30:Telescope find_files<CR>\27  Buscar un archivo\6s\14:enew<CR>\23  Nuevo archivo\6n\vbutton\fbuttons\vString\ahl\topts\1\n\0\0�\1  ▄███████▄    ▄████████ ███▄▄▄▄        ███     ▄█    █▄   ▄█      ▄▄▄▄███▄▄▄▄    �\1  ███    ███   ███    ███ ███▀▀▀██▄   ▀█████████▄ ███    ███ ███   ▄██▀▀▀███▀▀▀██▄ �\1  ███    ███   ███    █▀  ███   ███     ▀███▀▀██ ███    ███ ███▌ ███    ███   ███ �\1  ███    ███  ▄███▄▄▄     ███   ███       ███   ▀ ███    ███ ███▌ ███    ███   ███ �\1▀█████████▀  ▀▀███▀▀▀     ███   ███       ███     ███    ███ ███▌ ███    ███   ███ �\1  ███          ███    █▄  ███   ███       ███     ███    ███ ███  ███    ███   ███ �\1  ███          ███    ███ ███   ███       ███     ███    ███ ███  ███    ███   ███ �\1 ▄████▀         ██████████  ▀█   █▀       ▄████▀     ▀██████▀  █▀     ▀█    ███   █▀  Y                                                                          By Badger.\bval\vheader\fsection\27alpha.themes.dashboard\nalpha\frequire\19����\4\0" },
    loaded = true,
    path = "/home/badger/.local/share/nvim/site/pack/packer/start/alpha-nvim",
    url = "https://github.com/goolord/alpha-nvim"
  },
  ["cmp-buffer"] = {
    loaded = true,
    path = "/home/badger/.local/share/nvim/site/pack/packer/start/cmp-buffer",
    url = "https://github.com/hrsh7th/cmp-buffer"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/home/badger/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-path"] = {
    loaded = true,
    path = "/home/badger/.local/share/nvim/site/pack/packer/start/cmp-path",
    url = "https://github.com/hrsh7th/cmp-path"
  },
  cmp_luasnip = {
    loaded = true,
    path = "/home/badger/.local/share/nvim/site/pack/packer/start/cmp_luasnip",
    url = "https://github.com/saadparwaiz1/cmp_luasnip"
  },
  kanagawa = {
    config = { "\27LJ\2\n?\0\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0 colorscheme kanagawa-dragon\bcmd\bvim\0" },
    loaded = true,
    path = "/home/badger/.local/share/nvim/site/pack/packer/start/kanagawa",
    url = "https://github.com/Rebelot/kanagawa.nvim"
  },
  ["lualine.nvim"] = {
    loaded = true,
    path = "/home/badger/.local/share/nvim/site/pack/packer/start/lualine.nvim",
    url = "https://github.com/nvim-lualine/lualine.nvim"
  },
  ["mason-lspconfig.nvim"] = {
    loaded = true,
    path = "/home/badger/.local/share/nvim/site/pack/packer/start/mason-lspconfig.nvim",
    url = "https://github.com/williamboman/mason-lspconfig.nvim"
  },
  ["mason.nvim"] = {
    loaded = true,
    path = "/home/badger/.local/share/nvim/site/pack/packer/start/mason.nvim",
    url = "https://github.com/williamboman/mason.nvim"
  },
  ["neo-tree.nvim"] = {
    loaded = true,
    path = "/home/badger/.local/share/nvim/site/pack/packer/start/neo-tree.nvim",
    url = "https://github.com/nvim-neo-tree/neo-tree.nvim"
  },
  ["none-ls.nvim"] = {
    loaded = true,
    path = "/home/badger/.local/share/nvim/site/pack/packer/start/none-ls.nvim",
    url = "https://github.com/nvimtools/none-ls.nvim"
  },
  ["nui.nvim"] = {
    loaded = true,
    path = "/home/badger/.local/share/nvim/site/pack/packer/start/nui.nvim",
    url = "https://github.com/MunifTanjim/nui.nvim"
  },
  ["nvim-autopairs"] = {
    loaded = true,
    path = "/home/badger/.local/share/nvim/site/pack/packer/start/nvim-autopairs",
    url = "https://github.com/windwp/nvim-autopairs"
  },
  ["nvim-cmp"] = {
    loaded = true,
    path = "/home/badger/.local/share/nvim/site/pack/packer/start/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/home/badger/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/home/badger/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/badger/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/nvim-tree/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/badger/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/badger/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["telescope-fzf-native.nvim"] = {
    loaded = true,
    path = "/home/badger/.local/share/nvim/site/pack/packer/start/telescope-fzf-native.nvim",
    url = "https://github.com/nvim-telescope/telescope-fzf-native.nvim"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "/home/badger/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["which-key.nvim"] = {
    loaded = true,
    path = "/home/badger/.local/share/nvim/site/pack/packer/start/which-key.nvim",
    url = "https://github.com/folke/which-key.nvim"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: kanagawa
time([[Config for kanagawa]], true)
try_loadstring("\27LJ\2\n?\0\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0 colorscheme kanagawa-dragon\bcmd\bvim\0", "config", "kanagawa")
time([[Config for kanagawa]], false)
-- Config for: alpha-nvim
time([[Config for alpha-nvim]], true)
try_loadstring("\27LJ\2\n\v\0\2\2\0\0\0\1L\1\2\0�\22\1\0\t\0002\1�\0016\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0029\2\3\0019\2\4\0025\3\6\0=\3\5\0029\2\3\0019\2\4\0029\2\a\2'\3\t\0=\3\b\0029\2\3\0019\2\n\0024\3\n\0009\4\v\1'\6\f\0'\a\r\0'\b\14\0B\4\4\2>\4\1\0039\4\v\1'\6\15\0'\a\16\0'\b\17\0B\4\4\2>\4\2\0039\4\v\1'\6\18\0'\a\19\0'\b\20\0B\4\4\2>\4\3\0039\4\v\1'\6\21\0'\a\22\0'\b\23\0B\4\4\2>\4\4\0039\4\v\1'\6\24\0'\a\25\0'\b\26\0B\4\4\2>\4\5\0039\4\v\1'\6\27\0'\a\28\0'\b\29\0B\4\4\2>\4\6\0039\4\v\1'\6\30\0'\a\31\0'\b \0B\4\4\2>\4\a\0039\4\v\1'\6!\0'\a\"\0B\4\3\2>\4\b\0039\4\v\1'\6#\0'\a$\0'\b%\0B\4\4\0?\4\0\0=\3\5\0029\2\3\0019\2\n\0029\2\a\2'\3&\0=\3\b\0029\2\3\0019\2'\0025\3(\0=\3\5\0029\2\3\0019\2'\0029\2\a\2'\3)\0=\3\b\0024\2\6\0005\3+\0009\4\3\0019\4\4\0049\4\5\4=\4\5\0039\4\3\0019\4\4\0049\4\a\4=\4\a\3>\3\1\0025\3,\0>\3\2\0025\3-\0009\4\3\0019\4\n\0049\4\5\4=\4\5\0039\4\3\0019\4\n\0049\4\a\4=\4\a\3>\3\3\0025\3.\0003\4/\0=\4\5\3>\3\4\0025\0030\0009\4\3\0019\4'\0049\4\5\4=\4\5\0039\4\3\0019\4'\0049\4\a\4=\4\a\3>\3\5\2=\2*\0019\0021\0009\4\a\1B\2\2\1K\0\1\0\nsetup\1\0\3\bval\0\ttype\vfooter\topts\0\0\1\0\2\bval\0\ttype\fpadding\1\0\3\bval\0\ttype\fbuttons\topts\0\1\0\2\bval\3\5\ttype\fpadding\1\0\3\bval\0\ttype\vheader\topts\0\vlayout\fComment\1\4\0\0@🕉️ Sabiduría: Visión correcta, pensamiento correcto.JConducta ética: Habla correcta, acción correcta, sustento correcto._Disciplina mental: Esfuerzo correcto, atención correcta, concentración correcta. 🕉️\vfooter\rFunction\f:qa<CR>\16󰈆  Salir\6q\24󰥩  File explorer\14Space + e\29:Telescope live_grep<CR>\"  Buscar texto en proyecto\6t\20:e $MYVIMRC<CR>!⚙️ Editar configuración\6c\30:Telescope git_status<CR>\29󰊢  Ver cambios de Git\6g\15:Mason<CR>.  Mason para lenguajes de programacion\6m\20:PackerSync<CR>\31󰄴  Sincronizar plug-ins\6S\30:Telescope find_files<CR>\27  Buscar un archivo\6s\14:enew<CR>\23  Nuevo archivo\6n\vbutton\fbuttons\vString\ahl\topts\1\n\0\0�\1  ▄███████▄    ▄████████ ███▄▄▄▄        ███     ▄█    █▄   ▄█      ▄▄▄▄███▄▄▄▄    �\1  ███    ███   ███    ███ ███▀▀▀██▄   ▀█████████▄ ███    ███ ███   ▄██▀▀▀███▀▀▀██▄ �\1  ███    ███   ███    █▀  ███   ███     ▀███▀▀██ ███    ███ ███▌ ███    ███   ███ �\1  ███    ███  ▄███▄▄▄     ███   ███       ███   ▀ ███    ███ ███▌ ███    ███   ███ �\1▀█████████▀  ▀▀███▀▀▀     ███   ███       ███     ███    ███ ███▌ ███    ███   ███ �\1  ███          ███    █▄  ███   ███       ███     ███    ███ ███  ███    ███   ███ �\1  ███          ███    ███ ███   ███       ███     ███    ███ ███  ███    ███   ███ �\1 ▄████▀         ██████████  ▀█   █▀       ▄████▀     ▀██████▀  █▀     ▀█    ███   █▀  Y                                                                          By Badger.\bval\vheader\fsection\27alpha.themes.dashboard\nalpha\frequire\19����\4\0", "config", "alpha-nvim")
time([[Config for alpha-nvim]], false)

_G._packer.inside_compile = false
if _G._packer.needs_bufread == true then
  vim.cmd("doautocmd BufRead")
end
_G._packer.needs_bufread = false

if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
