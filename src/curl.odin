package curl_odin

import "core:c"
// import c "core:c/libc"
import "core:fmt"

CurlEasy :: distinct rawptr

CurlOption :: enum {
	CURLOPTTYPE_OBJECTPOINT = 10_000,
	CURLOPT_URL             = CURLOPTTYPE_OBJECTPOINT + 2,
}

CurlCode :: enum {
	CURLE_OK             = 0,
	CURLE_URL_MALFORMAT  = 3,
	CURLE_UNKNOWN_OPTION = 48,
}


foreign import libcurl "system:curl"
@(default_calling_convention = "c", link_prefix = "curl_")
foreign libcurl {
	easy_init :: proc() -> CurlEasy ---
	easy_setopt :: proc(handle: CurlEasy, opt: CurlOption, url: cstring) -> CurlCode ---
	easy_perform :: proc(handle: CurlEasy) -> CurlCode ---
}

main :: proc() {
	curl := easy_init()
	idk := easy_setopt(curl, .CURLOPT_URL, "http://google.com")
	res := easy_perform(curl)
	easy_perform(curl)
	fmt.println(curl)
	fmt.println(idk)
	fmt.println(res)

}
