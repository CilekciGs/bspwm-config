#! /bin/bash
elevate=sudo
if [ -e "/usr/bin/doas" ]; then
	elevate=doas
fi

echo "Please run the script in the repo folder"
echo "Are you sure that the required dependencies are installed?"
echo ""
cat deps.txt

function CreateIfNotExist
{
	if [ ! -d $1 ]; then
		mkdir $1
	fi
}

function elevateCreateIfNotExist
{
	if [ ! -d $1 ]; then
		$elevate mkdir $1
	fi
}

echo ""
echo "Starting in 5 Seconds"
sleep 5

echo "## Copying files ##" 
CreateIfNotExist ~/.config
cp -r ./Config/* ~/.config/
chmod +x ~/.config/bspwm/bspwmrc
chmod +x ~/.config/rofi/PowerMenu/powermenu.sh
chmod +x ~/.config/rofi/Brightness/brightness.sh
chmod +x ~/.config/rofi/Launcher/launcher.sh
chmod +x ~/.config/rofi/Volume/volume.sh
elevateCreateIfNotExist /usr/share/backgrounds
$elevate cp -r ./Wallpapers/* /usr/share/backgrounds/
$elevate cp lightdm-gtk-greeter.conf /etc/lightdm/lightdm-gtk-greeter.conf

echo "## Installing fonts ##"
CreateIfNotExist ~/.local
CreateIfNotExist ~/.local/share
CreateIfNotExist ~/.local/share/fonts
cp -r ./Fonts/* ~/.local/share/fonts/
fc-cache -fv

#echo "## Installing OhMyFish and Bobthefish theme ##"
#curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install | fish
#fish -c"omf install bobthefish"

echo "## Installing Kora icons ##"
git clone https://github.com/bikass/kora.git
cd kora
elevateCreateIfNotExist /usr/share/icons
$elevate cp -r ./Nordic-darker.tar.xz /usr/share/icons 
cd ..

echo "## Installing Nordic Theme ##"
wget https://github.com/EliverLara/Nordic/releases/download/v2.2.0/Nordic-darker.tar.xz
tar -xf ./Nordic-darker.tar.xz
elevateCreateIfNotExist /usr/share/themes
$elevate cp -r ./Nordic-darker /usr/share/themes

echo "Done! Now set themes with lxapperance!"
