all: sway waybar vim ohmyzsh neofetch starship extras # x tmux tmuxinator i3

# --- main sstuff ---
vim:
	rm -f ~/.vimrc
	ln -s $(PWD)/vimrc ~/.vimrc

sway:
	rm -rfd ~/.config/sway
	mkdir -p ~/.config/sway/config.d
	mkdir -p ~/.config/sway/definitions.d
	mkdir -p ~/.config/sway
	ln -s $(PWD)/.config/sway/definitions.d/catppuccin-macchiato.conf ~/.config/sway/definitions.d/catppuccin-mocha.conf
	ln -s $(PWD)/.config/sway/config.d/local.conf ~/.config/sway/config.d/local.conf
	ln -s $(PWD)/.config/sway/config ~/.config/sway/config

waybar:
	rm -rfd ~/.config/waybar
	mkdir -p ~/.config/waybar
	mkdir -p ~/.config/waybar/custom
	ln -s $(PWD)/.config/waybar/custom/cpugovernor.sh ~/.config/waybar/custom/cpugovernor.sh
	ln -s $(PWD)/.config/waybar/custom/custom-gpu.sh ~/.config/waybar/custom/custom-gpu.sh
	ln -s $(PWD)/.config/waybar/config.jsonc ~/.config/waybar/config.jsonc
	ln -s $(PWD)/.config/waybar/style.css ~/.config/waybar/style.css

ohmyzsh:
	rm -f ~/.zshrc
	ln -s $(PWD)/zshrc ~/.zshrc
	curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh | sh || true

neofetch:
	mkdir -p ~/.config/neofetch
	rm -f ~/.config/neofetch/config.conf
	ln -s $(PWD)/neofetch.conf ~/.config/neofetch/config.conf

starship:
	ln -s $(PWD)/starship.toml ~/.config/starship.toml

# --- extra stuff ---
extras: crates git

crates:
	cargo install exa xcp fd-find bottom bat git-delta tokei fnm

git:
	ln -s $(PWD)/gitconfig.toml ~/.gitconfig

# --- unused below ---
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

x:
	rm -f ~/.Xresources
	ln -s $(PWD)/Xresources ~/.Xresources
