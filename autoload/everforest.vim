" =============================================================================
" URL: https://github.com/sainnhe/everforest
" Filename: autoload/everforest.vim
" Author: sainnhe
" Email: sainnhe@gmail.com
" License: MIT License
" =============================================================================

function! everforest#get_configuration() "{{{
  return {
        \ 'background': get(g:, 'everforest_background', 'medium'),
        \ 'transparent_background': get(g:, 'everforest_transparent_background', 0),
        \ 'disable_italic_comment': get(g:, 'everforest_disable_italic_comment', 0),
        \ 'enable_italic': get(g:, 'everforest_enable_italic', 0),
        \ 'cursor': get(g:, 'everforest_cursor', 'auto'),
        \ 'menu_selection_background': get(g:, 'everforest_menu_selection_background', 'white'),
        \ 'sign_column_background': get(g:, 'everforest_sign_column_background', 'default'),
        \ 'current_word': get(g:, 'everforest_current_word', get(g:, 'everforest_transparent_background', 0) == 0 ? 'grey background' : 'bold'),
        \ 'lightline_disable_bold': get(g:, 'everforest_lightline_disable_bold', 0),
        \ 'diagnostic_text_highlight': get(g:, 'everforest_diagnostic_text_highlight', 0),
        \ 'diagnostic_line_highlight': get(g:, 'everforest_diagnostic_line_highlight', 0),
        \ 'diagnostic_virtual_text': get(g:, 'everforest_diagnostic_virtual_text', 'grey'),
        \ 'better_performance': get(g:, 'everforest_better_performance', 0),
        \ }
