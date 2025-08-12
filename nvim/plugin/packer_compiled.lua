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
local package_path_str = "/Users/emartinez/.cache/nvim/packer_hererocks/2.1.1741730670/share/lua/5.1/?.lua;/Users/emartinez/.cache/nvim/packer_hererocks/2.1.1741730670/share/lua/5.1/?/init.lua;/Users/emartinez/.cache/nvim/packer_hererocks/2.1.1741730670/lib/luarocks/rocks-5.1/?.lua;/Users/emartinez/.cache/nvim/packer_hererocks/2.1.1741730670/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/Users/emartinez/.cache/nvim/packer_hererocks/2.1.1741730670/lib/lua/5.1/?.so"
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
  ["claude-code.nvim"] = {
    config = { "\27LJ\2\n9\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\16claude-code\frequire\0" },
    loaded = true,
    path = "/Users/emartinez/.local/share/nvim/site/pack/packer/start/claude-code.nvim",
    url = "https://github.com/greggh/claude-code.nvim"
  },
  ["gitsigns.nvim"] = {
    config = { "\27LJ\2\n¡\4\0\1\b\0\29\0C6\1\0\0009\1\1\0019\1\2\0016\2\3\0009\2\4\0029\2\5\2'\4\6\0'\5\a\0009\6\b\0015\a\t\0=\0\n\aB\2\5\0016\2\3\0009\2\4\0029\2\5\2'\4\6\0'\5\v\0009\6\f\0015\a\r\0=\0\n\aB\2\5\0016\2\3\0009\2\4\0029\2\5\2'\4\6\0'\5\14\0009\6\15\0015\a\16\0=\0\n\aB\2\5\0016\2\3\0009\2\4\0029\2\5\2'\4\6\0'\5\17\0009\6\18\0015\a\19\0=\0\n\aB\2\5\0016\2\3\0009\2\4\0029\2\5\2'\4\6\0'\5\20\0009\6\21\0015\a\22\0=\0\n\aB\2\5\0016\2\3\0009\2\4\0029\2\5\2'\4\6\0'\5\23\0009\6\24\0015\a\25\0=\0\n\aB\2\5\0016\2\3\0009\2\4\0029\2\5\2'\4\6\0'\5\26\0009\6\27\0015\a\28\0=\0\n\aB\2\5\1K\0\1\0\1\0\1\vbuffer\0\17preview_hunk\15<leader>hp\1\0\1\vbuffer\0\20undo_stage_hunk\15<leader>hu\1\0\1\vbuffer\0\17stage_buffer\15<leader>hS\1\0\1\vbuffer\0\15reset_hunk\15<leader>hr\1\0\1\vbuffer\0\15stage_hunk\15<leader>hs\1\0\1\vbuffer\0\14prev_hunk\a[h\vbuffer\1\0\1\vbuffer\0\14next_hunk\a]h\6n\bset\vkeymap\bvim\rgitsigns\vloaded\fpackage[\1\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0003\3\3\0=\3\5\2B\0\2\1K\0\1\0\14on_attach\1\0\1\14on_attach\0\0\nsetup\rgitsigns\frequire\0" },
    loaded = true,
    path = "/Users/emartinez/.local/share/nvim/site/pack/packer/start/gitsigns.nvim",
    url = "https://github.com/lewis6991/gitsigns.nvim"
  },
  neoformat = {
    loaded = true,
    path = "/Users/emartinez/.local/share/nvim/site/pack/packer/start/neoformat",
    url = "https://github.com/sbdchd/neoformat"
  },
  neogit = {
    config = { "\27LJ\2\n­\1\0\0\6\0\v\0\0156\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\0016\0\4\0009\0\5\0009\0\6\0'\2\a\0'\3\b\0'\4\t\0005\5\n\0B\0\5\1K\0\1\0\1\0\1\tdesc\vNeoGit\20<cmd>Neogit<CR>\15<leader>g.\6n\bset\vkeymap\bvim\1\0\1\26use_magit_keybindings\2\nsetup\vneogit\frequire\0" },
    loaded = true,
    path = "/Users/emartinez/.local/share/nvim/site/pack/packer/start/neogit",
    url = "https://github.com/TimUntersberger/neogit"
  },
  nerdtree = {
    loaded = true,
    path = "/Users/emartinez/.local/share/nvim/site/pack/packer/start/nerdtree",
    url = "https://github.com/preservim/nerdtree"
  },
  ["nvim-compe"] = {
    loaded = true,
    path = "/Users/emartinez/.local/share/nvim/site/pack/packer/start/nvim-compe",
    url = "https://github.com/hrsh7th/nvim-compe"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/Users/emartinez/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/Users/emartinez/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/Users/emartinez/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/Users/emartinez/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["tmux.nvim"] = {
    config = { "\27LJ\2\n­\1\0\0\4\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\2B\0\2\1K\0\1\0\vresize\1\0\1\31enable_default_keybindings\2\15navigation\1\0\2\15navigation\0\vresize\0\1\0\1\31enable_default_keybindings\2\nsetup\ttmux\frequire\0" },
    loaded = true,
    path = "/Users/emartinez/.local/share/nvim/site/pack/packer/start/tmux.nvim",
    url = "https://github.com/aserowy/tmux.nvim"
  },
  ["vim-enfocado"] = {
    loaded = true,
    path = "/Users/emartinez/.local/share/nvim/site/pack/packer/start/vim-enfocado",
    url = "https://github.com/wuelnerdotexe/vim-enfocado"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "/Users/emartinez/.local/share/nvim/site/pack/packer/start/vim-fugitive",
    url = "https://github.com/tpope/vim-fugitive"
  },
  ["vim-tmux-navigator"] = {
    loaded = true,
    path = "/Users/emartinez/.local/share/nvim/site/pack/packer/start/vim-tmux-navigator",
    url = "https://github.com/christoomey/vim-tmux-navigator"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: claude-code.nvim
time([[Config for claude-code.nvim]], true)
try_loadstring("\27LJ\2\n9\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\16claude-code\frequire\0", "config", "claude-code.nvim")
time([[Config for claude-code.nvim]], false)
-- Config for: neogit
time([[Config for neogit]], true)
try_loadstring("\27LJ\2\n­\1\0\0\6\0\v\0\0156\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\0016\0\4\0009\0\5\0009\0\6\0'\2\a\0'\3\b\0'\4\t\0005\5\n\0B\0\5\1K\0\1\0\1\0\1\tdesc\vNeoGit\20<cmd>Neogit<CR>\15<leader>g.\6n\bset\vkeymap\bvim\1\0\1\26use_magit_keybindings\2\nsetup\vneogit\frequire\0", "config", "neogit")
time([[Config for neogit]], false)
-- Config for: tmux.nvim
time([[Config for tmux.nvim]], true)
try_loadstring("\27LJ\2\n­\1\0\0\4\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\2B\0\2\1K\0\1\0\vresize\1\0\1\31enable_default_keybindings\2\15navigation\1\0\2\15navigation\0\vresize\0\1\0\1\31enable_default_keybindings\2\nsetup\ttmux\frequire\0", "config", "tmux.nvim")
time([[Config for tmux.nvim]], false)
-- Config for: gitsigns.nvim
time([[Config for gitsigns.nvim]], true)
try_loadstring("\27LJ\2\n¡\4\0\1\b\0\29\0C6\1\0\0009\1\1\0019\1\2\0016\2\3\0009\2\4\0029\2\5\2'\4\6\0'\5\a\0009\6\b\0015\a\t\0=\0\n\aB\2\5\0016\2\3\0009\2\4\0029\2\5\2'\4\6\0'\5\v\0009\6\f\0015\a\r\0=\0\n\aB\2\5\0016\2\3\0009\2\4\0029\2\5\2'\4\6\0'\5\14\0009\6\15\0015\a\16\0=\0\n\aB\2\5\0016\2\3\0009\2\4\0029\2\5\2'\4\6\0'\5\17\0009\6\18\0015\a\19\0=\0\n\aB\2\5\0016\2\3\0009\2\4\0029\2\5\2'\4\6\0'\5\20\0009\6\21\0015\a\22\0=\0\n\aB\2\5\0016\2\3\0009\2\4\0029\2\5\2'\4\6\0'\5\23\0009\6\24\0015\a\25\0=\0\n\aB\2\5\0016\2\3\0009\2\4\0029\2\5\2'\4\6\0'\5\26\0009\6\27\0015\a\28\0=\0\n\aB\2\5\1K\0\1\0\1\0\1\vbuffer\0\17preview_hunk\15<leader>hp\1\0\1\vbuffer\0\20undo_stage_hunk\15<leader>hu\1\0\1\vbuffer\0\17stage_buffer\15<leader>hS\1\0\1\vbuffer\0\15reset_hunk\15<leader>hr\1\0\1\vbuffer\0\15stage_hunk\15<leader>hs\1\0\1\vbuffer\0\14prev_hunk\a[h\vbuffer\1\0\1\vbuffer\0\14next_hunk\a]h\6n\bset\vkeymap\bvim\rgitsigns\vloaded\fpackage[\1\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0003\3\3\0=\3\5\2B\0\2\1K\0\1\0\14on_attach\1\0\1\14on_attach\0\0\nsetup\rgitsigns\frequire\0", "config", "gitsigns.nvim")
time([[Config for gitsigns.nvim]], false)

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
