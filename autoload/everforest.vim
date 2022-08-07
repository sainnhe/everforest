" =============================================================================
" URL: https://github.com/sainnhe/everforest
" Filename: autoload/everforest.vim
" Author: sainnhe
" Email: i@sainnhe.dev
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
        \ 'sign_column_background': get(g:, 'everforest_sign_column_background', 'none'),
        \ 'spell_foreground': get(g:, 'everforest_spell_foreground', 'none'),
        \ 'ui_contrast': get(g:, 'everforest_ui_contrast', 'low'),
        \ 'show_eob': get(g:, 'everforest_show_eob', 1),
        \ 'current_word': get(g:, 'everforest_current_word', get(g:, 'everforest_transparent_background', 0) == 0 ? 'grey background' : 'bold'),
        \ 'lightline_disable_bold': get(g:, 'everforest_lightline_disable_bold', 0),
        \ 'diagnostic_text_highlight': get(g:, 'everforest_diagnostic_text_highlight', 0),
        \ 'diagnostic_line_highlight': get(g:, 'everforest_diagnostic_line_highlight', 0),
        \ 'diagnostic_virtual_text': get(g:, 'everforest_diagnostic_virtual_text', 'grey'),
        \ 'disable_terminal_colors': get(g:, 'everforest_disable_terminal_colors', 0),
        \ 'better_performance': get(g:, 'everforest_better_performance', 0),
        \ 'colors_override': get(g:, 'everforest_colors_override', {}),
        \ }
endfunction "}}}
function! everforest#get_palette(background, colors_override) "{{{
  if a:background ==# 'hard' "{{{
    if &background ==# 'dark'
      let palette1 = {
            \ 'bg0':        ['#2b3339',   '235'],
            \ 'bg1':        ['#323c41',   '236'],
            \ 'bg2':        ['#3a454a',   '237'],
            \ 'bg3':        ['#445055',   '238'],
            \ 'bg4':        ['#4c555b',   '239'],
            \ 'bg5':        ['#53605c',   '240'],
            \ 'bg_visual':  ['#503946',   '52'],
            \ 'bg_red':     ['#4e3e43',   '52'],
            \ 'bg_green':   ['#404d44',   '22'],
            \ 'bg_blue':    ['#394f5a',   '17'],
            \ 'bg_yellow':  ['#4a4940',   '136'],
            \ }
    else
      let palette1 = {
            \ 'bg0':        ['#fff9e8',   '230'],
            \ 'bg1':        ['#f7f4e0',   '228'],
            \ 'bg2':        ['#f0eed9',   '223'],
            \ 'bg3':        ['#e9e8d2',   '223'],
            \ 'bg4':        ['#e1ddcb',   '223'],
            \ 'bg5':        ['#bec5b2',   '223'],
            \ 'bg_visual':  ['#edf0cd',   '194'],
            \ 'bg_red':     ['#fce5dc',   '217'],
            \ 'bg_green':   ['#f1f3d4',   '194'],
            \ 'bg_blue':    ['#eaf2eb',   '117'],
            \ 'bg_yellow':  ['#fbefd0',   '226'],
            \ }
    endif "}}}
  elseif a:background ==# 'medium' "{{{
    if &background ==# 'dark'
      let palette1 = {
            \ 'bg0':        ['#2f383e',   '235'],
            \ 'bg1':        ['#374247',   '236'],
            \ 'bg2':        ['#404c51',   '237'],
            \ 'bg3':        ['#4a555b',   '238'],
            \ 'bg4':        ['#525c62',   '239'],
            \ 'bg5':        ['#596763',   '240'],
            \ 'bg_visual':  ['#573e4c',   '52'],
            \ 'bg_red':     ['#544247',   '52'],
            \ 'bg_green':   ['#445349',   '22'],
            \ 'bg_blue':    ['#3b5360',   '17'],
            \ 'bg_yellow':  ['#504f45',   '136'],
            \ }
    else
      let palette1 = {
            \ 'bg0':        ['#fdf6e3',   '230'],
            \ 'bg1':        ['#f3efda',   '228'],
            \ 'bg2':        ['#edead5',   '223'],
            \ 'bg3':        ['#e4e1cd',   '223'],
            \ 'bg4':        ['#dfdbc8',   '223'],
            \ 'bg5':        ['#bdc3af',   '223'],
            \ 'bg_visual':  ['#eaedc8',   '194'],
            \ 'bg_red':     ['#fbe3da',   '217'],
            \ 'bg_green':   ['#f0f1d2',   '194'],
            \ 'bg_blue':    ['#e9f0e9',   '117'],
            \ 'bg_yellow':  ['#faedcd',   '226'],
            \ }
    endif "}}}
  else "{{{
    if &background ==# 'dark'
      let palette1 = {
            \ 'bg0':        ['#323d43',   '235'],
            \ 'bg1':        ['#3c474d',   '236'],
            \ 'bg2':        ['#465258',   '237'],
            \ 'bg3':        ['#505a60',   '238'],
            \ 'bg4':        ['#576268',   '239'],
            \ 'bg5':        ['#5f6d67',   '240'],
            \ 'bg_visual':  ['#5d4251',   '52'],
            \ 'bg_red':     ['#59454b',   '52'],
            \ 'bg_green':   ['#48584d',   '22'],
            \ 'bg_blue':    ['#3d5665',   '17'],
            \ 'bg_yellow':  ['#55544a',   '136'],
            \ }
    else
      let palette1 = {
            \ 'bg0':        ['#f8f0dc',   '230'],
            \ 'bg1':        ['#efead4',   '228'],
            \ 'bg2':        ['#e9e5cf',   '223'],
            \ 'bg3':        ['#e1ddc9',   '223'],
            \ 'bg4':        ['#dcd8c4',   '223'],
            \ 'bg5':        ['#b9c0ab',   '223'],
            \ 'bg_visual':  ['#e6e9c4',   '194'],
            \ 'bg_red':     ['#f9e0d4',   '217'],
            \ 'bg_green':   ['#edeece',   '194'],
            \ 'bg_blue':    ['#e7ede5',   '117'],
            \ 'bg_yellow':  ['#f6e9c9',   '226'],
            \ }
    endif
  endif "}}}
  if &background ==# 'dark' "{{{
    let palette2 = {
          \ 'fg':         ['#d3c6aa',   '223'],
          \ 'red':        ['#e67e80',   '167'],
          \ 'orange':     ['#e69875',   '208'],
          \ 'yellow':     ['#dbbc7f',   '214'],
          \ 'green':      ['#a7c080',   '142'],
          \ 'aqua':       ['#83c092',   '108'],
          \ 'blue':       ['#7fbbb3',   '109'],
          \ 'purple':     ['#d699b6',   '175'],
          \ 'grey0':      ['#7a8478',   '243'],
          \ 'grey1':      ['#859289',   '245'],
          \ 'grey2':      ['#9da9a0',   '247'],
          \ 'statusline1':['#a7c080',   '142'],
          \ 'statusline2':['#d3c6aa',   '223'],
          \ 'statusline3':['#e67e80',   '167'],
          \ 'none':       ['NONE',      'NONE']
          \ } "}}}
  else "{{{
    let palette2 = {
          \ 'fg':         ['#5c6a72',   '242'],
          \ 'red':        ['#f85552',   '160'],
          \ 'orange':     ['#f57d26',   '116'],
          \ 'yellow':     ['#dfa000',   '136'],
          \ 'green':      ['#8da101',   '106'],
          \ 'aqua':       ['#35a77c',   '37'],
          \ 'blue':       ['#3a94c5',   '32'],
          \ 'purple':     ['#df69ba',   '162'],
          \ 'grey0':      ['#a6b0a0',   '247'],
          \ 'grey1':      ['#939f91',   '247'],
          \ 'grey2':      ['#829181',   '247'],
          \ 'statusline1':['#93b259',   '106'],
          \ 'statusline2':['#708089',   '242'],
          \ 'statusline3':['#e66868',   '160'],
          \ 'none':       ['NONE',      'NONE']
          \ }
  endif "}}}
  return extend(extend(palette1, palette2), a:colors_override)
endfunction "}}}
function! everforest#highlight(group, fg, bg, ...) "{{{
  execute 'highlight' a:group
        \ 'guifg=' . a:fg[0]
        \ 'guibg=' . a:bg[0]
        \ 'ctermfg=' . a:fg[1]
        \ 'ctermbg=' . a:bg[1]
        \ 'gui=' . (a:0 >= 1 ?
          \ a:1 :
          \ 'NONE')
        \ 'cterm=' . (a:0 >= 1 ?
          \ a:1 :
          \ 'NONE')
        \ 'guisp=' . (a:0 >= 2 ?
          \ a:2[0] :
          \ 'NONE')
endfunction "}}}
function! everforest#syn_gen(path, last_modified, msg) "{{{
  " Generate the `after/syntax` directory.
  let full_content = join(readfile(a:path), "\n") " Get the content of `colors/everforest.vim`
  let syn_conent = []
  let rootpath = everforest#syn_rootpath(a:path) " Get the path to place the `after/syntax` directory.
  call substitute(full_content, '" syn_begin.\{-}syn_end', '\=add(syn_conent, submatch(0))', 'g') " Search for 'syn_begin.\{-}syn_end' (non-greedy) and put all the search results into a list.
  for content in syn_conent
    let syn_list = []
    call substitute(matchstr(matchstr(content, 'syn_begin:.\{-}{{{'), ':.\{-}{{{'), '\(\w\|-\)\+', '\=add(syn_list, submatch(0))', 'g') " Get the file types. }}}}}}
    for syn in syn_list
      call everforest#syn_write(rootpath, syn, content) " Write the content.
    endfor
  endfor
  call everforest#syn_write(rootpath, 'text', "let g:everforest_last_modified = '" . a:last_modified . "'") " Write the last modified time to `after/syntax/text/everforest.vim`
  let syntax_relative_path = has('win32') ? '\after\syntax' : '/after/syntax'
  if a:msg ==# 'update'
    echohl WarningMsg | echom '[everforest] Updated ' . rootpath . syntax_relative_path | echohl None
    call everforest#ftplugin_detect(a:path)
  else
    echohl WarningMsg | echom '[everforest] Generated ' . rootpath . syntax_relative_path | echohl None
    execute 'set runtimepath+=' . fnamemodify(rootpath, ':p') . 'after'
  endif
endfunction "}}}
function! everforest#syn_write(rootpath, syn, content) "{{{
  " Write the content.
  let syn_path = a:rootpath . '/after/syntax/' . a:syn . '/everforest.vim' " The path of a syntax file.
  " create a new file if it doesn't exist
  if !filereadable(syn_path)
    call mkdir(a:rootpath . '/after/syntax/' . a:syn, 'p')
    call writefile([
          \ "if !exists('g:colors_name') || g:colors_name !=# 'everforest'",
          \ '    finish',
          \ 'endif'
          \ ], syn_path, 'a') " Abort if the current color scheme is not everforest.
    call writefile([
          \ "if index(g:everforest_loaded_file_types, '" . a:syn . "') ==# -1",
          \ "    call add(g:everforest_loaded_file_types, '" . a:syn . "')",
          \ 'else',
          \ '    finish',
          \ 'endif'
          \ ], syn_path, 'a') " Abort if this file type has already been loaded.
  endif
  " If there is something like `call everforest#highlight()`, then add
  " code to initialize the palette and configuration.
  if matchstr(a:content, 'everforest#highlight') !=# ''
    call writefile([
          \ 'let s:configuration = everforest#get_configuration()',
          \ 'let s:palette = everforest#get_palette(s:configuration.background, s:configuration.colors_override)'
          \ ], syn_path, 'a')
  endif
  " Append the content.
  call writefile(split(a:content, "\n"), syn_path, 'a')
  " Add modeline.
  call writefile(['" vim: set sw=2 ts=2 sts=2 et tw=80 ft=vim fdm=marker fmr={{{,}}}:'], syn_path, 'a')
endfunction "}}}
function! everforest#syn_rootpath(path) "{{{
  " Get the directory where `after/syntax` is generated.
  if (matchstr(a:path, '^/usr/share') ==# '') " Return the plugin directory. The `after/syntax` directory should never be generated in `/usr/share`, even if you are a root user.
    return fnamemodify(a:path, ':p:h:h')
  else " Use vim home directory.
    if has('nvim')
      return stdpath('config')
    else
      return expand('~') . '/.vim'
    endif
  endif
endfunction "}}}
function! everforest#syn_newest(path, last_modified) "{{{
  " Determine whether the current syntax files are up to date by comparing the last modified time in `colors/everforest.vim` and `after/syntax/text/everforest.vim`.
  let rootpath = everforest#syn_rootpath(a:path)
  execute 'source ' . rootpath . '/after/syntax/text/everforest.vim'
  return a:last_modified ==# g:everforest_last_modified ? 1 : 0
endfunction "}}}
function! everforest#syn_clean(path, msg) "{{{
  " Clean the `after/syntax` directory.
  let rootpath = everforest#syn_rootpath(a:path)
  " Remove `after/syntax/**/everforest.vim`.
  let file_list = split(globpath(rootpath, 'after/syntax/**/everforest.vim'), "\n")
  for file in file_list
    call delete(file)
  endfor
  " Remove empty directories.
  let dir_list = split(globpath(rootpath, 'after/syntax/*'), "\n")
  for dir in dir_list
    if globpath(dir, '*') ==# ''
      call delete(dir, 'd')
    endif
  endfor
  if globpath(rootpath . '/after/syntax', '*') ==# ''
    call delete(rootpath . '/after/syntax', 'd')
  endif
  if globpath(rootpath . '/after', '*') ==# ''
    call delete(rootpath . '/after', 'd')
  endif
  if a:msg
    let syntax_relative_path = has('win32') ? '\after\syntax' : '/after/syntax'
    echohl WarningMsg | echom '[everforest] Cleaned ' . rootpath . syntax_relative_path | echohl None
  endif
endfunction "}}}
function! everforest#syn_exists(path) "{{{
  return filereadable(everforest#syn_rootpath(a:path) . '/after/syntax/text/everforest.vim')
endfunction "}}}
function! everforest#ftplugin_detect(path) "{{{
  " Check if /after/ftplugin exists.
  " This directory is generated in earlier versions, users may need to manually clean it.
  let rootpath = everforest#syn_rootpath(a:path)
  if filereadable(everforest#syn_rootpath(a:path) . '/after/ftplugin/text/everforest.vim')
    let ftplugin_relative_path = has('win32') ? '\after\ftplugin' : '/after/ftplugin'
    echohl WarningMsg | echom '[everforest] Detected ' . rootpath . ftplugin_relative_path | echohl None
    echohl WarningMsg | echom '[everforest] This directory is no longer used, you may need to manually delete it.' | echohl None
  endif
endfunction "}}}

" vim: set sw=2 ts=2 sts=2 et tw=80 ft=vim fdm=marker fmr={{{,}}}:
