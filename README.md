# Idea

Play some music via cell phones

# Workflow

1. Have a ton of mobile phones bring up a webpage
2. Webpage connects phones to Pusher
3. Each connected device is either assigned a note, or chooses one
4. "Controller" sends "Play" signal to phones, which plays tone
5. ???
6. Profit!

# Latency

The biggest question here for a musical application is latency.

I ran some tests off Heroku and got an average of 849ms.

Granted, these are based off the server time and the phone's time, so the exact number may not be accurate.