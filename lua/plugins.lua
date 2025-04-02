return {
  -- the colorscheme should be available when starting Neovim
  {
  "neanias/everforest-nvim",
  version = false,
  lazy = false,
  priority = 1000, -- make sure to load this before all the other start plugins
  -- Optional; default configuration will be used if setup isn't called.
  config = function()
    require("everforest").setup({
  background = "soft",
  ---How much of the background should be transparent. 2 will have more UI
  ---components be transparent (e.g. status line background)
  transparent_background_level = 0,
  ---Whether italics should be used for keywords and more.
  italics = false,
  ---Disable italic fonts for comments. Comments are in italics by default, set
  ---this to `true` to make them _not_ italic!
  disable_italic_comments = false,
  ---By default, the colour of the sign column background is the same as the as normal text
  ---background, but you can use a grey background by setting this to `"grey"`.
  sign_column_background = "none",
  ---The contrast of line numbers, indent lines, etc. Options are `"high"` or
  ---`"low"` (default).
  ui_contrast = "low",
  ---Dim inactive windows. Only works in Neovim. Can look a bit weird with Telescope.
  ---
  ---When this option is used in conjunction with show_eob set to `false`, the
  ---end of the buffer will only be hidden inside the active window. Inside
  ---inactive windows, the end of buffer filler characters will be visible in
  ---dimmed symbols. This is due to the way Vim and Neovim handle `EndOfBuffer`.
  dim_inactive_windows = false,
  ---Some plugins support highlighting error/warning/info/hint texts, by
  ---default these texts are only underlined, but you can use this option to
  ---also highlight the background of them.
  diagnostic_text_highlight = false,
  ---Which colour the diagnostic text should be. Options are `"grey"` or `"coloured"` (default)
  diagnostic_virtual_text = "coloured",
  ---Some plugins support highlighting error/warning/info/hint lines, but this
  ---feature is disabled by default in this colour scheme.
  diagnostic_line_highlight = false,
  ---By default, this color scheme won't colour the foreground of |spell|, instead
  ---colored under curls will be used. If you also want to colour the foreground,
  ---set this option to `true`.
  spell_foreground = false,
  ---Whether to show the EndOfBuffer highlight.
  show_eob = true,
  ---Style used to make floating windows stand out from other windows. `"bright"`
  ---makes the background of these windows lighter than |hl-Normal|, whereas
  ---`"dim"` makes it darker.
  ---
  ---Floating windows include for instance diagnostic pop-ups, scrollable
  ---documentation windows from completion engines, overlay windows from
  ---installers, etc.
  ---
  ---NB: This is only significant for dark backgrounds as the light palettes
  ---have the same colour for both values in the switch.
  float_style = "bright",
  ---You can override specific highlights to use other groups or a hex colour.
  ---This function will be called with the highlights and colour palette tables.
  ---@param highlight_groups Highlights
  ---@param palette Palette
  on_highlights = function(highlight_groups, palette) end,
  ---You can override colours in the palette to use different hex colours.
  ---This function will be called once the base and background colours have
  ---been mixed on the palette.
  ---@param palette Palette
  colours_override = function(palette) end,   })
  end,
  },
  { 'akinsho/bufferline.nvim', version = "*", dependencies = 'nvim-tree/nvim-web-devicons' },
  {
    "theprimeagen/harpoon",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("harpoon").setup()
    end,
  },
  -- I have a separate config.mappings file where I require which-key.
  -- With lazy the plugin will be automatically loaded when it is required somewhere
  {
    "dstein64/vim-startuptime",
    -- lazy-load on a command
    cmd = "StartupTime",
  },

  {
    "nvim-neo-tree/neo-tree.nvim",
    config = function()
      require("neo-tree").setup({
        close_if_last_window = true,
        event_handlers = {
          {
            event = "file_opened",
            handler = function(file_path)
              --auto close
              require("neo-tree").close_all()
            end
          },

        }
      })
    end
  },
  "nvim-lua/plenary.nvim",
  "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
  "MunifTanjim/nui.nvim",

  {
    "folke/noice.nvim",
    config = function()
      require("noice").setup({
        lsp = {
          override = {
            ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
            ["vim.lsp.util.stylize_markdown"] = true,
            ["cmp.entry.get_documentation"] = true,
          },
        },
        presets = {
          bottom_search = true,         -- use a classic bottom cmdline for search
          command_palette = true,       -- position the cmdline and popupmenu together
          long_message_to_split = true, -- long messages will be sent to a split
          inc_rename = false,           -- enables an input dialog for inc-rename.nvim
          lsp_doc_border = false,       -- add a border to hover docs and signature help
        },
        messages = {
          enabled = false,
        }
      })
    end,
    dependencies = {
      "MunifTanjim/nui.nvim",
    }
  },
  { "moll/vim-bbye" },
  {
    "rcarriga/nvim-dap-ui",
    dependencies = { "mfussenegger/nvim-dap" },
    init = function()
      require("dapui").setup()
    end
  },
  {
    'leoluz/nvim-dap-go',
    init = function()
      require("dap-go").setup()
    end
  },
  {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup()
    end
  },
  {
    "iamcco/markdown-preview.nvim",
    build = "cd app && npm install",
    init = function() vim.g.mkdp_filetypes = { "markdown" } end,
    ft = { "markdown" },
  },
  {
    -- Additional text objects via treesitter
    'nvim-treesitter/nvim-treesitter-textobjects',
    dependencies = 'nvim-treesitter',
  },
  {
    "xiyaowong/nvim-transparent",
    build = ':TransparentEnable',
    config = function()
      require("transparent").setup({
        extra_groups = { -- table/string: additional groups that should be cleared
          "all",
        },
        exclude_groups = {}, -- table: groups you don't want to clear
      })
    end
  },
  "tpope/vim-surround",
  "p00f/nvim-ts-rainbow",
  {
    "windwp/nvim-autopairs",
    config = function()
      require("nvim-autopairs").setup {}
    end
  },
  {
    "folke/todo-comments.nvim",
    dependencies = "nvim-lua/plenary.nvim",
    config = function() require("todo-comments").setup {} end
  },

  {
    "nvim-neorg/neorg",
    build = ":Neorg sync-parsers",
    opts = {
      load = {
        ["core.defaults"] = {},  -- Loads default behaviour
        ["core.concealer"] = {}, -- Adds pretty icons to your documents
        ["core.presenter"] = {
          config = {
            zen_mode = "truezen"
          },
        }, -- Adds pretty icons to your documents
        ["core.completion"] = {
          config = {
            engine = "nvim-cmp",
            name = "[Neorg]"
          }
        },
        ["core.export.markdown"] = {},
        ["core.export"] = {
          config = {
            export_dir = "~/notes/exports"
          }
        },
        ["core.dirman"] = { -- Manages Neorg workspaces
          config = {
            workspaces = {
              notes = "~/notes",
            },
            default_workspace = "notes"
          },
        },
      },
    },
    dependencies = { { "nvim-lua/plenary.nvim" } },
  },

  {
    "Pocco81/true-zen.nvim",
    config = function()
      require("true-zen").setup({
        integrations = {
          lualine = true, -- hide nvim-lualine (ataraxis)
        },
      })
    end,
  },
  {
    "christoomey/vim-tmux-navigator",
  },
  {
    "simrat39/rust-tools.nvim",
    ft = "rs"
  },
  {
    "saecki/crates.nvim",
    ft = "rs,toml",
    dependencies = { { 'nvim-lua/plenary.nvim' } },
    config = function()
      require('crates').setup()
    end,
  },
  { 'nvim-telescope/telescope-ui-select.nvim' },
  {"github/copilot.vim"},
  {
    "kristijanhusak/vim-dadbod-ui",
    dependencies = { "tpope/vim-dadbod", "kristijanhusak/vim-dadbod-completion", "tpope/vim-dotenv" },
  },


}
