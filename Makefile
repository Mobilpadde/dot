.PHONY: all clean vim tmux tmuxinator
all: vim tmux tmuxinator

vim:
	ln $(PWD)/vimrc ~/.vimrc

tmux:
	ln -s $(PWD)/tmux.conf ~/.tmux.conf

tmuxinator:
	mkdir ~/.config/tmuxinator -p
	ln -s $(PWD)/tmuxinator/unbug.yml ~/.config/tmuxinator/
	ln -s $(PWD)/tmuxinator/rustlings.yml ~/.config/tmuxinator/

clean:
	rm ~/.vimrc ~/.tmux.conf ~/.config/tmuxinator -rfd
