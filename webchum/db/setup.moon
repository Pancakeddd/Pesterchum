-- webchum.db.setup
import config               from require "webchum.config"
import sql                  from require "grasp.query"
import database, run, close from require "webchum.db"
import errorFor             from require "grasp"

statements = {
  -- users
  sql -> create "users", -> columns:
    username: "TEXT NOT NULL UNIQUE"
    password: "TEXT NOT NULL"
    scope:    "TEXT NOT NULL"

  -- tokens
  sql -> create "tokens", -> columns:
    token: "TEXT NOT NULL UNIQUE"
    scope: "TEXT NOT NULL"
  sql -> insert into "tokens", -> values:
    token: "AAAAA"
    scope: "scope:admin"
}

for statement in *statements
  print statement
  unless run statement
    code, message = errorFor database
    error "Could not setup: [[#{statement}]] - (#{code}) #{message}"
    close!

close!