xquery version "1.0-ml";

let $request-url := xdmp:get-request-url()

return
    fn:replace($request-url, "^([^?]+)", "$1.xqy")
