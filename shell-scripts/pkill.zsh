

fpkill() {
	pid=$(ps -e | fzf | xargs | cut -d" " -f1)
	echo "Kill process $pid?"
	ps $pid -o comm
	read -q "CHOICE?[y/n]:"
	if [[ $CHOICE == "y" ]]; then
		pkill $pid
		echo "Killed $pid"
	else
		echo "aborted pkill"
	fi
}
