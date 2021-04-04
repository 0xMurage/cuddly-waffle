ASSETS_DIR=assets

OUTPUT_FILENAME=webview

DEB_OUTPUT_DIR=build/deb/webview
WINx86_OUTPUT_DIR=build/win86
WINx64_OUTPUT_DIR=build/win64
MacOS_OUTPUT_DIR=build/macos/$(OUTPUT_FILENAME).app/Contents


deb: main.c lib/webview.h
	mkdir -p $(DEB_OUTPUT_DIR)/usr/bin $(DEB_OUTPUT_DIR)/share/applications $(DEB_OUTPUT_DIR)/DEBIAN/
	g++ main.c -std=c++11 -Wall -Wextra -pedantic `pkg-config --cflags --libs gtk+-3.0 webkit2gtk-4.0` -o $(DEB_OUTPUT_DIR)/usr/bin/$(OUTPUT_FILENAME)
	cp $(ASSETS_DIR)/deb/control $(DEB_OUTPUT_DIR)/DEBIAN/
	cp $(ASSETS_DIR)/deb/webview.desktop $(DEB_OUTPUT_DIR)/share/applications/
	#build .deb archive package
	dpkg-deb -b $(DEB_OUTPUT_DIR)

macos: main.c lib/webview.h
	mkdir -p  $(MacOS_OUTPUT_DIR)/MacOS  $(MacOS_OUTPUT_DIR)/Resources
	cp $(ASSETS_DIR)/macos/Info.plist $(MacOS_OUTPUT_DIR)
	cp -r $(ASSETS_DIR)/macos/resources/ $(MacOS_OUTPUT_DIR)/Resources/
	g++ main.c -std=c++11  -Wall -Wextra -pedantic -framework Webkit  -o $(MacOS_OUTPUT_DIR)/MacOS/$(OUTPUT_FILENAME)


win64: main.c lib/webview.h
	mkdir -p  $(WINx64_OUTPUT_DIR)
	g++ main.c -mwindows -L lib/dll/x64 -lwebview -lWebView2Loader -o $(WINx64_OUTPUT_DIR)/$(OUTPUT_FILENAME).exe
	cp lib/dll/x64/ $(WINx64_OUTPUT_DIR)/


clean:
	rm -fr build