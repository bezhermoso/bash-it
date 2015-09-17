function cpkey() {
  cat $HOME/.ssh/id_rsa.pub | pbcopy
  echo 'Public key copied to clipboard'
}

function appify() {
   APPNAME=${2:-$(basename "$1" ".sh")}
   DIR="$APPNAME.app/Contents/MacOS"

   if [ -a "$APPNAME.app" ]; then
     echo "$PWD/$APPNAME.app already exists :("
     exit 1
   fi

   mkdir -p "$DIR"
   cp "$1" "$DIR/$APPNAME"
   chmod +x "$DIR/$APPNAME"
   echo "$PWD/$APPNAME.app"
}

function clip() {
  if [ -t 0 ]; then
    pbpaste
  else
    pbcopy
  fi
}

alias quit="exit"
