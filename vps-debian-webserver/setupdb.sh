#!/usr/bin/env bash

dbname=$1
username=$2

showmsg() {
  local msg=$1
  printf '%s\n' $msg
}


pw=$(pwgen -Bs 32 1)
privileges="ALL PRIVILEGES"
#"ALTER,CREATE,CREATE VIEW,DELETE,DROP,INDEX,INSERT,SELECT,TRIGGER,UPDATE,INSERT,EXECUTE"
dbcreate="CREATE DATABASE IF NOT EXISTS ${dbname}"
usercreate="CREATE USER IF NOT EXISTS '${username}'@localhost IDENTIFIED BY '${pw}';"
grant="GRANT ${privileges} ON ${dbname}.* TO '${username}'@'localhost';"
flushpriv="FLUSH PRIVILEGES;"
showmsg "Creating db $dbname"
mysql -e "$dbcreate"
showmsg "Creating user $username"
mysql -e "$usercreate"
showmsg "$grant"
mysql -e "$grant"
showmsg "$flushpriv"
mysql -e "$flushpriv"
printf "%s:%s" $username $pw > mysqldb.password
