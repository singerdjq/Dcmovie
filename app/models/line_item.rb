class LineItem < ApplicationRecord
    belongs_to :order, optional: true
  belongs_to :movie, optional: true
  belongs_to :cart
    def total_price
        movie.price * quantity
    end
end
