#! /bin/bash
echo "Please run the script in the repo folder"
echo "Are you sure that the required dependencies are installed?"
echo ""
cat deps.txt

echo ""
echo "Starting in 5 Seconds"
sleep 5

echo "## Copying files ##" 
mkdir ~/.config
cp -r ./Config/* ~/.config/
chmod +x ~/.config/bspwm/bspwmrc
chmod +x ~/.config/rofi/PowerMenu/powermenu.sh
chmod +x ~/.config/rofi/Brightness/brightness.sh
chmod +x ~/.config/rofi/Launcher/launcher.sh
chmod +x ~/.config/rofi/Volume/volume.sh
doas mkdir /usr/share/backgrounds
doas cp -r ./Wallpapers/* /usr/share/backgrounds/
doas cp lightdm-gtk-greeter.conf /etc/lightdm/lightdm-gtk-greeter.conf

echo "## Installing fonts ##"
mkdir ~/.local
mkdir ~/.local/share
mkdir ~/.local/share/fonts
cp -r ./Fonts/* ~/.local/share/fonts/
fc-cache -fv

#echo "## Installing OhMyFish and Bobthefish theme ##"
#curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install | fish
#fish -c"omf install bobthefish"

echo "## Installing Kora icons ##"
git clone https://github.com/bikass/kora.git
cd kora
mkdir /usr/share/icons
doas cp -r ./Nordic-darker.tar.xz /usr/share/icons 
cd ..

echo "## Installing Nordic Theme ##"
wget https://github.com/EliverLara/Nordic/releases/download/v2.2.0/Nordic-darker.tar.xz
tar -xf ./Nordic-darker.tar.xz
mkdir /usr/share/themes
doas cp -r ./Nordic-darker /usr/share/themes

echo "Done! Now set themes with lxapperance!"
