call plug#begin()
Plug 'preservim/nerdtree'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'qpkorr/vim-renamer'
Plug 'tpope/vim-fugitive'
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/vim-vsnip'
Plug 'simrat39/rust-tools.nvim'
Plug 'RRethy/vim-illuminate'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/nvim-treesitter-textobjects'
Plug 'aaronik/treewalker.nvim'
Plug 'rust-lang/rust.vim'
Plug 'junegunn/vim-easy-align'
Plug 'rose-pine/neovim'
call plug#end()

" Set leader to space
lua vim.g.mapleader = " "

lua require('set')
lua require('remap')
lua require('nvim-cmp-setup')
lua require('theme')

" Automatically remove trailing whitespace on save
autocmd BufWritePre * :%s/\s\+$//e

" needed to fix comment highlighting in rust
autocmd FileType rust syntax match rustDocComment +\/\/\//!.*\|\/\/\/.*+ containedin=rustComment

" Consolidated autocommand group for filetypes
augroup FileTypeSettings
  autocmd!
  autocmd FileType c,cpp,java,php,ruby,python,rust setlocal expandtab tabstop=4 shiftwidth=4
  autocmd FileType make setlocal noexpandtab shiftwidth=4 softtabstop=0
  autocmd FileType vim let b:vcm_tab_complete = 'vim'
augroup END

