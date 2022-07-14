for file in $ZDOTDIR/{prompt,path,exports,aliases,functions}.zsh;
do
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
done

