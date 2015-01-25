xquery version "1.0-ml";
import module namespace admin = "http://marklogic.com/xdmp/admin" at "/MarkLogic/admin.xqy";

let $APPLICATION-SERVER-NAME := "simple-app"
let $APPLICATION-SERVER-PORT := 8016
let $APPLICATION-SERVER-MODULE-PATH := "C:\Users\mltraining\workspace/simple-xquery-http-application/module/"
let $DATABASE-NAME := "simple-app-database"

let $config := admin:get-configuration()

let $forest-name := fn:concat($DATABASE-NAME, "-forest")
let $config := admin:forest-create($config, $forest-name, xdmp:host(), ())
let $statement := admin:save-configuration($config)
let $statement := xdmp:log("created forest.")

let $config := admin:database-create($config, $DATABASE-NAME, xdmp:database("Security"), xdmp:database("Schemas"))
let $database := admin:database-get-id($config, $DATABASE-NAME)
let $statement := admin:save-configuration($config)
let $statement := xdmp:log("created database.")

let $config := admin:database-attach-forest($config, $database, xdmp:forest($forest-name))
let $statement := admin:save-configuration($config)
let $statement := xdmp:log("attached forest to database.")

let $groupid := admin:group-get-id($config, "Default")

let $config := admin:http-server-create($config, $groupid, $APPLICATION-SERVER-NAME, $APPLICATION-SERVER-MODULE-PATH, $APPLICATION-SERVER-PORT, 0, $database)
let $statement := admin:save-configuration($config)
let $statement := xdmp:log("created http server.")

return admin:save-configuration($config)