endfunction "}}}
function! everforest#get_palette(background) "{{{
  if a:background ==# 'hard' "{{{
    if &background ==# 'dark'
      let palette1 = {
            \ 'bg0':        ['#2b3339',   '235',  'Black'],
            \ 'bg1':        ['#323c41',   '236',  'DarkGrey'],
            \ 'bg2':        ['#3a454a',   '237',  'DarkGrey'],
            \ 'bg3':        ['#445055',   '238',  'DarkGrey'],
            \ 'bg4':        ['#4c555b',   '239',  'DarkGrey'],
            \ 'bg_visual':  ['#503946',   '52',   'DarkRed'],
            \ 'bg_red':     ['#4e3e43',   '52',   'DarkRed'],
            \ 'bg_green':   ['#404d44',   '22',   'DarkGreen'],
            \ 'bg_blue':    ['#394f5a',   '17',   'DarkBlue'],
            \ 'bg_yellow':  ['#4a4940',   '136',  'DarkBlue'],
            \ }
    else
      let palette1 = {
            \ 'bg0':        ['#fff9e8',   '230',  'Black'],
            \ 'bg1':        ['#f7f2e0',   '228',  'DarkGrey'],
            \ 'bg2':        ['#f0eed9',   '223',  'DarkGrey'],
            \ 'bg3':        ['#e9e8d2',   '223',  'DarkGrey'],
            \ 'bg4':        ['#e1ddcb',   '223',  'DarkGrey'],
            \ 'bg_visual':  ['#edf0cd',   '194',  'DarkRed'],
            \ 'bg_red':     ['#fce5dc',   '217',  'DarkRed'],
            \ 'bg_green':   ['#f1f3d4',   '194',  'DarkGreen'],
            \ 'bg_blue':    ['#eaf2eb',   '117',  'DarkBlue'],
            \ 'bg_yellow':  ['#fbefd0',   '226',  'DarkBlue'],
            \ }
    endif "}}}
  elseif a:background ==# 'medium' "{{{
    if &background ==# 'dark'
      let palette1 = {
            \ 'bg0':        ['#2f383e',   '235',  'Black'],
            \ 'bg1':        ['#374247',   '236',  'DarkGrey'],
            \ 'bg2':        ['#404c51',   '237',  'DarkGrey'],
            \ 'bg3':        ['#4a555b',   '238',  'DarkGrey'],
            \ 'bg4':        ['#525c62',   '239',  'DarkGrey'],
            \ 'bg_visual':  ['#573e4c',   '52',   'DarkRed'],
            \ 'bg_red':     ['#544247',   '52',   'DarkRed'],
            \ 'bg_green':   ['#445349',   '22',   'DarkGreen'],
            \ 'bg_blue':    ['#3b5360',   '17',   'DarkBlue'],
            \ 'bg_yellow':  ['#504f45',   '136',  'DarkBlue'],
            \ }
    else
      let palette1 = {
            \ 'bg0':        ['#fdf6e3',   '230',  'Black'],
            \ 'bg1':        ['#f3efda',   '228',  'DarkGrey'],
            \ 'bg2':        ['#edead5',   '223',  'DarkGrey'],
            \ 'bg3':        ['#e4e1cd',   '223',  'DarkGrey'],
            \ 'bg4':        ['#dfdbc8',   '223',  'DarkGrey'],
            \ 'bg_visual':  ['#eaedc8',   '194',  'DarkRed'],
            \ 'bg_red':     ['#fbe3da',   '217',  'DarkRed'],
            \ 'bg_green':   ['#f0f1d2',   '194',  'DarkGreen'],
            \ 'bg_blue':    ['#e9f0e9',   '117',  'DarkBlue'],
            \ 'bg_yellow':  ['#faedcd',   '226',  'DarkBlue'],
            \ }
    endif "}}}
  elseif a:background ==# 'soft' "{{{
    if &background ==# 'dark'
      let palette1 = {
            \ 'bg0':        ['#323d43',   '235',  'Black'],
            \ 'bg1':        ['#3c474d',   '236',  'DarkGrey'],
            \ 'bg2':        ['#465258',   '237',  'DarkGrey'],
            \ 'bg3':        ['#505a60',   '238',  'DarkGrey'],
            \ 'bg4':        ['#576268',   '239',  'DarkGrey'],
            \ 'bg_visual':  ['#5d4251',   '52',   'DarkRed'],
            \ 'bg_red':     ['#59454b',   '52',   'DarkRed'],
            \ 'bg_green':   ['#48584d',   '22',   'DarkGreen'],
            \ 'bg_blue':    ['#3d5665',   '17',   'DarkBlue'],
            \ 'bg_yellow':  ['#55544a',   '136',  'DarkBlue'],
            \ }
    else
      let palette1 = {
            \ 'bg0':        ['#f8f0dc',   '230',  'Black'],
            \ 'bg1':        ['#efead4',   '228',  'DarkGrey'],
            \ 'bg2':        ['#e9e5cf',   '223',  'DarkGrey'],
            \ 'bg3':        ['#e1ddc9',   '223',  'DarkGrey'],
            \ 'bg4':        ['#dcd8c4',   '223',  'DarkGrey'],
            \ 'bg_visual':  ['#e6e9c4',   '194',  'DarkRed'],
            \ 'bg_red':     ['#f9e0d4',   '217',  'DarkRed'],
            \ 'bg_green':   ['#edeece',   '194',  'DarkGreen'],
            \ 'bg_blue':    ['#e7ede5',   '117',  'DarkBlue'],
            \ 'bg_yellow':  ['#f6e9c9',   '226',  'DarkBlue'],
            \ }
    endif
  endif "}}}
  if &background ==# 'dark' "{{{
    let palette2 = {
          \ 'fg':         ['#d3c6aa',   '223',  'White'],
          \ 'red':        ['#e67e80',   '167',  'Red'],
          \ 'orange':     ['#e69875',   '208',  'Red'],
          \ 'yellow':     ['#dbbc7f',   '214',  'Yellow'],
          \ 'green':      ['#a7c080',   '142',  'Green'],
          \ 'aqua':       ['#83c092',   '108',  'Cyan'],
          \ 'blue':       ['#7fbbb3',   '109',  'Blue'],
          \ 'purple':     ['#d699b6',   '175',  'Magenta'],
          \ 'grey0':      ['#7c8377',   '243',  'DarkGrey'],
          \ 'grey1':      ['#868d80',   '245',  'Grey'],
          \ 'grey2':      ['#999f93',   '247',  'LightGrey'],
          \ 'statusline1':['#a7c080',   '142',  'Green'],
          \ 'statusline2':['#d3c6aa',   '223',  'White'],
          \ 'statusline3':['#e67e80',   '167',  'Red'],
          \ 'none':       ['NONE',      'NONE', 'NONE']
          \ } "}}}
  else "{{{
    let palette2 = {
          \ 'fg':         ['#5c6a72',   '242',  'White'],
          \ 'red':        ['#f85552',   '160',  'Red'],
          \ 'orange':     ['#f57d26',   '116',  'Red'],
          \ 'yellow':     ['#dfa000',   '136',  'Yellow'],
          \ 'green':      ['#8da101',   '106',  'Green'],
          \ 'aqua':       ['#35a77c',   '37',   'Cyan'],
          \ 'blue':       ['#3a94c5',   '32',   'Blue'],
          \ 'purple':     ['#df69ba',   '162',  'Magenta'],
          \ 'grey0':      ['#a0a79a',   '247',  'DarkGrey'],
          \ 'grey1':      ['#999f93',   '247',  'Grey'],
          \ 'grey2':      ['#92978c',   '247',  'LightGrey'],
          \ 'statusline1':['#93b259',   '106',  'Green'],
          \ 'statusline2':['#708089',   '242',  'White'],
          \ 'statusline3':['#e66868',   '160',  'Red'],
          \ 'none':       ['NONE',      'NONE', 'NONE']
          \ }
  endif "}}}
  return extend(palette1, palette2)
