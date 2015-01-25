xquery version "1.0-ml";

import module namespace search = "http://marklogic.com/appservices/search" at "/MarkLogic/appservices/search/search.xqy";

let $query:= xdmp:get-request-field("query", "")
let $search-result := search:search($query, ())

return (
    xdmp:add-response-header("Content-Type", "text/html; charset=UTF-8"),
    <html>
        <head></head>
        <body>
            <form action="create.xqy" method="post">
                document uri:<input type="text" name="document-uri"/>
                value:<input type="text" name="value"/>
                <input type="submit" value="登録"/>
            </form>
            <hr/>
            <form action="index.xqy" method="get">
                <input type="text" name="query"/>
                <input type="submit" value="検索"/>
            </form>
    {
        for $i in $search-result/search:result
        return (
            $i/string(),
            " ",
            <a href="delete.xqy?document-uri={ $i/@uri }">削除</a>,
            <br/>
            )
    }
        </body>
    </html>
)
