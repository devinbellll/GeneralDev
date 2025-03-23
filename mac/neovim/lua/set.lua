-- Editor settings
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4        -- controls the depth of autoindentation
vim.opt.expandtab = true      -- converts tabs to spaces
vim.opt.laststatus = 2        -- show status line always
vim.opt.hidden = true

-- Tab autocomplete helpers
vim.opt.wildmode = 'longest,list,full'
vim.opt.wildmenu = true
vim.opt.smartcase = true
vim.opt.ignorecase = true
vim.opt.infercase = true

-- NERDTree
-- minimal ui
vim.g.NERDTreeMinimalUI = 1

-- FZF
-- Set runtime path for fzf
vim.opt.rtp:append('~/fzf')
vim.env.FZF_DEFAULT_COMMAND = 'ag -g ""'

-- Highlight search terms
vim.opt.hlsearch = true
vim.api.nvim_create_user_command('C', function()
  vim.fn.setreg('/', '')
end, {})

-- Mouse support
vim.opt.mouse = 'a'

-- Line numbering
vim.opt.number = true
vim.opt.relativenumber = true
