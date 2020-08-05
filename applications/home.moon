-- applications.access
import respond_to from require "lapis.application"
import config     from require "webchum.config"
lapis                = require "lapis"
csrf                 = require "lapis.csrf"

class Access extends lapis.application
  -- layout
  layout: require "views.chat"
  -- /home
  "/home": =>
    render: "home", layout: "chat"
  "/test": =>
    render: "test", layout: "chat"