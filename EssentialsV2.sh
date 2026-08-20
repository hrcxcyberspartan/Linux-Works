echo "HEXA RANGE CYBER"
echo "Debian Apps install - only works properly with debian and debian based distros"
echo "Please run in user home directory"
 
sudo dpkg --add-achitecture i386
sudo apt update && sudo apt upgrade -y
sudo apt install htop screenfetch cmatrix figlet cowsay git wget curl axel sed xsel tmux nano vim papirus-icon-theme stacer remmina -y
sudo apt install qbittorrent transmission -y

figlet "Flatpak"
sudo apt install -y flatpak
sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
sudo apt install gnome-software-plugin-flatpak -y
flatpak install flathub com.github.tchx84.Flatseal -y
flatpak install flathub io.github.flattool.Warehouse -y

figlet "Browsers"
sudo install -d -m 0755 /etc/apt/keyrings 
wget -q https://packages.mozilla.org/apt/repo-signing-key.gpg -O- | sudo tee /etc/apt/keyrings/packages.mozilla.org.asc > /dev/null
gpg -n -q --import --import-options import-show /etc/apt/keyrings/packages.mozilla.org.asc | awk '/pub/{getline; gsub(/^ +| +$/,""); if($0 == "35BAA0B33E9EB396F59CA838C0BA5CE6DC6315A3") print "\nThe key fingerprint matches ("$0").\n"; else print "\nVerification failed: the fingerprint ("$0") does not match the expected one.\n"}'
echo "deb [signed-by=/etc/apt/keyrings/packages.mozilla.org.asc] https://packages.mozilla.org/apt mozilla main" | sudo tee -a /etc/apt/sources.list.d/mozilla.list > /dev/null
echo '
Package: *
Pin: origin packages.mozilla.org
Pin-Priority: 1000
' | sudo tee /etc/apt/preferences.d/mozilla 
sudo apt-get update && sudo apt-get install firefox-devedition -y
sudo apt install torbrowser-launcher -y
sudo apt install chromium -y
flatpak install flathub com.brave.Browser -y
sudo apt update && sudo apt upgrade -y

figlet "Office"
figlet "Office and MS-fonts"
sudo apt install libreoffice -y 
sudo apt install ttf-mscorefonts-installer -y
mkdir .fonts
wget -qO- http://plasmasturm.org/code/vistafonts-installer/vistafonts-installer | bash
sudo apt install atril -y
flatpak install flathub org.onlyoffice.desktopeditors -y
flatpak install flathub net.cozic.joplin_desktop -y
flatpak install flathub net.giuspen.cherrytree -y
flatpak install flathub org.mozilla.Thunderbird -y

figlet "Virtual-Machines"
sudo apt install virtualbox virtualbox-dkms virtualbox-ext-pack virtualbox-guest-utils -y
sudo apt install qemu-system libvirt-daemon-system
sudo adduser $USER libvirt
sudo apt install virt-manager

figlet "Games"
sudo apt install wine wine32 wine64
flatpak install flathub net.lutris.Lutris -y
flatpak install flathub com.mojang.Minecraft -y
flatpak install flathub org.gnome.Sudoku -y
flatpak install flathub com.github.k4zmu2a.spacecadetpinball -y
flatpak install flathub org.gnome.Chess -y
sudo apt install aisleriot -y

figlet "Media-Player"
sudo apt install vlc rhythmbox -y
flatpak install flathub io.freetubeapp.FreeTube -y

figlet "Antivirus"
sudo apt install clamav -y
sudo apt install clamtk -y
sudo freshclam

figlet "Firewall"
sudo apt install ufw gufw -y

figlet "timeshift"
sudo apt install timeshift -y

figlet "Rclone"
sudo apt install -y rclone rclone-browser

figlet "archive manager - ark"
sudo apt install ark -y

figlet "dev-tools"
sudo apt install vim-gtk3 codelite -y
flatpak install flathub dev.zed.Zed -y

figlet "Social-Media"
flatpak install flathub com.discordapp.Discord -y
flatpak install flathub org.telegram.desktop -y
flatpak install flathub org.ferdium.Ferdium -y

wget -O- https://updates.signal.org/desktop/apt/keys.asc | gpg --dearmor > signal-desktop-keyring.gpg
cat signal-desktop-keyring.gpg | sudo tee /usr/share/keyrings/signal-desktop-keyring.gpg > /dev/null

echo 'deb [arch=amd64 signed-by=/usr/share/keyrings/signal-desktop-keyring.gpg] https://updates.signal.org/desktop/apt xenial main' |\
  sudo tee /etc/apt/sources.list.d/signal-xenial.list
  
sudo apt update && sudo apt install signal-desktop -y

echo " logout and login... "




