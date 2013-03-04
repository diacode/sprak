#= require jquery
#= require jquery_ujs
#= require bootstrap
#= require select2
#= require tokbox
#= require underscore
#= require backbone
#= require messenger
#= require_tree .

$ ->
  $._messengerDefaults = {
    extraClasses: 'messenger-fixed messenger-theme-air messenger-on-bottom messenger-on-right'
  }

  $('select').select2
    allowClear: true
  
  if $("body").data("logged")
    $(window).unload -> 
      $.ajax
        url: "/users/disconnect"
        async: false
        type: "PUT"