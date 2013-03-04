#= require jquery
#= require jquery_ujs
#= require bootstrap
#= require select2
#= require tokbox
#= require_tree .

$ ->
  $('select').select2
    allowClear: true
  
  if $("body").data("logged")
    $(window).unload -> 
      $.ajax
        url: "/users/disconnect"
        async: false
        type: "PUT"