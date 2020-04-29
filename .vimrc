if &compatible
  set nocompatible
endif

" ============================================================================
" junegunn/vim-plug
" ============================================================================
filetype off

let vimplug_exists=expand('~/.vim/autoload/plug.vim')

if !filereadable(vimplug_exists)
  echo "Installing Vim-Plug..."
  silent !\curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  let g:not_finish_vimplug = "yes"
  autocmd VimEnter * PlugInstall
endif

call plug#begin(expand('~/.vim/plugged'))
    " Add plugins
    Plug 'vlime/vlime'
    Plug 'vim-scripts/paredit.vim'
call plug#end()


" ============================================================================
" Vim configration
" ============================================================================
source ~/.vim/rc/keymap-rc.vim
source ~/.vim/rc/appearance-rc.vim
source ~/.vim/rc/vlime.vim
source ~/.vim/rc/paredit.vim
 
set clipboard=unnamed

""" Help
set helplang=en,ja
" マウスを無効化
if has('mouse')
  set mouse-=a
endif


""" file
set confirm             " 保存されていないファイルがあるときは終了前に保存確認
set hidden              " 保存されていないファイルがあるときでも別のファイルを開く
set nobackup
set noswapfile
set autoread            " 外部からファイル変更時、自動読み込み
set encoding=utf-8      " read
set fileencoding=utf-8  " write
let g:netrw_dirhistmax=0    " disable netrw history
let g:netrw_liststyle=3     " netrwは常にツリー表示


""" edit
set virtualedit=block   " 文字が無い部分でも矩形選択を可能にする
set tabstop=4           " Tab文字が占める幅
set shiftwidth=4        " autoindent width
set expandtab           " Tab 挿入を space 挿入にする(Tab挿入 : Ctrl + V<Tab>)
set formatoptions-=ro   " コメントアウト自動挿入しない :help fo-table

""" search
set ignorecase
set smartcase   " 検索文字列が大文字なら大文字小文字区別して検索する
set noincsearch
set hlsearch    " highlight search
highlight Search cterm=NONE ctermfg=black ctermbg=yellow
set wrapscan

set belloff=all
