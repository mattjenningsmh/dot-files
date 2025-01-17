vim.g.mapleader = " "
vim.g.maplocalleader = " "


require("keymaps")
require("config.lazy")


vim.cmd [[
    set mouse=a
    set smartcase 
    set hlsearch
    set ignorecase 
    
    set mouse=nv 
    
    set tabstop=4
    set shiftwidth=4 
    set smartindent
    set expandtab
    set autoindent
    set nowrap
    set rnu
    set ruler
    set foldmethod=syntax 
    syntax on
    
    
    colorscheme desert
    
    highlight Normal guibg=none 
    highlight Normal ctermbg=none 
    highlight NonText ctermbg=none
    highlight NonText guibg=none
    
    "netrw config (:Explore)
    let g:netrw_liststyle=3
    
    "configure completions 
    set omnifunc=lsp#complete
    set completeopt=menu,menuone,preview,noinsert
    
    
    "load plugins
    
    " Autocommand to execute :Lex when Vim starts
    " autocmd VimEnter * :20Lex
]]
