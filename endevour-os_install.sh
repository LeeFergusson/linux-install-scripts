# Install Desktop Environment.
sudo pacman -S --noconfirm
sudo pacman -Syuu --noconfirm
sudo pacman -S --noconfirm --needed lightdm
sudo pacman -S --noconfirm --needed lightdm-gtk-greeter lightdm-gtk-greeter-settings
sudo pacman -S gnome --noconfirm --needed
sudo systemctl enable lightdm.service -f
sudo systemctl set-default graphical.target

# Install Software from the Arch Repositories.
sudo pacman -S cronie --noconfirm --needed
sudo pacman -S galculator --noconfirm --needed
sudo pacman -S qbittorrent --noconfirm --needed
sudo pacman -S lollypop vlc --noconfirm --needed
sudo pacman -S evince evolution --noconfirm --needed
sudo pacman -S arc-gtk-theme --noconfirm --needed
sudo pacman -S kvantum-qt5 --noconfirm --needed
sudo pacman -S kvantum-theme-arc --noconfirm --needed
sudo pacman -S net-tools --noconfirm --needed
sudo pacman -S zsh --noconfirm --needed
sudo pacman -S chrome-gnome-shell --noconfirm --needed
sudo pacman -S gnome-tweaks --noconfirm --needed
sudo pacman -S python2 --noconfirm --needed
sudo pacman -S vim --noconfirm --needed
sudo pacman -S deja-dup --noconfirm --needed
sudo pacman -S libreoffice-fresh --noconfirm --needed
sudo pacman -S krita blender gimp --noconfirm --needed
sudo pacman -S gnome-shell-extension-clipboard-indicator-git --noconfirm --needed

# Install Software from the AUR
yay -S brave-bin --noconfirm --needed
yay -S gnome-terminal-transparency --needed
yay -S python-pywal --noconfirm --needed
yay -S folder-color-nautilus-bzr --noconfirm --needed
yay -S pamac --noconfirm --needed
yay -S timeshift --noconfirm --needed
yay -S visual-studio-code-bin --noconfirm --needed
yay -S gnome-shell-extension-arch-update-git --noconfirm --needed
yay -S gnome-shell-extension-arc-menu-git --noconfirm --needed
yay -S gnome-shell-extension-dash-to-panel --noconfirm --needed
yay -S gnome-shell-extension-caffeine-plus-git --noconfirm --needed

touch ~/Templates/Text

#-------------------------------------------------------------------------------
# Setup User defaults
#-------------------------------------------------------------------------------
cp ./config/user /etc/dconf/profile/
mkdir /etc/dconf/db/local.d
cp ./config/00-extensions /etc/dconf/db/local.d/
dconf update

# Setup the shell
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/denysdovhan/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt"
ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"

