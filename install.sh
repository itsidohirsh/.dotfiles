# Make sure system is updated
sudo apt update -y
sudo apt upgrade -y

# Install stow
sudo apt-get install stow -y

# Install neovim
sudo add-apt-repository ppa:neovim-ppa/unstable -y
sudo apt-get update -y
sudo apt-get install neovim -y

# Install the C package
sudo apt install build-essential -y
sudo apt-get install manpages-dev -y

# Install C language server
sudo apt install ccls -y

# Install tree
sudo apt install tree -y

# Install neofetch
sudo apt install neofetch -y

# Install google chrome
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo apt install ./google-chrome-stable_current_amd64.deb -y
rm -rf google-chrome-stable_current_amd64.deb

# Make .config and .local/share directories in ~ ,if doesn't exist already, to make stow symlink only the wanted directories
mkdir ~/.config
mkdir ~/.local/share -p

# Better bash prompt
sudo apt install fonts-powerline -y
cd ~
git clone --recursive https://github.com/andresgongora/synth-shell.git
chmod +x synth-shell/setup.sh
cd synth-shell
./setup.sh

## Remove synth-shell-prompt.config after installation so I can use my own synth-shell-prompt.config with stow
rm ~/.config/synth-shell/synth-shell-prompt.config

# Stow
cd ~/.dotfiles
stow bash
stow git
stow synth-shell
stow nvim
stow fonts
sudo stow -d ~/.dotfiles/ -t / clang-format/

# Install neovim plugins
nvim --headless +PlugInstall +qall

# Make an empty .git directory in root to make the lsp autocomplition work
sudo mkdir /.git

# Make neofetch launch on logon
echo '' >> ~/.bashrc
echo '# Make neofetch launch on logon' >> ~/.bashrc
echo 'neofetch --ascii_distro Windows7' >> ~/.bashrc
