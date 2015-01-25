xquery version "1.0-ml";
import module namespace admin = "http://marklogic.com/xdmp/admin" at "/MarkLogic/admin.xqy";

let $INTERPETER-SERVER-NAME := "interpreter-app"
let $INTERPETER-SERVER-PORT := 8017
let $DATABASE-NAME := "simple-app-database"

let $config := admin:get-configuration()

let $groupid := admin:group-get-id($config, "Default")
let $database := admin:database-get-id($config, $DATABASE-NAME)

let $config := admin:xdbc-server-create($config, $groupid, $INTERPETER-SERVER-NAME, "/", $INTERPETER-SERVER-PORT, 0, $database)
let $statement := admin:save-configuration($config)
let $statement := xdmp:log("created interpreter server.")

return admin:save-configuration($config)
