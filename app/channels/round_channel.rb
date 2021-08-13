class RoundChannel < ApplicationCable::Channel
  def subscribed
    stream_from "round_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
