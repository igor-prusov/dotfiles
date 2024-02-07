vim.keymap.set('','<F2>', '<cmd>NERDTreeToggle<CR>')
vim.keymap.set('','<F3>', '<cmd>TagbarToggle<CR>')
vim.keymap.set('','<F4>', '<cmd>UndotreeToggle<CR>')
vim.keymap.set('','<C-p>', '<cmd>FZF<CR>')

require('gitsigns').setup()

vim.cmd.colorscheme('habamax')


vim.keymap.set('','<leader>x', '<cmd>bdelete<CR>')

local lspconfig = require('lspconfig')

lspconfig.clangd.setup {}

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
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
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

local capabilities = require('cmp_nvim_lsp').default_capabilities()
require('lspconfig')['clangd'].setup {
	capabilities = capabilities
}
