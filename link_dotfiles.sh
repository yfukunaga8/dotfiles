#! /bin/bash

DOT_FILES=(.bashrc .bash_profile .vim* )

for file in ${DOT_FILES[@]}
do
    ln -fnsv $PWD/$file $HOME/$file
done

## own scripts 
chmod +x $PWD/myapps/*

