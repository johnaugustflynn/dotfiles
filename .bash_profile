for file in .dotfiles/*.sh;
do
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
done

