html = require "lapis.html"

class DefaultLayout extends html.Widget
  content: =>
    html_5 ->
      head ->
        link rel: "stylesheet", type: "text/css",  href: "/static/refine.css"
        link rel: "stylesheet", type: "text/css",  href: "/static/extra.css"
        title "webssg."
      body id: "write", ->
        -- content
        @content_for "inner"