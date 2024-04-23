local lsp = require('lsp-zero')

lsp.on_attach(function(_, bufnr)
    lsp.default_keymaps({
        buffer = bufnr,
        preserve_mappings = false
    })

    local opts = {buffer = bufnr, remap = false}
    local bind = vim.keymap.set
    bind("n", "gr", function() vim.lsp.buf.references() end, opts)
    bind("n", "gd", function() vim.lsp.buf.definition() end, opts)
    bind("n", "gD", function() vim.lsp.buf.declaration() end, opts)
    bind("n", "K", function() vim.lsp.buf.hover() end, opts)
    bind("n", "<leader>ws", function() vim.lsp.buf.workspace_symbol() end, opts)
    bind("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
    bind("n", "<leader>rn" , function() vim.lsp.buf.rename() end, opts)
    bind("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)

end)

-- Setup Mason and handlers for lspconfig
require('mason').setup({})
require('mason-lspconfig').setup({
    -- Replace the language servers listed here
    -- with the ones you want to install
    ensure_installed = {
	'gopls',
    'clangd',
	'html',
    'sqls',
	'jsonls',
    'lua_ls',
	'tsserver',
	'rust_analyzer',
},
    handlers = {
        lsp.default_setup,
    },
})

local capabilities = require('cmp_nvim_lsp').default_capabilities()

require("mason-lspconfig").setup_handlers {
    -- The first entry (without a key) will be the default handler
    -- and will be called for each installed server that doesn't have
    -- a dedicated handler.
    function (server_name) -- default handler (optional)
        require("lspconfig")[server_name].setup {
            capabilities = capabilities
        }
    end,
    -- Next, you can provide a dedicated handler for specific servers.
    -- For example, a handler override for the `rust_analyzer`:
    rust_analyzer = function ()
        require("rust-tools").setup {
            -- Server-specific settings. See `:help lspconfig-setup`
            settings = {
                ['rust-analyzer'] = {
                    checkOnSave = {
                        command = "clippy",
                    }
                }
            }
        }
    end,
    lua_ls = function ()
        local lua_opts = lsp.nvim_lua_ls()
        require('lspconfig').lua_ls.setup(lua_opts)
    end,
    clangd = function ()
            require('lspconfig').clangd.setup {
            capabilities = capabilities,
        }
    end,
    gopls = function ()
       require('lspconfig').gopls.setup{
           capabilities = capabilities,
       }
    end
}

lsp.preset('recommended')


require('luasnip.loaders.from_vscode').lazy_load()

local cmp = require('cmp')
local cmp_select = {behavior = cmp.SelectBehavior.Select}
local cmp_action = require('lsp-zero').cmp_action()

local cmp_mappings = cmp.mapping.preset.insert({
	['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
	['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
    ['<C-f>'] = cmp_action.luasnip_jump_forward(),
    ['<C-b>'] = cmp_action.luasnip_jump_backward(),
	['<CR>'] = cmp.mapping.confirm({ select = true }),
    ['<Tab>'] = cmp_action.luasnip_supertab(),
    ['<S-Tab>'] = cmp_action.luasnip_shift_supertab(),
    ["<C-u>"] = cmp.mapping.scroll_docs(-4),
    ["<C-d>"] = cmp.mapping.scroll_docs(4),
})

-- disable completion with tab
-- this helps with copilot setup
-- cmp_mappings['<Tab>'] = nil
-- cmp_mappings['<S-Tab>'] = nil


local cmp_format = require('lsp-zero').cmp_format({details=true})
cmp.setup({
	mapping = cmp_mappings,
    sources = {
        {name = 'nvim_lsp'},
        {name = 'buffer'},
        {name = 'luasnip'},
        {name = 'nvim_lua'},
        {name = 'path'},
    },
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body)
        end,
    },
    -- Uncomment this to disable autocompletion
    -- completion = {
    --     autocomplete = false
    -- },
    -- Show source name in completion menu
    formatting = cmp_format,
})

cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
        { name = 'git' },
    }, {
        { name = 'buffer' },
    })
})

lsp.set_preferences({
    suggest_lsp_servers = true,
    sign_icons = {
        error = 'E',
        warn = 'W',
        hint = 'H',
        info = 'I'
    }
})

vim.diagnostic.config({
    virtual_text = true
})

lsp.setup({})
