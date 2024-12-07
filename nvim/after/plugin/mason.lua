require('mason').setup()

require('mason-lspconfig').setup({
  ensure_installed = {
    'rust_analyzer',
    'tsserver',
    'solargraph',
    'omnisharp_mono'
  }
})

local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()
local lsp_attach = function(client, bufnr)
  -- workaround for issue
  -- https://github.com/OmniSharp/omnisharp-roslyn/issues/2483
  if client.name == 'omnisharp' then
    local tokenModifiers = client.server_capabilities.semanticTokensProvider.legend.tokenModifiers
    for i, v in ipairs(tokenModifiers) do
      tokenModifiers[i] = v:gsub(' ', '_')
    end
    local tokenTypes = client.server_capabilities.semanticTokensProvider.legend.tokenTypes
    for i, v in ipairs(tokenTypes) do
      tokenTypes[i] = v:gsub(' ', '_')
    end
  end

  -- mappings
  vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, {
    buffer = bufnr,
    remap = false,
    desc = 'Go to definition'
  })
  vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, {
    buffer = bufnr,
    remap = false,
    desc = 'Show description'
  })
  vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, {
    buffer = bufnr,
    remap = false
  })
  vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, {buffer = bufnr, remap = false})
  vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, {buffer = bufnr, remap = false})
  vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, {buffer = bufnr, remap = false})
  vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, {buffer = bufnr, remap = false})
  vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, {
    buffer = bufnr,
    remap = false,
    desc = 'Find references'
  })
  vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, {
    buffer = bufnr,
    remap = false,
    desc = 'Rename refactoring'
  })
  vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, {
    buffer = bufnr,
    remap = false,
  })
end

local lspconfig = require('lspconfig')
require('mason-lspconfig').setup_handlers({
  function(server_name)
    lspconfig[server_name].setup({
      on_attach = lsp_attach,
      capabilities = lsp_capabilities,
    })
  end,
  ["omnisharp_mono"] = function()
    local pid = vim.fn.getpid()

    require('lspconfig').omnisharp.setup({
      cmd = { "omnisharp-mono", "--languageserver" , "--hostPID", "--verbose", tostring(pid) };
      root_dir = lspconfig.util.root_pattern("*.csproj","*.sln");
      on_attach = lsp_attach;
      capabilities = lsp_capabilities;
    })
  end
})
