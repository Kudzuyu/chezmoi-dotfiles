require'plugins'
vim.o.clipboard = 'unnamedplus'

--colorscheme nord
vim.cmd 'colorscheme nightfox'
vim.api.nvim_set_keymap('n', '<Space>fed', ':e ~/.config/nvim/init.lua<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<Space>ft', ':NeoTreeShowToggle<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<Space>qq', ':q<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<Space>feR', ':source ~/.config/nvim/init.lua<CR> | :source ~/.config/nvim/lua/plugins.lua', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<Space>bb', ':Telescope buffers<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<Space>ff', ':Telescope find_files<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<Space>gt', ':tabnext<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<Space>gT', ':tabprevious<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<Space>fp', ':Telescope project<CR>', {noremap = true, silent = true})

vim.api.nvim_set_keymap('n', 'j', 'gj', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', 'k', 'gk', {noremap = true, silent = true})
--vim.api.nvim_set_keymap('n', '<Space>', '<CR>', {noremap = true, silent = true})

vim.g.tex_flavor = "latex"
vim.o.number = true
vim.bo.autoindent = true
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.smartindent = true
vim.o.splitright = true
vim.o.clipboard = 'unnamedplus'
vim.o.hls = true
vim.o.guifont = 'Cica:h11'
vim.o.guifontwide = '源暎こぶり明朝 v6:h11'
vim.o.completeopt = "menu,menuone,noselect"
vim.o.mouse = 'a'
vim.o.encoding='utf-8'
vim.o.autochdir = true

vim.cmd[[autocmd BufWritePost plugins.lua PackerCompile]]

--vim.api.nvim_exec(
--[[
--function! s:languagetool_lint() abort
--  let fname = expand('%')
--  if !filereadable(fname) || &modified
--    let fname = tempname()
--    call writefile(getline(1, '$'), fname)
--  endif
--  let cmd = printf('languagetool-lint %s', fname)
--  lgete system(cmd) | lw
--endfunction
--command! LanguageToolLint call <SID>languagetool_lint()
--]]

