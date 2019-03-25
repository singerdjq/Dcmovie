class MoviesChannel < ApplicationCable::Channel
  def subscribed
    stream_from "movies"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
