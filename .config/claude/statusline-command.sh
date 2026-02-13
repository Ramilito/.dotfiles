#!/bin/bash
input=$(cat)

model=$(echo "$input" | jq -r '.model.display_name // "?"')
used=$(echo "$input" | jq -r '.context_window.used_percentage // 0')
agent=$(echo "$input" | jq -r '.agent.name // empty')

bar_width=20
filled=$(( used * bar_width / 100 ))
empty=$(( bar_width - filled ))

bar=""
for ((i=0; i<filled; i++)); do bar+="█"; done
for ((i=0; i<empty; i++)); do bar+="░"; done

output=$(printf "%s  %s %d%%" "$model" "$bar" "$used")
[[ -n "$agent" ]] && output+="  [$agent]"
printf "%s" "$output"
