set script_dir=%~dp0
set src_dir=%script_dir%..

set build_dir=%script_dir%..\build
mkdir "%build_dir%"

echo Building webview.exe (x64)
cl /I "%src_dir%\lib\" ^
	/std:c17 /EHsc \ ^
	"%src_dir%\main.c" /link "/OUT:%build_dir%\webview.exe" || exit \b