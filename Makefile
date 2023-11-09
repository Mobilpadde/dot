.PHONY: i3 yay vim alacritty starship zsh neofetch gtk polybar crates git
all: main extras

# --- main sstuff ---
main: i3 yay vim alacritty starship zsh neofetch gtk polybar
vim:
	rm -f ~/.vimrc
	ln -s $(PWD)/vimrc ~/.vimrc

gtk:
	rm -f ~/.gtkrc-2.0
	ln -s $(PWD)/gtkrc.conf ~/.gtkrc-2.0

zsh:
	rm -f ~/.zshrc ~/.zshenv
	ln -s $(PWD)/zshrc ~/.zshrc
	curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh | sh || true

neofetch:
	mkdir -p ~/.config/neofetch
	rm -f ~/.config/neofetch/config.conf
	ln -s $(PWD)/neofetch.conf ~/.config/neofetch/config.conf

starship:
	ln -s $(PWD)/starship.toml ~/.config/starship.toml

i3:
	mkdir -p ~/.i3
	rm -f ~/.i3/config
	ln -s $(PWD)/i3.conf ~/.i3/config

alacritty:
	rm -f ~/.alacritty.yml
	ln -s $(PWD)/alacritty.yml ~/.alacritty.yml

yay:
	yay -S \
		zsh starship neofetch \
		jq pulseaudio pavucontrol \
		alacritty polybar flameshot \
		ctags go rustup \
		rofi rofimoji rofi-calc \
		codium-bin-marketplace firefox-developer-edition \
		ttf-jetbrains-mono-nerd ttf-ibmplex-mono-nerd ttf-twemoji-color \
		ttf-weather-icons ttf-material-design-icons-extended \
		catppuccin-gtk-theme-macchiato

polybar:
	rm -rfd ~/.config/polybar
	mkdir -p ~/.config/polybar/modules
	ln -s $(PWD)/polybar/modules/weather.sh ~/.config/polybar/modules/weather.sh
	ln -s $(PWD)/polybar/modules/updates.sh ~/.config/polybar/modules/updates.sh
	ln -s $(PWD)/polybar/colors.ini ~/.config/polybar/colors.ini
	ln -s $(PWD)/polybar/fonts.ini ~/.config/polybar/fonts.ini
	ln -s $(PWD)/polybar/main-bar.ini ~/.config/polybar/main-bar.ini
	ln -s $(PWD)/polybar/modules.ini ~/.config/polybar/modules.ini
	ln -s $(PWD)/polybar/settings.ini ~/.config/polybar/settings.ini
	ln -s $(PWD)/polybar/config.ini ~/.config/polybar/config.ini

# --- extra stuff ---
extras: crates git

crates:
	cargo install exa xcp fd-find bottom bat git-delta tokei fnm atuin

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

x:
	rm -f ~/.Xresources
	ln -s $(PWD)/Xresources ~/.Xresources

sway:
	rm -rfd ~/.config/sway
	mkdir -p ~/.config/sway/config.d
	mkdir -p ~/.config/sway/definitions.d
	mkdir -p ~/.config/sway
	ln -s $(PWD)/.config/sway/definitions.d/catppuccin-macchiato.conf ~/.config/sway/definitions.d/catppuccin-mocha.conf
	cp $(PWD)/.config/sway/config.d/local.conf ~/.config/sway/config.d/local.conf
	ln -s $(PWD)/.config/sway/config ~/.config/sway/config

waybar:
	rm -rfd ~/.config/waybar
	mkdir -p ~/.config/waybar
	mkdir -p ~/.config/waybar/custom
	ln -s $(PWD)/.config/waybar/custom/cpugovernor.sh ~/.config/waybar/custom/cpugovernor.sh
	ln -s $(PWD)/.config/waybar/custom/custom-gpu.sh ~/.config/waybar/custom/custom-gpu.sh
	ln -s $(PWD)/.config/waybar/config.jsonc ~/.config/waybar/config.jsonc
	ln -s $(PWD)/.config/waybar/style.css ~/.config/waybar/style.css
