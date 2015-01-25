xquery version "1.0-ml";

import module namespace search = "http://marklogic.com/appservices/search" at "/MarkLogic/appservices/search/search.xqy";

(:　HTTPパラーメータqueryを取得し、変数に代入します。入力がない場合は空文字が代入されるようにします。　:)

(: 検索条件とクエリオプションなしを指定し、検索を実行し変数に代入します。 :)

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
