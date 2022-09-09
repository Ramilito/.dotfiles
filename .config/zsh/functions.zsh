#
# vd() {
# 	viddy -d -n 1 --shell zsh  "$(which $1 | cut -d' ' -f 4-)"
# }


timezsh() {
  shell=${1-$SHELL}
  for i in $(seq 1 10); do /usr/bin/time $shell -i -c exit; done
}

