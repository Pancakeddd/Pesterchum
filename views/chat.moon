html = require "lapis.html"

class ChatLayout extends html.Widget
  content: =>
    html_5 ->
      head ->
        link rel: "stylesheet", type: "text/css",  href: "/static/materialize/materialize.min.css"
        link rel: "stylesheet", type: "text/css",  href: "/static/chat.css"
        link rel: "stylesheet",                    href: "https://fonts.googleapis.com/icon?family=Material+Icons"
        script src: "/static/jquery/jquery-3.5.1.min.js"
        title "webchum."
      body id: "write", ->
        -- dropdowns
        -- memos
        ul id: "webchum-memos", class: "dropdown-content collection", ->
          li class: "collection-item", -> div ->
            span "#example"
            span class: "badge", "(25)"
          li class: "collection-item", -> div ->
            span "#example"
            span class: "badge", "(25)"
        -- users
        ul id: "webchum-users", class: "dropdown-content collection", ->
          li class: "collection-item", -> div ->
            span "angelicEternity"
            a href: "#!", class: "secondary-content", i class: "material-icons", "send"
          li class: "collection-item", -> div ->
            span "oghuzOrbit"
            a href: "#!", class: "secondary-content", i class: "material-icons", "send"
        -- navbar
        nav class: "teal lighten-2", ->
          div class: "navbar-wrapper", ->
            -- brand
            a href: "#", class: "brand-logo", style: "margin-left: 20px;", "Webchum"
            ul id: "nav-mobile", class: "right hide-on-med-and-down", ->
              -- memos
              li -> a class: "dropdown-trigger", href: "#!", ["data-target"]: "webchum-memos", ->
                b "Memos"
                i class: "material-icons right", "arrow_drop_down"
              -- random encounter
              li -> a href: "#!", -> b "Random"
              -- user list
              li -> a class: "modal-trigger", href: "#user-modal", -> b "Users"
        -- modals
        -- user modal
        div id: "user-modal", class: "modal", ->
          div class: "modal-content", ->
            h4 "Users"
            ul id: "user-list", class: "collection", ->
              for count=1, 75
                li class: "collection-item", -> div ->
                  span "angelicEternity"
                  a href: "#!", class: "secondary-content collection-button tooltipped", ["data-position"]: "top", ["data-tooltip"]: "Send message", -> i class: "material-icons", "send"
                  a href: "#!", class: "secondary-content collection-button tooltipped", ["data-position"]: "top", ["data-tooltip"]: "Block",        -> i class: "material-icons", "close"
                  a href: "#!", class: "secondary-content collection-button tooltipped", ["data-position"]: "top", ["data-tooltip"]: "Add friend",   -> i class: "material-icons", "add"
          div class: "modal-footer", ->
            a href: "#!", class: "modal-close waves-effect waves-light btn", "Close"
        -- content
        @content_for "inner"
        -- materialize
        script src: "/static/materialize/materialize.min.js"
        script src: "/static/chat.js"