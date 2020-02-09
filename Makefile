.PHONY: all vim tmux tmuxinator i3 x ohmyzsh
all: vim tmux tmuxinator i3 x ohmyzsh

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

ohmyzsh:
	rm -f ~/.zshrc
	ln -s $(PWD)/zshrc ~/.zshrc
	#curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh | sh

zsh-auto-suggest:
	#git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

x:
	rm -f ~/.Xresources
	ln -s $(PWD)/Xresources ~/.Xresources
