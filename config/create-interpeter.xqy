xquery version "1.0-ml";
import module namespace admin = "http://marklogic.com/xdmp/admin" at "/MarkLogic/admin.xqy";

let $INTERPETER-SERVER-NAME := "interpreter-app"
let $INTERPETER-SERVER-PORT := 8017
let $DATABASE-NAME := "interpreter-database"

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
let $database := admin:database-get-id($config, $DATABASE-NAME)

let $config := admin:xdbc-server-create($config, $groupid, $INTERPETER-SERVER-NAME, "/", $INTERPETER-SERVER-PORT, 0, $database)
let $statement := admin:save-configuration($config)
let $statement := xdmp:log("created interpreter server.")

return admin:save-configuration($config)
