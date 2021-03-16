" =============================================================================
" URL: https://github.com/sainnhe/forest-night
" Filename: autoload/forest_night.vim
" Author: sainnhe
" Email: sainnhe@gmail.com
" License: MIT License
" =============================================================================

function! forest_night#get_configuration() "{{{
  return {
        \ 'background': get(g:, 'forest_night_background', 'medium'),
        \ 'transparent_background': get(g:, 'forest_night_transparent_background', 0),
        \ 'disable_italic_comment': get(g:, 'forest_night_disable_italic_comment', 0),
        \ 'enable_italic': get(g:, 'forest_night_enable_italic', 0),
        \ 'cursor': get(g:, 'forest_night_cursor', 'auto'),
        \ 'menu_selection_background': get(g:, 'forest_night_menu_selection_background', 'white'),
        \ 'sign_column_background': get(g:, 'forest_night_sign_column_background', 'default'),
        \ 'current_word': get(g:, 'forest_night_current_word', get(g:, 'forest_night_transparent_background', 0) == 0 ? 'grey background' : 'bold'),
        \ 'lightline_disable_bold': get(g:, 'forest_night_lightline_disable_bold', 0),
        \ 'diagnostic_text_highlight': get(g:, 'forest_night_diagnostic_text_highlight', 0),
        \ 'diagnostic_line_highlight': get(g:, 'forest_night_diagnostic_line_highlight', 0),
        \ 'better_performance': get(g:, 'forest_night_better_performance', 0),
        \ }
