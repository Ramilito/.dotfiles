return {
	{
		regex = "\\b\\w+://[\\w.-]+:[0-9]{2,15}\\S*\\b",
		format = "$0",
	},
	{
		regex = "\\b\\w+://[\\w.-]+\\.[a-z]{2,15}\\S*\\b",
		format = "$0",
	},
	{
		regex = [[\b\w+@[\w-]+(\.[\w-]+)+\b]],
		format = "mailto:$0",
	},
	{
		regex = [[\bfile://\S*\b]],
		format = "$0",
	},
	{
		regex = [[\b\w+://(?:[\d]{1,3}\.){3}[\d]{1,3}\S*\b]],
		format = "$0",
	},
	{
		regex = [[\b[tT](\d+)\b]],
		format = "https://example.com/tasks/?t=$1",
	},
}
