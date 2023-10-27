all: sway waybar vim ohmyzsh neofetch starship extras # x tmux tmuxinator i3

vim:
	rm -f ~/.vimrc
	ln -s $(PWD)/vimrc ~/.vimrc

tmux:
	rm -f ~/.tmux.conf
	ln -s $(PWD)/tmux.conf ~/.tmux.conf

tmuxinator:
	rm -rfd ~/.config/tmuxinator
	mkdir ~/.config/tmuxinator -p
	ln -s $(PWD)/tmuxinator/unbug.yml ~/.config/tmuxinator/
	ln -s $(PWD)/tmuxinator/rustlings.yml ~/.config/tmuxinator/

i3:
	mkdir -p ~/.i3
	rm -f ~/.i3/config
	ln -s $(PWD)/i3.conf ~/.i3/config

sway:
	# rm -rfd ~/.config/sway
	mkdir -p ~/.config/sway
	ln -s $(PWD)/.config/sway/config.d/catppuccin-macchiato.conf ~/.config/sway/definitions.d/catppuccin-mocha
	ln -s $(PWD)/.config/sway/config ~/.config/sway/config

waybar:
	# rm -rfd ~/.config/waybar
	mkdir -p ~/.config/waybar
	ln -s $(PWD)/.config/waybar/cuustom/cpugovernor.sh ~/.config/waybar/custom/cpugovernor.sh
	ln -s $(PWD)/.config/waybar/cuustom/custom-gpu.sh ~/.config/waybar/custom/custom-gpu.sh
	ln -s $(PWD)/.config/waybar/config.jsonc ~/.config/waybar/config.jsonc
	ln -s $(PWD)/.config/waybar/style.css ~/.config/waybar/style.css

ohmyzsh:
	rm -f ~/.zshrc
	ln -s $(PWD)/zshrc ~/.zshrc
	curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh | sh || true
	curl -L git.io/antigen > ~/antigen.zsh

x:
	rm -f ~/.Xresources
	ln -s $(PWD)/Xresources ~/.Xresources

neofetch:
	mkdir -p ~/.config/neofetch
	rm -f ~/.config/neofetch/config.conf
	ln -s $(PWD)/neofetch.conf ~/.config/neofetch/config.conf

starship:
	ln -s $(PWD)/starship.toml ~/.config/starship.toml

# Extra stuff
extras: crates git

crates:
	cargo install exa xcp fd-find bottom bat git-delta tokei fnm

git:
	ln -s $(PWD)/gitconfig.toml ~/.gitconfig
