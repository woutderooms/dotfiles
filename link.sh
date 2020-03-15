function doIt() {
	# Make a symlink for all dotfiles in this directory
	for file in \.[^.]*; do
		if [ $file != '.DS_Store' ] && [ $file != '.git' ]; then
			echo "Creating symlink to $file in home directory."
			ln -sf $PWD/$file ~/$file
		fi
	done
}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
	doIt;
else
	read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1;
	echo "";
	if [[ $REPLY =~ ^[Yy]$ ]]; then
		doIt;
	fi;
fi;
unset doIt;

# Link vimrc
ln -sf $PWD/.vimrc ~/.config/nvim/init.vim

# Link VSCode settings
ln -sf $PWD/vscode/settings.json ~/Library/Application\ Support/Code/User/settings.json
ln -sf $PWD/vscode/keybindings.json ~/Library/Application\ Support/Code/User/keybindings.json
ln -sf $PWD/vscode/snippets/ ~/Library/Application\ Support/Code/User