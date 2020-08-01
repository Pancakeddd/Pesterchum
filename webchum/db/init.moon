-- webchum.db
import config from require "webchum.config"
grasp            = require "grasp"

assert config.webchum.db,          "Database configuration not found"
assert config.webchum.db.location, "Database location not specified"
db = grasp.Database config.webchum.db.location

{
  database:    db
  run:         grasp.update db
  close:    -> grasp.close db
}