class Order < ApplicationRecord
    has_many :line_items, dependent: :destroy
    enum pay_type: {
        "Check" =>0,
        "Credit card" =>1,
        "Purchase order" =>2
        }
    validates :name, presence: true, uniqueness: true, length: { maximum: 50 }
    validates :address,  presence: true
    validates :pay_type, inclusion: pay_types.keys
     VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: true
    
    def add_line_items_form_cart(cart)
        cart.line_items.each do |item|
            item.cart_id = nil
            line_items << item
end
end
end