endfunction "}}}
function! everforest#highlight(group, fg, bg, ...) "{{{
  execute 'highlight' a:group
        \ 'guifg=' . a:fg[0]
        \ 'guibg=' . a:bg[0]
        \ 'ctermfg=' . a:fg[1]
        \ 'ctermbg=' . a:bg[1]
        \ 'gui=' . (a:0 >= 1 ?
          \ (a:1 ==# 'undercurl' ?
            \ (executable('tmux') && $TMUX !=# '' ?
              \ 'underline' :
              \ 'undercurl') :
            \ a:1) :
          \ 'NONE')
        \ 'cterm=' . (a:0 >= 1 ?
          \ (a:1 ==# 'undercurl' ?
            \ 'underline' :
            \ a:1) :
          \ 'NONE')
        \ 'guisp=' . (a:0 >= 2 ?
          \ a:2[0] :
          \ 'NONE')
endfunction "}}}
function! everforest#ft_gen(path, last_modified, msg) "{{{
  " Generate the `after/ftplugin` directory.
  let full_content = join(readfile(a:path), "\n") " Get the content of `colors/everforest.vim`
  let ft_content = []
  let rootpath = everforest#ft_rootpath(a:path) " Get the path to place the `after/ftplugin` directory.
  call substitute(full_content, '" ft_begin.\{-}ft_end', '\=add(ft_content, submatch(0))', 'g') " Search for 'ft_begin.\{-}ft_end' (non-greedy) and put all the search results into a list.
  for content in ft_content
    let ft_list = []
    call substitute(matchstr(matchstr(content, 'ft_begin:.\{-}{{{'), ':.\{-}{{{'), '\(\w\|-\)\+', '\=add(ft_list, submatch(0))', 'g') " Get the file types. }}}}}}
    for ft in ft_list
      call everforest#ft_write(rootpath, ft, content) " Write the content.
    endfor
  endfor
  call everforest#ft_write(rootpath, 'text', "let g:everforest_last_modified = '" . a:last_modified . "'") " Write the last modified time to `after/ftplugin/text/everforest.vim`
  if a:msg ==# 'update'
    echohl WarningMsg | echom '[everforest] Updated ' . rootpath . '/after/ftplugin' | echohl None
  else
    echohl WarningMsg | echom '[everforest] Generated ' . rootpath . '/after/ftplugin' | echohl None
  endif