endfunction "}}}
function! forest_night#get_palette(background) "{{{
  if a:background ==# 'hard' "{{{
    if &background ==# 'dark'
      let palette1 = {
            \ 'bg0':        ['#2b353b',   '235',  'Black'],
            \ 'bg1':        ['#323d43',   '236',  'DarkGrey'],
            \ 'bg2':        ['#3c474d',   '237',  'DarkGrey'],
            \ 'bg3':        ['#465258',   '238',  'DarkGrey'],
            \ 'bg4':        ['#505a60',   '239',  'DarkGrey'],
            \ 'bg_visual':  ['#553b4a',   '52',   'DarkRed'],
            \ 'bg_red':     ['#564349',   '52',   'DarkRed'],
            \ 'bg_green':   ['#46554a',   '22',   'DarkGreen'],
            \ 'bg_blue':    ['#3a5462',   '17',   'DarkBlue'],
            \ 'bg_yellow':  ['#525147',   '136',  'DarkBlue'],
            \ }
    else
      let palette1 = {
            \ 'bg0':        ['#fff9e8',   '230',  'Black'],
            \ 'bg1':        ['#f7f2e0',   '228',  'DarkGrey'],
            \ 'bg2':        ['#f0eed9',   '223',  'DarkGrey'],
            \ 'bg3':        ['#e9e8d2',   '223',  'DarkGrey'],
            \ 'bg4':        ['#e1ddcb',   '223',  'DarkGrey'],
            \ 'bg_visual':  ['#edf0cd',   '194',  'DarkRed'],
            \ 'bg_red':     ['#ffdcdc',   '217',  'DarkRed'],
            \ 'bg_green':   ['#e7efcc',   '194',  'DarkGreen'],
            \ 'bg_blue':    ['#e1eef1',   '117',  'DarkBlue'],
            \ 'bg_yellow':  ['#fcecc5',   '226',  'DarkBlue'],
            \ }
    endif "}}}
  elseif a:background ==# 'medium' "{{{
    if &background ==# 'dark'
      let palette1 = {
            \ 'bg0':        ['#2f393f',   '235',  'Black'],
            \ 'bg1':        ['#374248',   '236',  'DarkGrey'],
            \ 'bg2':        ['#414d53',   '237',  'DarkGrey'],
            \ 'bg3':        ['#4b565c',   '238',  'DarkGrey'],
            \ 'bg4':        ['#545e64',   '239',  'DarkGrey'],
            \ 'bg_visual':  ['#593f4e',   '52',   'DarkRed'],
            \ 'bg_red':     ['#5a464c',   '52',   'DarkRed'],
            \ 'bg_green':   ['#49594e',   '22',   'DarkGreen'],
            \ 'bg_blue':    ['#3d5766',   '17',   'DarkBlue'],
            \ 'bg_yellow':  ['#56554b',   '136',  'DarkBlue'],
            \ }
    else
      let palette1 = {
            \ 'bg0':        ['#fdf6e3',   '230',  'Black'],
            \ 'bg1':        ['#f3efda',   '228',  'DarkGrey'],
            \ 'bg2':        ['#edead5',   '223',  'DarkGrey'],
            \ 'bg3':        ['#e4e1cd',   '223',  'DarkGrey'],
            \ 'bg4':        ['#dfdbc8',   '223',  'DarkGrey'],
            \ 'bg_visual':  ['#eaedc8',   '194',  'DarkRed'],
            \ 'bg_red':     ['#ffdcdc',   '217',  'DarkRed'],
            \ 'bg_green':   ['#e7efcc',   '194',  'DarkGreen'],
            \ 'bg_blue':    ['#e1eef1',   '117',  'DarkBlue'],
            \ 'bg_yellow':  ['#fcecc5',   '226',  'DarkBlue'],
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
            \ 'bg_red':     ['#5e494f',   '52',   'DarkRed'],
            \ 'bg_green':   ['#4c5d51',   '22',   'DarkGreen'],
            \ 'bg_blue':    ['#3f5a6a',   '17',   'DarkBlue'],
            \ 'bg_yellow':  ['#5a594e',   '136',  'DarkBlue'],
            \ }
    else
      let palette1 = {
            \ 'bg0':        ['#f8f1de',   '230',  'Black'],
            \ 'bg1':        ['#eeead5',   '228',  'DarkGrey'],
            \ 'bg2':        ['#e9e5d1',   '223',  'DarkGrey'],
            \ 'bg3':        ['#e1ddcb',   '223',  'DarkGrey'],
            \ 'bg4':        ['#dcd8c6',   '223',  'DarkGrey'],
            \ 'bg_visual':  ['#e6e9c4',   '194',  'DarkRed'],
            \ 'bg_red':     ['#ffdcdc',   '217',  'DarkRed'],
            \ 'bg_green':   ['#e7efcc',   '194',  'DarkGreen'],
            \ 'bg_blue':    ['#e1eef1',   '117',  'DarkBlue'],
            \ 'bg_yellow':  ['#fcecc5',   '226',  'DarkBlue'],
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
          \ 'green':      ['#8fa401',   '106',  'Green'],
          \ 'aqua':       ['#36aa7e',   '37',   'Cyan'],
          \ 'blue':       ['#3b96c8',   '32',   'Blue'],
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
function! forest_night#highlight(group, fg, bg, ...) "{{{
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
function! forest_night#ft_gen(path, last_modified, msg) "{{{
  " Generate the `after/ftplugin` directory.
  let full_content = join(readfile(a:path), "\n") " Get the content of `colors/forest-night.vim`
  let ft_content = []
  let rootpath = forest_night#ft_rootpath(a:path) " Get the path to place the `after/ftplugin` directory.
  call substitute(full_content, '" ft_begin.\{-}ft_end', '\=add(ft_content, submatch(0))', 'g') " Search for 'ft_begin.\{-}ft_end' (non-greedy) and put all the search results into a list.
  for content in ft_content
    let ft_list = []
    call substitute(matchstr(matchstr(content, 'ft_begin:.\{-}{{{'), ':.\{-}{{{'), '\(\w\|-\)\+', '\=add(ft_list, submatch(0))', 'g') " Get the file types. }}}}}}
    for ft in ft_list
      call forest_night#ft_write(rootpath, ft, content) " Write the content.
    endfor
  endfor
  call forest_night#ft_write(rootpath, 'text', "let g:forest_night_last_modified = '" . a:last_modified . "'") " Write the last modified time to `after/ftplugin/text/forest_night.vim`
  if a:msg ==# 'update'
    echohl WarningMsg | echom '[forest-night] Updated ' . rootpath . '/after/ftplugin' | echohl None
  else
    echohl WarningMsg | echom '[forest-night] Generated ' . rootpath . '/after/ftplugin' | echohl None
  endif
endfunction "}}}
function! forest_night#ft_write(rootpath, ft, content) "{{{
  " Write the content.
  let ft_path = a:rootpath . '/after/ftplugin/' . a:ft . '/forest_night.vim' " The path of a ftplugin file.
  " create a new file if it doesn't exist
  if !filereadable(ft_path)
    call mkdir(a:rootpath . '/after/ftplugin/' . a:ft, 'p')
    call writefile([
          \ "if !exists('g:colors_name') || g:colors_name !=# 'forest-night'",
          \ '    finish',
          \ 'endif'
          \ ], ft_path, 'a') " Abort if the current color scheme is not forest-night.
    call writefile([
          \ "if index(g:forest_night_loaded_file_types, '" . a:ft . "') ==# -1",
          \ "    call add(g:forest_night_loaded_file_types, '" . a:ft . "')",
          \ 'else',
          \ '    finish',
          \ 'endif'
          \ ], ft_path, 'a') " Abort if this file type has already been loaded.
  endif
  " If there is something like `call forest_night#highlight()`, then add
  " code to initialize the palette and configuration.
  if matchstr(a:content, 'forest_night#highlight') !=# ''
    call writefile([
          \ 'let s:configuration = forest_night#get_configuration()',
          \ 'let s:palette = forest_night#get_palette(s:configuration.background)'
          \ ], ft_path, 'a')
  endif
  " Append the content.
  call writefile(split(a:content, "\n"), ft_path, 'a')
endfunction "}}}
function! forest_night#ft_rootpath(path) "{{{
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
function! forest_night#ft_newest(path, last_modified) "{{{
  " Determine whether the current ftplugin files are up to date by comparing the last modified time in `colors/forest-night.vim` and `after/ftplugin/text/forest_night.vim`.
  let rootpath = forest_night#ft_rootpath(a:path)
  execute 'source ' . rootpath . '/after/ftplugin/text/forest_night.vim'
  return a:last_modified ==# g:forest_night_last_modified ? 1 : 0
endfunction "}}}
function! forest_night#ft_clean(path, msg) "{{{
  " Clean the `after/ftplugin` directory.
  let rootpath = forest_night#ft_rootpath(a:path)
  " Remove `after/ftplugin/**/forest_night.vim`.
  let file_list = split(globpath(rootpath, 'after/ftplugin/**/forest_night.vim'), "\n")
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
    echohl WarningMsg | echom '[forest-night] Cleaned ' . rootpath . '/after/ftplugin' | echohl None
  endif
endfunction "}}}
function! forest_night#ft_exists(path) "{{{
  return filereadable(forest_night#ft_rootpath(a:path) . '/after/ftplugin/text/forest_night.vim')
endfunction "}}}

" vim: set sw=2 ts=2 sts=2 et tw=80 ft=vim fdm=marker fmr={{{,}}}:
