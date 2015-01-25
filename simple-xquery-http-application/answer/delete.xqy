xquery version "1.0-ml";

let $document-uri := xdmp:get-request-field("document-uri")

let $statement := xdmp:document-delete($document-uri)

return
    xdmp:redirect-response("index.xqy")