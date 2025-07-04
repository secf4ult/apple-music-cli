play() {
  osascript -e 'tell application "Music" to play'
}

pause() {
  osascript -e 'tell application "Music" to pause'
}

list() {
  shift
  pattern=${1:-.}
  osascript -e 'tell application "Music" to get name of every playlist' | sed 's/, /\n/g' | grep $pattern
}

toggle_play() {
  # status either playing, paused or stopped
  status=$(osascript -e 'tell application "Music" to player state')

  if [ $status = 'stopped' ];then
    osascript -e 'tell application "Music" to play'
  else
    osascript -e 'tell application "Music" to playpause'
  fi
}

usage="Usage: amc [function]
p: resume or pause
play [track]: play specified track name 
pause: pause the track
list [PATTERN]: list all playlist and filter it if PATTERN is provided
"

if [ "$#" -eq 0 ];then
  printf '%s\n' "$usage";
else
  if [ "$1" = "p" ];then
    toggle_play
  elif [ "$1" = "play" ];then
    play
  elif [ "$1" = "pause" ];then
    pause
  elif [ "$1" = "list" ];then
    list "$@"
  fi
fi
