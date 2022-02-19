#!/usr/bin/env bash

SCRIPT_NAME="$(basename ${BASH_SOURCE:-$0})"

XFCE4_DESKTOP_DIR="$HOME/.config/xfce4/desktop"

XFCE4_DESKTOP_SOURCE_FILENAME="icons.screen.latest.rc"
XFCE4_DESKTOP_BACKUP_FILENAME="backup.icons.screen.rc"

XFCE4_DESKTOP_SOURCE="$XFCE4_DESKTOP_DIR/$XFCE4_DESKTOP_SOURCE_FILENAME"
XFCE4_DESKTOP_BACKUP="$XFCE4_DESKTOP_DIR/$XFCE4_DESKTOP_BACKUP_FILENAME"


function backup() {
  cat "$XFCE4_DESKTOP_SOURCE" > "$XFCE4_DESKTOP_BACKUP"
  #echo "cat \"$XFCE4_DESKTOP_SOURCE\" > \"$XFCE4_DESKTOP_BACKUP\""
  echo "Desktop icons backup completed."
}

function restore() {
  cat "$XFCE4_DESKTOP_BACKUP" > "$XFCE4_DESKTOP_SOURCE"
  #echo "cat \"$XFCE4_DESKTOP_BACKUP\" > \"$XFCE4_DESKTOP_SOURCE\""
  echo "Desktop icons backup restored."
}

function usage() {
  echo "usage: $SCRIPT_NAME backup|restore"
}

if [ -z "$1" ]; then
  echo "No command specified!"
  usage
  exit 1
fi

# Backup desktop icons if not exist
if [ ! -f "$XFCE4_DESKTOP_BACKUP" ]; then
  backup >/dev/null
fi

case "$1" in
  backup)
    backup
    ;;
  restore)
    restore
    ;;
  -h | --help)
    echo "XFCE4 desktop icons backup and restore script!"
    usage
    ;;
  *)
    echo "Invalid arg \"$1\""
    usage
    exit 1
    ;;
esac
