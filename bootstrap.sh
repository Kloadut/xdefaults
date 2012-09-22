#!/usr/bin/env sh

endpath="$HOME/.kload-xdefaults"

warn() {
    echo "$1" >&2
}

die() {
    warn "$1"
    exit 1
}

# Backup existing .vim stuff
echo "backing up current kload config\n"
today=`date +%Y%m%d`
for i in $HOME/.Xdefaults $HOME/.fonts/Monaco_Linux-Powerline.ttf $endpath; do [ -e $i ] && mv $i $i.$today; done


echo "cloning kload-xdefaults\n"
git clone --recursive http://github.com/Kloadut/xdefaults.git $endpath
ln -s $endpath/.Xdefaults $HOME/.Xdefaults
cp $endpath/Monaco_Linux-Powerline.ttf $HOME/.fonts/

echo "clearing font cache\n"
fc-cache -vf

echo "Done\n"
