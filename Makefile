.PHONY: all clean vim tmux tmuxinator i3
all: vim tmux tmuxinator i3

vim:
	ln $(PWD)/vimrc ~/.vimrc

tmux:
	ln -s $(PWD)/tmux.conf ~/.tmux.conf

tmuxinator:
	mkdir ~/.config/tmuxinator -p
	ln -s $(PWD)/tmuxinator/unbug.yml ~/.config/tmuxinator/
	ln -s $(PWD)/tmuxinator/rustlings.yml ~/.config/tmuxinator/

i3:
	mkdir -p ~/.i3
	ln -s $(PWD)/i3.conf ~/.i3/config

clean:
	rm ~/.vimrc ~/.tmux.conf ~/.config/tmuxinator -rfd
