import Widget from require "lapis.html"

class Register extends Widget
  content: =>
    --iframe src: "/empty"
    div id: "login", align: "center", ->
      h1 "register."
      form action: "", method: "post", ->
        input type: "hidden",   name: "csrf_token", value: @csrf_token
        input type: "text",     name: "username",   placeholder: "username."
        input type: "password", name: "password",   placeholder: "password."
        input type: "text",     name: "regtoken",   placeholder: "regtoken."
        input type: "submit",   name: "submit",     value: ">"