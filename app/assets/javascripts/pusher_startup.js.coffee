jQuery ->
  $("#connect").click ->
    Pusher.log = (message) ->
      window.console.log message  if window.console and window.console.log

    WEB_SOCKET_DEBUG = true
    pusher = new Pusher('74e1628b857d07301719')
    thingChannel = pusher.subscribe('music-channel')

    # Audio Setup
    audio = document.createElement("audio")
    audio_types = [ "ogg", "mpeg", "wav" ]
    for type of audio_types
      type_name = audio_types[type]
      if audio.canPlayType("audio/" + type_name) is "yes" or audio.canPlayType("audio/" + type_name) is "maybe"
        browser_audio_type = type_name
        break

    # Bind to instructions
    thingChannel.bind "play_sound", (sound) ->
      unless browser_audio_type is ""
        pop = document.createElement("audio")
        if browser_audio_type is "mpeg"
          pop.src = "/sounds/pop.mp4"
        else
          pop.src = "/sounds/pop." + browser_audio_type
        unless pop.src is ""
          pop.load()
          pop.play()

    $(this).after("Connected!")
    $(this).hide()
