# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

session = null

sessionConnectedHandler = (event) ->
  subscribeToStreams event.streams
  publisher = TB.initPublisher OPENTOK_API_KEY, 'screen_2', 
                width: '200px'
                height: '112px'
                encodedWidth: 900
                encodedHeight: 506
                
  session.publish(publisher)

streamCreatedHandler = (event) ->
  subscribeToStreams event.streams

subscribeToStreams = (streams) ->
  i = 0
  while i < streams.length
    stream = streams[i]
    if !$("#screen_1").length
      $("<div/>").attr("id", "screen_1").appendTo("#screen_1_wrapper")
    session.subscribe(stream, "screen_1", {width: '900px', height: '506px'}) unless stream.connection.connectionId is session.connection.connectionId
    i++

exceptionHandler = (event) ->
  alert event.message

$ ->
  if $("#chat_view").length
    session_id = $("#session_id").val()
    token = $("#token").val()

    TB.addEventListener "exception", exceptionHandler
    session = TB.initSession(session_id)
    session.addEventListener "sessionConnected", sessionConnectedHandler
    session.addEventListener "streamCreated", streamCreatedHandler
    session.connect OPENTOK_API_KEY, token 
