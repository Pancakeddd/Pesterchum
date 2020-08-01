-- applications.access
import respond_to from require "lapis.application"
import config     from require "webchum.config"
lapis                = require "lapis"
csrf                 = require "lapis.csrf"

class Access extends lapis.application
  -- layout
  layout: require "views.layout"
  -- /token
  "/token": =>
    return (@html -> h1 "no permission.") unless @session.user and @session.user.scope == "scope:admin"
    import Token from require "controllers.tokens"
    token = Token "scope:basic"
    @html -> h1 token.token
  -- /whoami
  "/whoami": =>
    if @session.user
      return @html -> h1 @session.user.username
    else
      return @html -> h1 "?"
  -- /logout
  "/logout": =>
    @session.user = nil
    redirect_to: "/"
  -- /login
  "/login": respond_to {
    GET: =>
      @csrf_token = csrf.generate_token @
      return render: "login"
    POST: =>
      csrf.assert_token @
      --
      import User from require "controllers.users"
      user = User @params.username
      unless user
        return @html -> p "user not found."
      --
      if user\auth @params.password
        @session.user = user
        return redirect_to: "/"
      else
        return @html -> p "invalid password."
  }
  -- /register
  "/register": respond_to {
    GET: =>
      @csrf_token = csrf.generate_token @
      return render: "register"
    POST: =>
      csrf.assert_token @
      --
      import Token from require "controllers.tokens"
      token = Token @params.regtoken
      return (@html -> p "invalid token.") unless token
      token\delete!
      --
      import User from require "controllers.users"
      user = User @params.username, @params.password, @params.scope
      return (@html -> p "could not create user.") unless user
      user\close!
      redirect_to: "/login"
  }