Pusher.log = (message) ->
  window.console.log message  if window.console and window.console.log

WEB_SOCKET_DEBUG = true
pusher = new Pusher('74e1628b857d07301719')
thingChannel = pusher.subscribe('music-channel')

thingChannel.bind "play_sound", (sound) ->
  console.log sound