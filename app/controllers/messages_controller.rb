class MessagesController < ApplicationController

  def create
    Pusher.app_id = ENV['PUSHER_APP_ID']
    Pusher.key = ENV['PUSHER_KEY']
    Pusher.secret = ENV['PUSHER_SECRET']

    Pusher['music-channel'].trigger('play_sound', {foo: "bar", baz: "qiz"})
    head status: 200
  end

end
