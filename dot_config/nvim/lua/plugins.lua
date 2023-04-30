vim.cmd[[packadd packer.nvim]]

require'packer'.startup(function()
    use 'wbthomason/packer.nvim'
    --use "dense-analysis/ale"
    use "EdenEast/nightfox.nvim"
    use "gamoutatsumi/dps-ghosttext.vim"
    use 'nvim-telescope/telescope.nvim'
    use 'nvim-telescope/telescope-frecency.nvim'
    use 'nvim-telescope/telescope-project.nvim'
    
    use 'nvim-telescope/telescope-file-browser.nvim'
    use {
      'folke/which-key.nvim',
      config = function()
        require("which-key").setup{}
      end
    }
    use {
      'folke/twilight.nvim',
      config = function()
        require("twilight").setup{
          dimming = {
            alpha = 0.25, -- amount of dimming
            -- we try to get the foreground from the highlight groups or fallback color
            color = { "Normal", "#ffffff" },
            term_bg = "#000000", -- if guibg=NONE, this will be used to calculate text color
            inactive = false, -- when true, other windows will be fully dimmed (unless they contain the same buffer)
          },
          context = 10, -- amount of lines we will try to show around the current line
          treesitter = false, -- use treesitter when available for the filetype
          -- treesitter is used to automatically expand the visible text,
          -- but you can further control the types of nodes that should always be fully expanded
          expand = { -- for treesitter, we we always try to expand to the top-most ancestor with these types
          "function",
          "method",
          "table",
          "if_statement",
        },
        exclude = {}, -- exclude these filetypes
        }
      end
    }
    
    use 'Olical/conjure'
    use 'Pocco81/true-zen.nvim'
    use 'arnamak/stay-centered.nvim'

    use {
      'lewis6991/gitsigns.nvim',
      config = function()
        require('gitsigns').setup {
          watch_gitdir = {
            interval = 10000,
            follow_files = true
          },
        }
      end
    }
    use 'neovim/nvim-lspconfig'
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-nvim-lsp-signature-help'
    use 'hrsh7th/cmp-nvim-lsp-document-symbol'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-nvim-lua'
    use 'hrsh7th/vim-vsnip'
    use 'itchyny/vim-haskell-indent'
    use {
      'jose-elias-alvarez/null-ls.nvim',
    requires = {"nvim-lua/plenary.nvim"} }
    use 'onsails/lspkind-nvim'
    use 'ollykel/v-vim'
    use {
      'nvim-neo-tree/neo-tree.nvim',
      branch = "v2.x",
      requires = {
        "nvim-lua/plenary.nvim",
        "kyazdani42/nvim-web-devicons",
        "MunifTanjim/nui.nvim",
      }
    }
    use 'nvim-lua/plenary.nvim'
    use "kyazdani42/nvim-web-devicons"
    use "MunifTanjim/nui.nvim"
    use "shaunsingh/solarized.nvim"
    use "mfussenegger/nvim-lint"
    use {
      "nvim-lualine/lualine.nvim",
      requires = {'kyazdani42/nvim-web-devicons'}
    }
    use "nvim-treesitter/nvim-treesitter"
    use {
      'TimUntersberger/neogit',
      requires = "nvim-lua/plenary.nvim"
    }
    use 'williamboman/mason.nvim'
    use 'williamboman/mason-lspconfig.nvim'
    use {
      'windwp/nvim-autopairs',
      config = function() require("nvim-autopairs").setup{} end
    }
    use "wlangstroth/vim-racket"
    use "wuelnerdotexe/vim-astro"
end)


local neogit = require("neogit")

neogit.setup {
  disable_signs = false,
  disable_hint = false,
  disable_context_highlighting = false,
  disable_commit_confirmation = false,
  -- Neogit refreshes its internal state after specific events, which can be expensive depending on the repository size. 
  -- Disabling `auto_refresh` will make it so you have to manually refresh the status after you open it.
  auto_refresh = true,
  disable_builtin_notifications = false,
  use_magit_keybindings = false,
  -- Change the default way of opening neogit
  kind = "tab",
  -- Change the default way of opening the commit popup
  commit_popup = {
    kind = "split",
  },
  -- Change the default way of opening popups
  popup = {
    kind = "split",
  },
  -- customize displayed signs
  signs = {
    -- { CLOSED, OPENED }
    section = { ">", "v" },
    item = { ">", "v" },
    hunk = { "", "" },
  },
  integrations = {
    -- Neogit only provides inline diffs. If you want a more traditional way to look at diffs, you can use `sindrets/diffview.nvim`.
    -- The diffview integration enables the diff popup, which is a wrapper around `sindrets/diffview.nvim`.
    --
    -- Requires you to have `sindrets/diffview.nvim` installed.
    -- use { 
    --   'TimUntersberger/neogit', 
    --   requires = { 
    --     'nvim-lua/plenary.nvim',
    --     'sindrets/diffview.nvim' 
    --   }
    -- }
    --
    diffview = false  
  },
  -- Setting any section to `false` will make the section not render at all
  sections = {
    untracked = {
      folded = false
    },
    unstaged = {
      folded = false
    },
    staged = {
      folded = false
    },
    stashes = {
      folded = true
    },
    unpulled = {
      folded = true
    },
    unmerged = {
      folded = false
    },
    recent = {
      folded = true
    },
  },
  -- override/add mappings
  mappings = {
    -- modify status buffer mappings
    status = {
      -- Adds a mapping with "B" as key that does the "BranchPopup" command
      ["B"] = "BranchPopup",
      -- Removes the default mapping of "s"
      ["s"] = "",
    }
  }
}
local nvim_lsp = require('lspconfig')
require('mason').setup()
require('mason-lspconfig').setup_handlers({ function(server_name)
  local opts = {}
  if server_name == "sumneko_lua" then
    opts.settings = {
      Lua = {
        diagnostics = { globals = { 'vim' } },
      }
    }
  end
  if server_name == "ltex-ls" then
  end
  nvim_lsp[server_name].setup(opts)
end })

local cmp = require'cmp'

cmp.setup({
    snippet = {
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body)
    end,
    },
    window = {
      -- completion = cmp.config.window.bordered(),
      -- documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    experimental = {
      ghost_text = true,
    },
    sources = {
      {name = 'nvim_lsp'},
      {name = 'buffer'},
      {name = 'path'}
    }
  })

local null_ls = require("null-ls")

null_ls.setup({
  sources = { null_ls.builtins.diagnostics.textlint.with({
    filetypes = {"markdown", "tex"}
  })
}
})
require('lualine').setup {
    options = {
        icons_enabled = true,
        theme = 'auto',
        component_separators = { left = '', right = ''},
        section_separators = { left = '', right = ''},
        disabled_filetypes = {},
        always_divide_middle = true,
        globalstatus = false,
    },
    sections = {
        lualine_a = {'mode'},
        lualine_b = {'branch', 'diff', 'diagnostics'},
        lualine_c = {'filename'},
        lualine_x = {'encoding', 'fileformat', 'filetype'},
        lualine_y = {'progress'},
        lualine_z = {'location'}
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {'filename'},
        lualine_x = {'location'},
        lualine_y = {},
        lualine_z = {}
    },
    tabline = {},
    extensions = {}
}

vim.cmd([[
let g:astro_typescript = 'enable'
]])

require'telescope'.load_extension('project')
