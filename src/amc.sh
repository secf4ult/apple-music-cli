play() {
  osascript -e 'tell application "Music" to play'
}

pause() {
  osascript -e 'tell application "Music" to pause'
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

usage="Usage: apple-music.sh [function]"

if [ "$#" -eq 0 ];then
  printf '%s\n' "$usage";
else
  if [ "$1" = "p" ];then
    toggle_play
  elif [ "$1" = "play" ];then
    play
  elif [ "$1" = "pause" ];then
    pause
  fi
fi
