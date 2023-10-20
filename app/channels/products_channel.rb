class ProductsChannel < ApplicationCable::Channel
  def subscribed
    stream_for "products"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
