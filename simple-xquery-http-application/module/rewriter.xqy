xquery version "1.0-ml";

let $request-url := xdmp:get-request-url()

return
    (: リクエストURLに　.xqy を付与をする変換をします。 :)
