-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  'https://github.com/ThePrimeagen/vim-be-good',
  'https://github.com/Mofiqul/vscode.nvim',
  {
    'NeogitOrg/neogit',
    dependencies = {
      'nvim-lua/plenary.nvim', -- required
      'sindrets/diffview.nvim', -- optional - Diff integration
    },
    config = true,
  },
  {
    'https://github.com/tpope/vim-fugitive',
    config = function()
      vim.keymap.set('n', '<leader>gs', ':G<CR>', { noremap = true, silent = true })
      vim.keymap.set('n', '<leader>gc', ':Git commit<CR>', { noremap = true, silent = true })
      vim.keymap.set('n', '<leader>gp', ':Git push<CR>', { noremap = true, silent = true })
      vim.keymap.set('n', '<leader>gl', ':Git pull<CR>', { noremap = true, silent = true })
      vim.keymap.set('n', '<leader>gd', ':Gdiffsplit<CR>', { noremap = true, silent = true })
    end,
  },
  {
    'github/copilot.vim',
    init = function()
      vim.g.copilot_no_tab_map = true
      vim.g.copilot_assume_mapped = true
    end,
    config = function()
      vim.keymap.set('i', '<Tab>', 'copilot#AcceptLine()', { expr = true })
      vim.keymap.set('i', '<C-j>', '<Plug>(copilot-next)', { noremap = false })
      vim.keymap.set('i', '<C-k>', '<Plug>(copilot-previous)', { noremap = false })
    end,
  },
  {
    'MeanderingProgrammer/render-markdown.nvim',
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.nvim' }, -- if you use the mini.nvim suite
    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' }, -- if you use standalone mini plugins
    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
    ---@module 'render-markdown'
    ---@type render.md.UserConfig
    opts = {},
  },
  -- Mostrar contexto de la función o bloque de código en la parte superior de la ventana
  {
    'nvim-treesitter/nvim-treesitter-context',
    config = function()
      require('treesitter-context').setup {
        enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
        throttle = true, -- Throttles plugin updates (may improve performance)
        max_lines = 5, -- How many lines the window should span. Values <= 0 mean no limit.
        patterns = { -- Match patterns for TS nodes. These get wrapped to match at word boundaries.
          default = {
            'class',
            'function',
            'method',
            -- 'for', -- These won't appear in the context
            -- 'while',
            -- 'if',
            -- 'switch',
            -- 'case',
          },
        },
      }
    end,
  },
  -- gestor de proyectos
  {
    'ahmedkhalf/project.nvim',
    config = function()
      require('project_nvim').setup {
        detection_methods = { 'lsp', 'pattern' },
        patterns = { '.git', 'Makefile', 'package.json' },
      }
    end,
  },
  -- avante
  {
    'yetone/avante.nvim',
    event = 'VeryLazy',
    lazy = false,
    version = false, -- set this to "*" if you want to always pull the latest change, false to update on release
    opts = {
      provider = 'copilot',
      copilot = {
        endpoint = 'https://api.githubcopilot.com',
        model = 'gpt-4o-2024-08-06',
        -- model = 'gpt-4o-mini', -- Cambia el modelo si es necesario
        proxy = nil, -- [protocol://]host[:port] Use this proxy
        allow_insecure = false, -- Allow insecure server connections
        timeout = 30000, -- Timeout in milliseconds
        temperature = 0,
        max_tokens = 4096,
      },
    },
    -- opts = {
    --   -- add any opts here
    --   provider = 'openai',
    --   openai = {
    --     --   endpoint = "https://api.openai.com/v1",
    --     model = 'gpt-4o-mini', -- Cambia el modelo si es necesario
    --     --   -- api_key = "TU_API_KEY_DE_OPENAI", -- Asegúrate de reemplazar con tu clave
    --     --   timeout = 30000,
    --     --   temperature = 0.7,
    --     --   max_tokens = 2000,
    --   },
    -- },
    -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
    build = 'make',
    -- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
    dependencies = {
      'stevearc/dressing.nvim',
      'nvim-lua/plenary.nvim',
      'MunifTanjim/nui.nvim',
      --- The below dependencies are optional,
      'hrsh7th/nvim-cmp', -- autocompletion for avante commands and mentions
      'nvim-tree/nvim-web-devicons', -- or echasnovski/mini.icons
      'zbirenbaum/copilot.lua', -- for providers='copilot'
      {
        -- support for image pasting
        'HakonHarnes/img-clip.nvim',
        event = 'VeryLazy',
        opts = {
          -- recommended settings
          default = {
            embed_image_as_base64 = false,
            prompt_for_file_name = false,
            drag_and_drop = {
              insert_mode = true,
            },
            -- required for Windows users
            use_absolute_path = true,
          },
        },
      },
      {
        -- Make sure to set this up properly if you have lazy=true
        'MeanderingProgrammer/render-markdown.nvim',
        opts = {
          file_types = { 'markdown', 'Avante' },
        },
        ft = { 'markdown', 'Avante' },
      },
    },
  },
  -- oil
  {
    -- Plugin: oil.nvim
    -- URL: https://github.com/stevearc/oil.nvim
    -- Description: A Neovim plugin for managing and navigating directories.
    'stevearc/oil.nvim',
    opts = {
      -- Key mappings for oil.nvim actions
      keymaps = {
        ['g?'] = 'actions.show_help', -- Show help
        ['<CR>'] = 'actions.select', -- Select entry
        ['<C-M-s>'] = { 'actions.select', opts = { vertical = true }, desc = 'Open the entry in a vertical split' }, -- Open entry in vertical split
        ['<C-d>'] = { 'actions.select', opts = { horizontal = true }, desc = 'Open the entry in a horizontal split' }, -- Open entry in horizontal split
        ['<C-t>'] = { 'actions.select', opts = { tab = true }, desc = 'Open the entry in new tab' }, -- Open entry in new tab
        ['<C-p>'] = 'actions.preview', -- Preview entry
        ['<C-c>'] = 'actions.close', -- Close oil.nvim
        ['<C-l>'] = 'actions.refresh', -- Refresh oil.nvim
        ['-'] = 'actions.parent', -- Go to parent directory
        ['_'] = 'actions.open_cwd', -- Open current working directory
        ['`'] = 'actions.cd', -- Change directory
        ['~'] = { 'actions.cd', opts = { scope = 'tab' }, desc = ':tcd to the current oil directory' }, -- Change directory for the current tab
        ['gs'] = 'actions.change_sort', -- Change sorting method
        ['gx'] = 'actions.open_external', -- Open entry with external application
        ['g.'] = 'actions.toggle_hidden', -- Toggle hidden files
        ['g\\'] = 'actions.toggle_trash', -- Toggle trash
      },
      use_default_keymaps = false, -- Do not use default key mappings
    },
    -- Optional dependencies
    dependencies = {
      -- Plugin: nvim-web-devicons
      -- URL: https://github.com/nvim-tree/nvim-web-devicons
      -- Description: A Lua fork of vim-web-devicons for Neovim.
      'nvim-tree/nvim-web-devicons',
    },
  },
}
