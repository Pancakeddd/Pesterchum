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
        -- user info
        ul id: "user-info", class: "dropdown-content collection", ->
          li class: "collection-item", -> div ->
            span "Logout"
        -- moods
        ul id: "moods", class: "dropdown-content collection", ->
          for count=1, 23
            li class: "collection-item", -> div ->
              img src: "https://icons.iconarchive.com/icons/designbolts/emoji/128/Emoji-Glad-icon.png", width: 16, height: 16, alt: "Chummy", class: "circle"
              span "Chummy"
        -- navbar
        nav class: "teal lighten-2", ->
          div class: "navbar-wrapper", ->
            -- brand
            a href: "#", class: "brand-logo", style: "margin-left: 20px;", "Webchum"
            ul id: "nav-mobile", class: "right hide-on-med-and-down", ->
              -- memos
              li -> a class: "modal-trigger", href: "#memo-modal", -> b "Memos"
              -- random encounter
              li -> a href: "#!", -> b "Random"
              -- user list
              li -> a class: "modal-trigger", href: "#user-modal", -> b "Users"
              -- logs
              li -> a class: "modal-trigger", href: "#log-modal", -> b "Logs"
              -- help
              li -> a href: "#!", -> b "Help"
              -- mood picker
              li -> a class: "dropdown-trigger white black-text", href: "#", ["data-target"]: "moods", ->
                img src: "https://icons.iconarchive.com/icons/designbolts/emoji/128/Emoji-Glad-icon.png", width: 16, height: 16, alt: "Chummy", class: "circle"
                span style: "margin-left: 10px; margin-right: 135px;", "Chummy"
              li -> a class: "dropdown-trigger", href: "#", ["data-target"]: "user-info", ->
                span id: "username", "angelicEternity"
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
            div class: "row", ->
              div class: "col s11", ->
                input id: "search-users", type: "search", placeholder: "Search..."
              div class: "col s1", ->
                a href: "#!", class: "modal-close waves-effect waves-light btn", "Close"
        -- memo modal
        div id: "memo-modal", class: "modal", ->
          div class: "modal-content", ->
            h4 "Memos"
            ul id: "memo-list", class: "collection", ->
              for count=1, 75
                li class: "collection-item", -> div ->
                  span "#webchum"
                  a href: "#!", class: "secondary-content collection-button tooltipped", ["data-position"]: "top", ["data-tooltip"]: "Join", -> i class: "material-icons", "send"
                  span class: "badge", "(25)"
          div class: "modal-footer", ->
            div class: "row", ->
              div class: "col s7", ->
                input id: "search-memos", type: "search", placeholder: "Search..."
              div class: "col s1", ->
                p ->
                  label ->
                    input type: "checkbox"
                    span "Invite"
              div class: "col s1", ->
                p ->
                  label ->
                    input type: "checkbox"
                    span "Hidden"
              div class: "col s1", ->
                a href: "#!", class: "modal-close waves-effect waves-light btn", "Close"
              div class: "col s2", ->
                a href: "#!", class: "modal-close waves-effect waves-light btn", "Create memo"
        -- log modal
        div id: "log-modal", class: "modal", ->
          div class: "modal-content", ->
            h4 "Logs"
            ul id: "log-list", class: "collection", ->
              for count=1, 75
                li class: "collection-item", -> div ->
                  span "angelicEternity"
                  a href: "#!", class: "secondary-content collection-button tooltipped", ["data-position"]: "top", ["data-tooltip"]: "Open log", -> i class: "material-icons", "open_in_full"
                  a href: "#!", class: "secondary-content collection-button tooltipped", ["data-position"]: "top", ["data-tooltip"]: "Delete",   -> i class: "material-icons", "delete"
          div class: "modal-footer", ->
            div class: "row", ->
              div class: "col s11", ->
                input id: "search-logs", type: "search", placeholder: "Search..."
              div class: "col s1", ->
                a href: "#!", class: "modal-close waves-effect waves-light btn", "Close"
        -- content
        @content_for "inner"
        -- materialize
        script src: "/static/materialize/materialize.min.js"
        script src: "/static/chat.js"