import config from require "webchum.config"
lapis            = require "lapis"
require "false.shit"

class Index extends lapis.Application
  -- layout
  layout: require "views.layout"
  -- load other apps
  for app in *config.webchum.apps
    @include "applications.#{app}"
  -- routes
  "/": =>
    "Welcome to Lapis #{require "lapis.version"}!"