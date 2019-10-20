""" Insert
" insert modeにて日付、時刻挿入
inoremap ,date <C-R>=strftime('%Y-%m-%d')<CR>
inoremap ,time <C-R>=strftime('%H:%M')<CR>

""" Command line
cnoremap <C-b> <Left>
cnoremap <C-f> <Right>
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
cnoremap <C-d> <Del>
cnoremap <C-h> <BS>

