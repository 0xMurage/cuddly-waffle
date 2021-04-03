ASSETS_DIR=assets

OUTPUT_FILENAME=webview

DEB_OUTPUT_DIR=build/deb
WINx86_OUTPUT_DIR=build/win86
WINx64_OUTPUT_DIR=build/win64
MacOS_OUTPUT_DIR=build/macos/$(OUTPUT_FILENAME).app/Contents


deb: main.c lib/webview.h
	mkdir -p $(DEB_OUTPUT_DIR)
	g++ main.c `pkg-config --cflags --libs gtk+-3.0 webkit2gtk-4.0` -o $(DEB_OUTPUT_DIR)/$(OUTPUT_FILENAME)
	cp $(ASSETS_DIR)/deb/.desktop $(DEB_OUTPUT_DIR)/

macos: main.c lib/webview.h
	mkdir -p  $(MacOS_OUTPUT_DIR)/MacOS  $(MacOS_OUTPUT_DIR)/Resources
	g++ main.c -std=c++11 -framework Webkit  -o $(MacOS_OUTPUT_DIR)/MacOS/$(OUTPUT_FILENAME)
	cp $(ASSETS_DIR)/macos/Info.plist $(MacOS_OUTPUT_DIR)
	cp $(ASSETS_DIR)/macos/resources/ $(MacOS_OUTPUT_DIR)/Resources/

win64: main.c lib/webview.h
	mkdir -p  $(WINx64_OUTPUT_DIR)
	g++ main.c -mwindows -L lib/dll/x64 -lwebview -lWebView2Loader -o $(WINx64_OUTPUT_DIR)/$(OUTPUT_FILENAME).exe
	cp lib/dll/x64/ $(WINx64_OUTPUT_DIR)/


clean:
	rm -fr build