endfunction "}}}
function! everforest#ft_write(rootpath, ft, content) "{{{
  " Write the content.
  let ft_path = a:rootpath . '/after/ftplugin/' . a:ft . '/everforest.vim' " The path of a ftplugin file.
  " create a new file if it doesn't exist
  if !filereadable(ft_path)
    call mkdir(a:rootpath . '/after/ftplugin/' . a:ft, 'p')
    call writefile([
          \ "if !exists('g:colors_name') || g:colors_name !=# 'everforest'",
          \ '    finish',
          \ 'endif'
          \ ], ft_path, 'a') " Abort if the current color scheme is not everforest.
    call writefile([
          \ "if index(g:everforest_loaded_file_types, '" . a:ft . "') ==# -1",
          \ "    call add(g:everforest_loaded_file_types, '" . a:ft . "')",
          \ 'else',
          \ '    finish',
          \ 'endif'
          \ ], ft_path, 'a') " Abort if this file type has already been loaded.
  endif
  " If there is something like `call everforest#highlight()`, then add
  " code to initialize the palette and configuration.
  if matchstr(a:content, 'everforest#highlight') !=# ''
    call writefile([
          \ 'let s:configuration = everforest#get_configuration()',
          \ 'let s:palette = everforest#get_palette(s:configuration.background)'
          \ ], ft_path, 'a')
  endif
  " Append the content.
  call writefile(split(a:content, "\n"), ft_path, 'a')
endfunction "}}}
function! everforest#ft_rootpath(path) "{{{
  " Get the directory where `after/ftplugin` is generated.
  if (matchstr(a:path, '^/usr/share') ==# '') || has('win32') " Return the plugin directory. The `after/ftplugin` directory should never be generated in `/usr/share`, even if you are a root user.
    return fnamemodify(a:path, ':p:h:h')
  else " Use vim home directory.
    if has('nvim')
      return stdpath('config')
    else
      if has('win32') || has ('win64')
        return $VIM . '/vimfiles'
      else
        return $HOME . '/.vim'
      endif
    endif
  endif
endfunction "}}}
function! everforest#ft_newest(path, last_modified) "{{{
  " Determine whether the current ftplugin files are up to date by comparing the last modified time in `colors/everforest.vim` and `after/ftplugin/text/everforest.vim`.
  let rootpath = everforest#ft_rootpath(a:path)
  execute 'source ' . rootpath . '/after/ftplugin/text/everforest.vim'
  return a:last_modified ==# g:everforest_last_modified ? 1 : 0
endfunction "}}}
function! everforest#ft_clean(path, msg) "{{{
  " Clean the `after/ftplugin` directory.
  let rootpath = everforest#ft_rootpath(a:path)
  " Remove `after/ftplugin/**/everforest.vim`.
  let file_list = split(globpath(rootpath, 'after/ftplugin/**/everforest.vim'), "\n")
  for file in file_list
    call delete(file)
  endfor
  " Remove empty directories.
  let dir_list = split(globpath(rootpath, 'after/ftplugin/*'), "\n")
  for dir in dir_list
    if globpath(dir, '*') ==# ''
      call delete(dir, 'd')
    endif
  endfor
  if globpath(rootpath . '/after/ftplugin', '*') ==# ''
    call delete(rootpath . '/after/ftplugin', 'd')
  endif
  if globpath(rootpath . '/after', '*') ==# ''
    call delete(rootpath . '/after', 'd')
  endif
  if a:msg
    echohl WarningMsg | echom '[everforest] Cleaned ' . rootpath . '/after/ftplugin' | echohl None
  endif
endfunction "}}}
function! everforest#ft_exists(path) "{{{
  return filereadable(everforest#ft_rootpath(a:path) . '/after/ftplugin/text/everforest.vim')
endfunction "}}}

" vim: set sw=2 ts=2 sts=2 et tw=80 ft=vim fdm=marker fmr={{{,}}}:
