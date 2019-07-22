#!/bin/env bash

mv -f ../colors/forest_night.vim ../colors/forest-night.vim
mv -f ../colors/forest_dusk.vim ../colors/forest-dusk.vim

sed -i\
    -re "s/let g:colors_name = 'forest_night'/let g:colors_name = 'forest-night'/"\
    ../colors/forest-night.vim
sed -i\
    -re "s/let g:colors_name = 'forest_dusk'/let g:colors_name = 'forest-dusk'/"\
    ../colors/forest-dusk.vim
