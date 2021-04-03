#! /bin/sh
set -e

DIR="$(cd "$(dirname "$0")/../" && pwd)"
mkdir -p $DIR/build

if [ "$(uname)" = "Darwin" ]; then
	FLAGS="-DWEBVIEW_COCOA -std=c++11 -Wall -Wextra -pedantic -framework WebKit"
else
	FLAGS="-DWEBVIEW_GTK -std=c++11 -Wall -Wextra -pedantic $(pkg-config --cflags --libs gtk+-3.0 webkit2gtk-4.0)"
fi


echo "Building app......"
g++ main.c $FLAGS -o $DIR/build/webview