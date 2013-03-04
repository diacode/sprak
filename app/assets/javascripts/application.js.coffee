#= require jquery
#= require jquery_ujs
#= require bootstrap
#= require tokbox
#= require_tree .

$ ->
  if $("body").data("logged")
    $(window).unload -> 
      $.ajax
        url: "/users/disconnect"
        async: false
        type: "PUT"