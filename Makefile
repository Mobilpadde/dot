.PHONY: all clean vim tmux tmuxinator i3 ohmyzsh
all: vim tmux tmuxinator i3 ohmyzsh

vim:
	ln -s $(PWD)/vimrc ~/.vimrc

tmux:
	ln -s $(PWD)/tmux.conf ~/.tmux.conf

tmuxinator:
	mkdir ~/.config/tmuxinator -p
	ln -s $(PWD)/tmuxinator/unbug.yml ~/.config/tmuxinator/
	ln -s $(PWD)/tmuxinator/rustlings.yml ~/.config/tmuxinator/

i3:
	mkdir -p ~/.i3
	ln -s $(PWD)/i3.conf ~/.i3/config

ohmyzsh:
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
	ln -s $(PWD)/zshrc ~/.zshrc

clean:
	rm ~/.vimrc ~/.tmux.conf ~/.zshrc ~/.config/tmuxinator -rfd
