-- General settings
vim.opt.number = true            -- Show line numbers
vim.opt.relativenumber = true 
vim.opt.hlsearch = false        -- Disable search highlighting
vim.opt.incsearch = true        -- Incremental search
vim.opt.smartindent = true      -- Smart indenting
vim.o.smarttab = true        -- Use smart indentation with tabs
vim.o.autoindent = true      -- Automatically indent new lines based on the previous one
vim.opt.tabstop = 4             -- Set tab width to 4
vim.o.softtabstop = 4           -- Number of spaces that a tab counts for in insert mode
vim.opt.shiftwidth = 4          -- Set indentation width to 4
vim.opt.expandtab = false        -- Use spaces instead of tabs
vim.opt.guicursor = {
  "n-v-c:block",
  "i-ci-ve:ver25",
  "r-cr:hor20",
  "o:hor50",
  "a:blinkon0",
}


vim.g.mapleader = " "
vim.g.tmux_navigator_no_wrap = 1



-- Enable line wrapping
vim.opt.wrap = true

-- Set clipboard to system clipboard (works if vim is compiled with +clipboard)
vim.opt.clipboard = 'unnamedplus'

-- Enable line break on search matches
vim.opt.linebreak = true

-- Bootstrap Packer if not installed
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd([[packadd packer.nvim]])
  end
end
ensure_packer()

-- Plugins
require('packer').startup(function(use)
  -- Packer itself
  use 'wbthomason/packer.nvim'
 
  --Treesitter
  use 'nvim-treesitter/nvim-treesitter'

  -- LSP Config for C++ (clangd)
  use 'neovim/nvim-lspconfig'
  
  -- Autocompletion plugin
  use 'hrsh7th/nvim-compe'

  -- Install neoformat for automat sic formatting
  use 'sbdchd/neoformat'

  -- Add NERDTree
  use 'preservim/nerdtree'

  use 'wuelnerdotexe/vim-enfocado'

  -- Git integration with vim-fugitive
  use 'tpope/vim-fugitive'

  -- 2. “Git gutter” signs + hunk actions (stage/reset/blame inline)
  use {
    'lewis6991/gitsigns.nvim',
    requires = { 'nvim-lua/plenary.nvim' },
    config = function()
      require('gitsigns').setup {
        on_attach = function(bufnr)
          local gs = package.loaded.gitsigns
          vim.keymap.set('n', ']h', gs.next_hunk,    { buffer=bufnr })
          vim.keymap.set('n', '[h', gs.prev_hunk,    { buffer=bufnr })
          vim.keymap.set('n', '<leader>hs', gs.stage_hunk,  { buffer=bufnr })
          vim.keymap.set('n', '<leader>hr', gs.reset_hunk,  { buffer=bufnr })
          vim.keymap.set('n', '<leader>hS', gs.stage_buffer,{ buffer=bufnr })
          vim.keymap.set('n', '<leader>hu', gs.undo_stage_hunk,{ buffer=bufnr })
          vim.keymap.set('n', '<leader>hp', gs.preview_hunk, { buffer=bufnr })
        end,
      }
    end,
  }

  -- 3. Magit-style UI: commit, branch, push, pull, stash, blame
  use {
    'TimUntersberger/neogit',
    requires = { 'nvim-lua/plenary.nvim' },
    config = function()
      require('neogit').setup { use_magit_keybindings = true }
      vim.keymap.set('n','<leader>g.','<cmd>Neogit<CR>',{desc="NeoGit"})
    end,
  }


    use {
    "aserowy/tmux.nvim",
    config = function()
      require("tmux").setup({
        navigation = {
          enable_default_keybindings = true, -- Enables Ctrl-h/j/k/l for seamless movement
        },
        resize = {
          enable_default_keybindings = true, -- Enables Ctrl-Arrow keys for resizing
        }
      })
    end
  }
	


--use 'navarasu/onedark.nvim'

--tmux navigation
use 'christoomey/vim-tmux-navigator'

--claude-code-nvim
use {
  'greggh/claude-code.nvim',
  requires = {
    'nvim-lua/plenary.nvim', -- Required for git operations
  },
  config = function()
    require('claude-code').setup()
  end
}

end)

-- enable true-color
vim.o.termguicolors = true

-- light or dark?
vim.o.background = 'dark'

-- choose your style: 'nature' or 'neon'
vim.g.enfocado_style = 'nature'

-- finally, turn on the colorscheme
vim.cmd('colorscheme enfocado')

 --Lua
--require('onedark').load()
--require('onedark').setup {
--    style = 'darker'
--}
--require('onedark').load()

-- LSP setup for clangd (C++)
local lspconfig = require('lspconfig')
lspconfig.clangd.setup({
  cmd = { "clangd", "--background-index" },  -- Optional: background indexing for faster results
})

-- Enable nvim-compe for autocompletion
vim.o.completeopt = 'menuone,noselect'

require'compe'.setup {
  enabled = true;
  autocomplete = true;
  min_length = 1;
  preselect = 'enable';
  source = {
    path = true;
    buffer = true;
    nvim_lsp = true;
    nvim_lua = true;
    vsnip = true;
  };
}

-- Treesitter configuration
require'nvim-treesitter.configs'.setup {
  -- Enable parsing for C++ and other languages
  ensure_installed = { "cpp", "python", "javascript", "lua", "go", "rust", "bash", "html", "css" },

  -- Enable syntax highlighting and other features
  highlight = {
    enable = true,              -- Enable Tree-sitter highlighting
    disable = { "c", "rust" },  -- Optionally disable for specific languages
    additional_vim_regex_highlighting = false, -- Disable regex highlighting for better performance
  },

  -- Enable folding based on Tree-sitter
  fold = {
    enable = true,
  },

  -- Enable incremental selection
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "gnn",      -- Start the selection
      node_incremental = "grn",    -- Increment the selection to the next node
      scope_incremental = "grc",   -- Increment to the current scope
      node_decremental = "grm",    -- Decrement the selection
    },
  },

  -- Enable auto-pairing of brackets and other characters
  autopairs = {
    enable = true,
  },

  -- Enable rainbow parentheses (optional, for better syntax visibility)
  rainbow = {
    enable = true,
    extended_mode = true,  -- Highlight parentheses for more languages
    max_file_lines = nil,  -- Don't limit the number of lines to highlight
  },
}

--Autoformat the current file
vim.g.neoformat_enabled_cpp = {'clangformat'}
vim.api.nvim_set_keymap('n', '<Leader>f', ':Neoformat<CR>', { noremap = true, silent = true })
-- Autoformat on file save
vim.cmd [[
  augroup auto_format
    autocmd!
    autocmd BufWritePre *.cpp,*.h Neoformat
  augroup END
]]

-- Go to definition
vim.api.nvim_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', {noremap = true, silent = true})

-- Write/Quit Keybinds
vim.api.nvim_set_keymap('n', '<Leader>s', ':w<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>q', ':q<CR>', { noremap = true, silent = true })

-- Map <Leader>n to toggle NERDTree
vim.api.nvim_set_keymap('n', '<Leader>n', ':NERDTreeToggle<CR>', { noremap = true, silent = true })
