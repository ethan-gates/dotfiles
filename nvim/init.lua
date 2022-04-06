
--- Includes packer bootstrap
require 'Functions'

--- Plugins 
packer = require 'packer'

local packer_setup = function()
    -- Packer can manage itself
    --use 'wbthomason/packer.nvim'
    use 'henriquehbr/nvim-startup.lua'

    --- Aesthetics
    use 'nvim-lualine/lualine.nvim' -- not researched (status bar)
    --use 'famiu/feline.nvim'
    use 'kyazdani42/nvim-web-devicons' -- not researched
    use 'lukas-reineke/indent-blankline.nvim' -- not researched
    --use 'glepnir/oceanic-material'
    use "rebelot/kanagawa.nvim"
    use 'EdenEast/nightfox.nvim'

    --- Navigation
    use {
        'kyazdani42/nvim-tree.lua', -- not researched (file explorer)
        requires = 'kyazdani42/nvim-web-devicons',
        config = function() require'nvim-tree'.setup {} end
    }
	use {'akinsho/bufferline.nvim', requires = 'kyazdani42/nvim-web-devicons'}


    --- Function
    use {
        'nvim-telescope/telescope.nvim',
        requires = { {'nvim-lua/plenary.nvim'} }
    }  
    use 'nvim-treesitter/nvim-treesitter' -- not researched (syntax highlighting)
    use 'windwp/nvim-autopairs' -- not researched

    --- lsp 
    use 'neovim/nvim-lspconfig' -- not researched

    --- completion
    use 'hrsh7th/nvim-cmp' -- not researched
    use 'hrsh7th/cmp-nvim-lsp' -- not researched
end

packer.startup(packer_setup)

--- Normal config things

vim.o.number = true
vim.o.scrolloff = 28
vim.o.tabstop = 4
vim.o.shiftwidth = 4


vim.o.tgc = true
vim.o.background = 'dark'
require'nightfox'.load'nightfox'

vim.api.nvim_exec('au! BufRead,BufNewFile *.podspec       setfiletype ruby', false)
vim.api.nvim_exec('au! BufRead,BufNewFile Podfile.template       setfiletype ruby', false)
vim.api.nvim_exec('au! BufRead,BufNewFile Podfile       setfiletype ruby', false)
vim.api.nvim_exec('au! BufRead,BufNewFile Podfile.lock       setfiletype yaml', false)

--- Plugin configuration

require('lualine').setup()
require('nvim-startup').setup()
require("bufferline").setup{
	options = {
		max_name_length = 40,
		offsets = {
  			{
    			filetype = "NvimTree",
    			text = "File Explorer",
    			highlight = "Directory",
    			text_align = "left"
  			}
		}
	}
}


vim.o.showmode = false 

local actions = require("telescope.actions")

require('telescope').setup({
    defaults = {
        mappings = {
            i = {
                ["<esc>"] = actions.close,
            },
        },
    },
})

--- keymaps
vim.g.mapleader = ' '
nmap('<leader> ', ':w<cr>')
nmap('<leader>n', ':NvimTreeToggle<cr>')
nmap('m', '2j')
nmap(',', '2k')
nmap('t', ':bnext<cr>')
nmap('T', ':bprev<cr>')

--- Telescope keymaps
nmap('ff', ':Telescope find_files<cr>')
nmap('fa', ':Telescope<cr>')
nmap('fc', ':Telescope commands<cr>')
nmap('fb', ':Telescope buffers<cr>')
nmap('ft', ':Telescope live_grep<cr>')


--- nvim-cmp
  -- Setup nvim-cmp.
  local cmp = require'cmp'

  cmp.setup({
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
        -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
        -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
      end,
    },
    mapping = {
      ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
      ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
      ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
      ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
      ['<C-e>'] = cmp.mapping({
        i = cmp.mapping.abort(),
        c = cmp.mapping.close(),
      }),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    },
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'vsnip' }, -- For vsnip users.
      -- { name = 'luasnip' }, -- For luasnip users.
      -- { name = 'ultisnips' }, -- For ultisnips users.
      -- { name = 'snippy' }, -- For snippy users.
    }, {
      { name = 'buffer' },
    })
  })

  -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline('/', {
    sources = {
      { name = 'buffer' }
    }
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })

  -- Setup lspconfig.
  local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
  -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
  require('lspconfig')['pyright'].setup {
    capabilities = capabilities
  }

