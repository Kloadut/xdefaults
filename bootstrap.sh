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
for i in $HOME/.Xdefaults $HOME/.fonts/Monaco_Linux-Powerline.ttf; do [ -e $i ] && mv $i $i.$today; done


echo "cloning kload-vim\n"
git clone --recursive -b 3.0 http://github.com/Kloadut/xdefaults.git $endpath
ln -s $endpath/.Xdefaults $HOME/.Xdefaults
cp $endpath/Monaco_Linux-Powerline.ttf $HOME/.fonts/

echo "Clearing font cache\n"
fc-cache -vf

echo "Done\n"
