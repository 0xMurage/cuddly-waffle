#### Ubuntu setup
- Install make and other essential build tools
```shell
sudo apt-get install build-essential
```

- Install webkit it's dependencies
```
sudo apt install libwebkit2gtk-4.0-dev
```
- Build for linux
```cmake
g++ app.c `pkg-config --cflags --libs gtk+-3.0 webkit2gtk-4.0` -o webview
```