vim.keymap.set('','<F1>', '<cmd>Telescope man_pages sections=ALL<CR>')
vim.keymap.set('','<F2>', '<cmd>NERDTreeToggle<CR>')
vim.keymap.set('','<F3>', '<cmd>TagbarToggle<CR>')
vim.keymap.set('','<F4>', '<cmd>UndotreeToggle<CR>')
vim.keymap.set('','<F12>', '<cmd>set invnumber<CR>')
vim.keymap.set('','<C-p>', '<cmd>Telescope git_files<CR>')
vim.keymap.set('n', '<C-j>', (function()
	pcall(vim.cmd.cnext)
end))
vim.keymap.set('n', '<C-k>', (function()
	pcall(vim.cmd.cprevious)
end))

require('gitsigns').setup()

vim.cmd.colorscheme('kanagawa-wave')
vim.cmd.set("mouse=")

vim.opt.listchars = {
	tab = "▸ ",
	lead = '.',
	trail = '.',
}

vim.keymap.set('','<leader>x', '<cmd>bdelete<CR>')

local lspconfig = require('lspconfig')
lspconfig.clangd.setup {
	capabilities = require('cmp_nvim_lsp').default_capabilities()
}
lspconfig.rust_analyzer.setup {
	settings = {
		['rust-analyzer'] = {
			check = {
				command = "clippy";
			},
			diagnostics = {
				enable = true;
			}
		}
	}
}

vim.api.nvim_create_autocmd('FileType', {
	pattern = "dts",
	callback = function (ev)
		vim.lsp.start({
			name = 'dts-lsp',
			cmd = {'dts-lsp'},
			root_dir = vim.fs.dirname(vim.fs.find({'.git'}, { upward = true })[1]),
		})
	end
})

vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    vim.opt.completeopt:remove { "preview"}

    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local opts = { buffer = ev.buf }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    --vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
    vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', '<leader>=', function()
      vim.lsp.buf.format { async = true }
    end, opts)
  end,
})

local cmp = require('cmp')

cmp.setup({
	snippet = {
		expand = function(args)
			vim.fn["vsnip#anonymous"](args.body)
		end,
	},
	window = {
	},
	mapping = cmp.mapping.preset.insert({
		['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
	}),
	sources = cmp.config.sources({
		{ name = 'nvim_lsp' },

	}, {
		{ name = 'buffer' },
	})
})

local telescope= require('telescope')
telescope.load_extension('live_grep_args')

local telescope_builtin = require('telescope.builtin')

vim.api.nvim_create_user_command('RG', function()
	telescope_builtin.live_grep{}
end, {})

vim.api.nvim_create_user_command('RGA', function()
	telescope.extensions.live_grep_args.live_grep_args()
end, {})

-- BufExplorer: Don't locate buffers by default
vim.g.bufExplorerFindActive = 0

require('nvim-treesitter.configs').setup{}

require('kanagawa').setup {
	commentStyle = {
		italic = false
	}
}
