import Widget from require "lapis.html"

class Home extends Widget
  content: =>
    div class: "row", ->
      -- tabs
      div class: "col s9", ->
        ul class: "tabs", ->
          li class: "tab", -> a href: "#test1", ->
            img style: "margin-right: 10px;", src: "https://icons.iconarchive.com/icons/designbolts/emoji/128/Emoji-Glad-icon.png", width: 16, height: 16, alt: "Chummy", class: "circle"
            span "testOne"
            span class: "close-button", -> i class: "tiny material-icons", "close"
          li class: "tab", -> a href: "#test2", ->
            img style: "margin-right: 10px;", src: "https://icons.iconarchive.com/icons/designbolts/emoji/128/Emoji-Glad-icon.png", width: 16, height: 16, alt: "Chummy", class: "circle"
            span "testTwo"
            span class: "close-button", -> i class: "tiny material-icons", "close"
          li class: "tab", -> a href: "#test3", ->
            span "#test3"
            span class: "close-button", -> i class: "tiny material-icons", "close"
      -- tab content
      div id: "tab-container", ->
        div id: "test1", class: "col s9", -> p class: "chatbox", "yesyesyes"
        div id: "test2", class: "col s9", -> p class: "chatbox", "nonono"
        div id: "test3", class: "col s9", -> p class: "chatbox", "maybemaybemaybe"
      -- chumroll
      div class: "col s3", ->
        div class: "container", ->
          b "Chumroll"
          ul class: "collection", ->
            li class: "collection-item", ->
              img src: "https://icons.iconarchive.com/icons/designbolts/emoji/128/Emoji-Glad-icon.png", width: 16, height: 16, alt: "Chummy", class: "circle"
              span style: "margin-left: 5px;", class: "title", "userHandle"
              a href: "#!", class: "secondary-content", -> i class: "material-icons", "send"
            li class: "collection-item", ->
              img src: "https://icons.iconarchive.com/icons/designbolts/emoji/128/Emoji-Glad-icon.png", width: 16, height: 16, alt: "Chummy", class: "circle"
              span style: "margin-left: 5px;", class: "title", "userHandle"
              a href: "#!", class: "secondary-content", -> i class: "material-icons", "send"
            li class: "collection-item", ->
              img src: "https://icons.iconarchive.com/icons/designbolts/emoji/128/Emoji-Glad-icon.png", width: 16, height: 16, alt: "Chummy", class: "circle"
              span style: "margin-left: 5px;", class: "title", "userHandle"
              a href: "#!", class: "secondary-content", -> i class: "material-icons", "send"
