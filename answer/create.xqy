xquery version "1.0-ml";

let $document-uri := xdmp:get-request-field("document-uri")
let $value := xdmp:get-request-field("value")

let $statement := xdmp:document-insert($document-uri, text { $value })

return
    xdmp:redirect-response("index.xqy")