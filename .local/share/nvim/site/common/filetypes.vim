" Filetype specific settings
autocmd FileType c,cpp,h,cc,cxx,txx,hxx,hpp setlocal shiftwidth=4 tabstop=4
autocmd FileType go setlocal shiftwidth=4 tabstop=4 noexpandtab
autocmd FileType sh setlocal shiftwidth=4 tabstop=4 noexpandtab
autocmd FileType htm,html setlocal shiftwidth=2 tabstop=2 expandtab
autocmd FileType javascript,json setlocal shiftwidth=2 tabstop=2 expandtab
autocmd FileType py setlocal shiftwidth=4 tabstop=4 expandtab
autocmd FileType ruby setlocal shiftwidth=2 tabstop=2 expandtab
autocmd FileType bash setlocal shiftwidth=2 tabstop=2 expandtab
autocmd BufRead,BufNewFile *.vue setfiletype html
