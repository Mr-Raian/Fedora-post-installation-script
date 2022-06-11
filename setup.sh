# exit when any command fails
set -e
# Upgrade
sudo dnf upgrade -y 
# RPM Fusion
sudo dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm -y 
# Installing plugins for playing movies and music
sudo dnf groupupdate core -y 
sudo dnf groupupdate multimedia --setop="install_weak_deps=False" --exclude=PackageKit-gstreamer-plugin -y
sudo dnf groupupdate sound-and-video  -y
# Add flathub repo
sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo 
# Increase DNF speed
echo -e "# Added for speed: \nfastestmirror=True\nmax_parallel_downloads=5\nkeepcache=True" | sudo tee -a /etc/dnf/dnf.conf
