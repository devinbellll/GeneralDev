-- NERDTree
vim.api.nvim_set_keymap('n', '<Leader>n', ':NERDTreeToggle<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>f', ':NERDTreeFind<CR>', { noremap = true, silent = true })

-- Vertical split jump to definition
vim.api.nvim_set_keymap('n', 'vd', ':vert winc ]<CR>', { noremap = true, silent = true })

-- map fzf searcher to space p
vim.api.nvim_set_keymap('n', '<Leader>p', ':FZF<CR>', { noremap = true, silent = true })

-- Ag - search project
-- map ag command to also work
vim.cmd('cnoreabbrev ag Ag')

-- map ctrl f to Ag search
vim.api.nvim_set_keymap('v', '<C-F>', 'y:Ag <C-R>=escape(@", \'/\\\')<CR>', { noremap = true, silent = false })

-- copy into system clipboard with control c
vim.api.nvim_set_keymap('v', '<C-c>', '"+y', { noremap = true, silent = true })

-- toggle buffer (switch between current and last buffer)
vim.api.nvim_set_keymap('n', '<Leader>s', '<C-^>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>a', ':Buffers<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>x', ':bd<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>rr', ':Tags<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>mm', ':Marks<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>rb', ':BTags<CR>', { noremap = true, silent = true })

-- disable C-j and C-k in insert mode
-- I too often try to go up and down in lsp suggestions with it and ruin what
-- I am typing
vim.api.nvim_set_keymap('i', '<C-j>', '<Nop>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<C-k>', '<Nop>', { noremap = true, silent = true })

-- Primeagen

-- move blocks
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- keep cursor in middle on ctrl d and ctrl u
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- use leader p to paste value without yanking deletion
vim.keymap.set("x", "<leader>p", [["_dP]])
-- similarly delete without yanking with leader d
vim.keymap.set("n", "<leader>d", "\"_d")
vim.keymap.set("v", "<leader>d", "\"_d")

-- quick fix
vim.keymap.set("n", "<C-j>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-k>", "<cmd>cprev<CR>zz")

-- find and replace word you are on
vim.keymap.set("n", "//", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

