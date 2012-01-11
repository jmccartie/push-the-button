jQuery ->
  $("#connect").click ->
    # Audio Setup
    audio = document.createElement("audio")
    audio_types = [ "ogg", "mpeg", "wav", "mp3" ]
    for type of audio_types
      type_name = audio_types[type]
      if audio.canPlayType("audio/" + type_name) is "yes" or audio.canPlayType("audio/" + type_name) is "maybe"
        browser_audio_type = type_name
        break

    # iOS? Load a sound and hit pause. Now we can play sounds...
    if (navigator.userAgent.match(/iPhone/i)) or (navigator.userAgent.match(/iPod/i)) or (navigator.userAgent.match(/iPad/i))
      audio.src = "/sounds/pop.mp4"
      audio.load()
      audio.pause()

    # Connect to Pusher
    Pusher.log = (message) ->
      window.console.log message  if window.console and window.console.log

    WEB_SOCKET_DEBUG = true
    pusher = new Pusher('74e1628b857d07301719')
    thingChannel = pusher.subscribe('music-channel')

    # Bind to instructions
    thingChannel.bind "play_sound", (sound) ->
      time_sent = new Date(sound.time_sent)
      now = new Date()
      unless browser_audio_type is ""
        if browser_audio_type is "mpeg"
          audio.src = "/sounds/pop.mp4"
        else
          audio.src = "/sounds/pop." + browser_audio_type
        unless audio.src is ""
          audio.load()
          audio.play()
          $("#info").html("<p>Sound Played! Time Delay: #{now - time_sent}ms</p>")


    $(this).after("Connected!")
    $(this).hide()


