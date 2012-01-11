class MessagesController < ApplicationController

  def create
    Pusher.app_id = ENV['PUSHER_APP_ID']
    Pusher.key = ENV['PUSHER_KEY']
    Pusher.secret = ENV['PUSHER_SECRET']

    Pusher['music-channel'].trigger('play_sound', {time_sent: Time.now})
    head status: 200
  end

  def new
  end

end
