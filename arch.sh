################################################################################
#
# My Install Script for Vanilla Arch 
#
################################################################################

# Bootstrap the Base System
pacstrap /mnt base base-devel linux linux-firmware vim dhcpcd sudo man-db man-pages texinfo zsh
genfstab -U /mnt >> /mnt/etc/fstab

# Chroot into the new install
arch-chroot /mnt

# Setup Time Zonev
ln -sf /usr/share/zoneinfo/Europe/London /etc/localtime
hwclock --systohc
echo "en_GB.UTF-8 UTF-8" >> /etc/locale.gen
echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen
locale-gen
touch /etc/locale.conf

# Setup Localization
echo "LANG=en_GB.UTF-8" >> /etc/locale.conf
touch /etc/vconsole.conf
echo "KEYMAP=uk" >> /etc/vconsole.conf

# Setup Networking
read -p "Please enter a Hostname: " host
touch /etc/hostname
echo $host >> /etc/hostname
touch /etc/hosts
echo "127.0.0.1	localhost" >> /etc/hosts
echo "::1	localhost" >> /etc/hosts
echo 127.0.1.1	$host.localdomain	$host >> /etc/hosts
systemctl enable dhcpcd

echo Please create a new root password:
passwd

echo "Please Create a admin accout"
read -p "Username: " user_name
read -p "Full name: " full_name
useradd -m -s /bin/zsh -c $full_name -G wheel $user_name
passwd $user_name

# Install and setup gnome
pacman -S gdm --needed --noconfirm
pacman -S gnome --needed --noconfirm
pacman -S arc-gtk-theme --needed --noconfirm
systemctl enable gdm
systemctl set-default graphical.target

# Setup Yay
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd ..
rm -rf yay

yay -S gnome-terminal-transparency --needed
