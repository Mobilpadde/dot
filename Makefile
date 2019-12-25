.PHONY: all clean vim tmux tmuxinator
all: vim tmux tmuxinator

vim:
	ln -s ~/dot/vimrc ~/.vimrc

tmux:
	ln -s ~/dot/tmux.conf ~/.tmux.conf

tmuxinator:
	mkdir ~/.config/tmuxinator -p
	ln -s ~/dot/tmuxinator/unbug.yml ~/.config/tmuxinator/
	ln -s ~/dot/tmuxinator/rustlings.yml ~/.config/tmuxinator/

clean:
	rm ~/.vimrc ~/.tmux.conf ~/.config/tmuxinator -rfd
