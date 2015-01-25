xquery version "1.0-ml";

declare namespace error = "http://marklogic.com/xdmp/error";

declare variable $error:errors as node()* external;

xdmp:set-response-content-type("text/html; charset=UTF-8"),
<html>
    <head></head>
    <body>{ $error:errors/error:message/text() }</body>
</html>