xquery version "1.0-ml";

(:　HTTPパラーメータdocument-uriを取得し、変数に代入します。　:)
(:　HTTPパラーメータvalueを取得し、変数に代入します。　:)

(:　document-uriとvalueを指定し、データベースに登録します。 :)

return
    xdmp:redirect-response("index.xqy")