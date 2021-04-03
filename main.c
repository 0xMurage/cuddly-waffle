#include "lib/webview.h"

#ifdef WIN32
int WINAPI WinMain(HINSTANCE hInt, HINSTANCE hPrevInst, LPSTR lpCmdLine, int nCmdShow){
#else

int main() {
#endif
    webview_t w = webview_create(0, NULL);
    webview_set_title(w,"EKNG Laboratories");
    webview_set_size(w,500,320,WEBVIEW_HINT_NONE);
    webview_navigate(w,"https://duckduckgo.com");
    webview_run(w);
    webview_destroy(w);

    return 0;

}