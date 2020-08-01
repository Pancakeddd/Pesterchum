-- webchum.controllers.tokens
import database      from require "webchum.db"
import first, unbool from require "webchum.util"
import sql           from require "grasp.query"
grasp                   = require "grasp"

-- create a new token
generateToken = ->
  tkn = ""
  for i=1,5
    math.randomseed os.time! + i*i + i
    x = math.random 65, 122
    while (x > 90) and (x < 97)
      x = math.random 65, 122
    tkn ..= string.char x
  tkn

class Token
  squery:    grasp.squery   database
  update:    grasp.update   database
  lastError: grasp.errorFor database
  close:     => grasp.close database

  new: (token) =>
    expect 1, token, {"string"}
    -- create a new token
    if token\match "^scope"
      scope = token
      token = generateToken!
      ok    = @.update sql -> insert into "tokens", -> values:
        :scope, :token
      return @.lastError! unless ok
      @scope = scope
      @token = token
      return
    -- get token
    this = @.squery sql -> select "*", ->
      From "tokens"
      where :token
    error "Token not found" unless "table" == typeof this
    --
    this = first this
    @scope = this.scope
    @token = this.token

  delete: =>
    ok = @.update sql -> delete ->
      From "tokens"
      where token: @token
    return @.lastError! unless ok
    return true

return {:Token}