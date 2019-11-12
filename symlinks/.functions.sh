#!/bin/bash

#### SCREENCAST ################################################################

function screencast {
  if [ ! -x "$(command -v byzanz-record)" ]; then
    echo "Application NOT found: byzanz"
    exit 1
  fi

  local -r DESTINATION_FOLDER="${HOME}/Pictures"
  local -r DATETIME=$(date +"%Y%m%d%H%M%S")
  local -r DELAY=3

  echo -n "Duration in seconds? "
  read DURATION
  if [[ ! $DURATION =~ ^[1-9][0-9]*$ ]]; then
    echo "Invalid duration: $DURATION"
    exit 1
  fi

  echo "Select the output format: "
  select OUTPUT_FORMAT in flv gif webm; do
    case $OUTPUT_FORMAT in
      flv|gif|webm)
        echo "Using output format: ${OUTPUT_FORMAT}"
        DESTINATION_FILE="${DESTINATION_FOLDER}/screencast_${DATETIME}.${OUTPUT_FORMAT}"
        break
        ;;
    esac
  done

  echo "Select the display to obtain the upper-left point & the dimensions of the screencast: "
  select CAPTURE in fullscreen window; do
    case $CAPTURE in
      fullscreen)
        echo "Getting screen information ..."
        local -r SCREEN=$(xrandr --current | grep '*' | uniq)
        X=0
        Y=0
        W=$(echo $SCREEN | awk '{print $1}' | cut -d 'x' -f1)
        H=$(echo $SCREEN | awk '{print $1}' | cut -d 'x' -f2)
        break
        ;;

      window)
        echo "Select a window to get its upper-left point & dimensions ..."
        local -r XWININFO=$(xwininfo)
        read X < <(awk -F: '/Absolute upper-left X/{print $2}' <<< "$XWININFO")
        read Y < <(awk -F: '/Absolute upper-left Y/{print $2}' <<< "$XWININFO")
        read W < <(awk -F: '/Width/{print $2}' <<< "$XWININFO")
        read H < <(awk -F: '/Height/{print $2}' <<< "$XWININFO")
        break
        ;;
    esac
  done
  echo "Using upper-left point: [${X},${Y}] & dimensions: ${W}x${H} in the screencast"

  echo "Screencast will start in $DELAY seconds & its duration will be $DURATION seconds"
  sleep $DELAY

  echo "Screencast starting ..."
  byzanz-record -c --verbose --delay=0 --duration=$DURATION \
    --x=$X --y=$Y --width=$W --height=$H \
    "$DESTINATION_FILE"
  echo "Screencast saved: $DESTINATION_FILE"
}
