#!/bin/env bash

ROOT_DIR=$(git rev-parse --show-toplevel)

mv -f $ROOT_DIR/colors/forest_night.vim $ROOT_DIR/colors/forest-night.vim
mv -f $ROOT_DIR/colors/forest_dusk.vim $ROOT_DIR/colors/forest-dusk.vim

sed -i\
    -re "s/let g:colors_name = 'forest_night'/let g:colors_name = 'forest-night'/"\
    $ROOT_DIR/colors/forest-night.vim
sed -i\
    -re "s/let g:colors_name = 'forest_dusk'/let g:colors_name = 'forest-dusk'/"\
    $ROOT_DIR/colors/forest-dusk.vim
