#!/bin/env bash

ROOT_DIR=$(git rev-parse --show-toplevel)

mv -f $ROOT_DIR/colors/forest_night.vim $ROOT_DIR/colors/forest-night.vim

sed -ri\
    -e "s/let g:colors_name = 'forest_night'/let g:colors_name = 'forest-night'/"\
    $ROOT_DIR/colors/forest-night.vim
