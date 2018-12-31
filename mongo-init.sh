#!/usr/bin/env bash

mongo mongodb://root:example@localhost:27017/admin <<EOF
use pdc
db.delete_me.insert({})
db.createUser(
  {
    user: "pdc",
    pwd: "pdc",
    roles: [ { role: "dbOwner", db: "pdc" } ]
  }
)
db.auth("pdc","pdc")
EOF
