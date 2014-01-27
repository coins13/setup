#!/usr/bin/env zsh
set -e
DEST=$HOME
REPOS=(vimrc emacs4newcomer)
notices=()

cd $DEST
[ ! -d .repos ] && mkdir .repos
cd .repos

for r in $REPOS; do
  [ ! -d $r ] && git clone https://github.com/coins13/$r.git
done

# NeoBundle
[ ! -d ~/.vim/bundle/neobundle.vim ] && \
    git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
notices+="* do 'vim -c NeoBundleInstall' before using vim"

# vimrc
cd vimrc
[ ! -h $DEST/.vimrc ] && ln -s $DEST/.repos/vimrc/vimrc $DEST/.vimrc
cd ..

# emacs4newcomer
cd emacs4newcomer
[ ! -h $DEST/.emacs.d ] && ln -s $DEST/.repos/emacs4newcomer $DEST/.emacs.d
cd ..

echo "🌟 Installation finished. Close this window or tab."
for l in $notices; do
  echo $l
done

sleep 12345

