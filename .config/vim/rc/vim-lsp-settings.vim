let g:lsp_settings = {'typescript-language-server':{'whitelist': ['javascript', 'javasriptreact', 'typescript', 'typescriptreact']}}
let g:lsp_diagnostics_enabled = 1
let g:lsp_diagnostics_echo_cursor = 1

nnoremap <silent><s-k> :LspHover<CR>
nnoremap <silent>gd :LspDefinition<CR>
