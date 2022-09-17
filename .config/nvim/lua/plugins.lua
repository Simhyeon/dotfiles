return require('packer').startup(function(use)
    -- this is essential.
    use 'wbthomason/packer.nvim'
    -- Lua std-like lib, this doesn't have to be explicit, but I maybe use one
    use "nvim-lua/plenary.nvim"
    use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
    use 'nvim-treesitter/nvim-treesitter-context'
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.0',
        requires = { {'nvim-lua/plenary.nvim'} }
    }
    use {
        'akinsho/bufferline.nvim',
        tag = "v2.*",
        requires = 'kyazdani42/nvim-web-devicons'
    }
    use 'sainnhe/everforest'
    use 'Akianonymus/nvim-colorizer.lua'
    use 'rust-lang/rust.vim'
    use({"L3MON4D3/LuaSnip", tag = "v<CurrentMajor>.*"})
    use {
	'nvim-orgmode/orgmode',
    	config = function()
    	        require('orgmode').setup{}
    	end
    }
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }
    use({
        "kylechui/nvim-surround",
        tag = "*", -- Use for stability; omit to use `main` branch for the latest features
        config = function()
            require("nvim-surround").setup({
                -- Configuration here, or leave empty to use defaults
            })
        end
    })
    use {
        'kyazdani42/nvim-tree.lua',
        requires = {
            'kyazdani42/nvim-web-devicons', -- optional, for file icons
        },
    }
    use {
        'lewis6991/gitsigns.nvim',
        tag = 'release'
    }
    use 'octol/vim-cpp-enhanced-highlight'
    use {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    }
    use 'liuchengxu/vista.vim' -- Not yet no lua plugin
    use 'jiangmiao/auto-pairs'
    use {'neoclide/coc.nvim', branch = 'release'}
end)
