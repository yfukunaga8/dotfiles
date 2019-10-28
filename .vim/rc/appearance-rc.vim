" ============================================================================
" Neovim init appearance
" ============================================================================
set number
set title
set showmode
set laststatus=2 " ステータスラインを常に表示する
set statusline=%F%m%r%w%=[ENC:%{&fileencoding}][LOW:%l/%L]
    " %F: ファイル名表示
    " %m: 更新チェック表示
    " %r: 読み込み専用か表示
    " %w: プレビューなら表示
    " %=: 以降、右寄せ
    " %{&fileencoding}
    " %l/%L: 現在行数/全行数
set showcmd
set wildmenu wildmode=list:longest,full " コマンドラインモードでTABキーによるファイル名補完を有効にする
highlight Visual ctermfg=black ctermbg=gray
highlight StatusLine ctermfg=black ctermbg=white
highlight Comment ctermfg=gray
highlight DiffAdd    ctermfg=33 ctermbg=236
highlight DiffChange ctermfg=white ctermbg=236
highlight DiffDelete ctermfg=darkred ctermbg=236
highlight DiffText   ctermfg=green ctermbg=236
"let loaded_matchparen = 1 " 括弧の対応非表示


