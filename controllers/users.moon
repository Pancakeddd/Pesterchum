-- webchum.controllers.users
import database      from require "webchum.db.init"
import first, unbool from require "webchum.util.init"
import sql           from require "grasp.query"
grasp                   = require "grasp"
auth                    = require "webchum.util.auth"

class User
  squery:    grasp.squery   database
  update:    grasp.update   database
  lastError: grasp.errorFor database
  close:     => grasp.close database

  new: (username, password, scope="scope:basic") =>
    expect 1, username, {"string"}
    -- create a new user
    if password
      expect 2, password, {"string"}
      expect 3, scope,    {"string"}
      password = auth.hashPassword password
      ok = @.update sql -> insert into "users", -> values:
        :username
        :password
        :scope
      return @.lastError! unless ok
      @username = username
      @password = password
      @scope    = scope
    -- get user
    this = @.squery sql -> select "*", ->
      From "users"
      where :username
    error "User not found" unless "table" == typeof this
    --
    this = first this
    @username = this.username
    @password = this.password
    @scope    = this.scope

  auth: (password) =>
    expect 1, password, {"string"}
    verify = auth.verifyPassword password, @password
    return verify

return {:User}