for file in $ZDOTDIR/*.zsh;
do
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
done

