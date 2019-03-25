class StoreController < ApplicationController
    skip_before_action :authorize
    include CurrentCart
    before_action :set_cart
  def index
      @movies=Movie.order(:name)
  end
    
    def chart
    end
    
    def news
       
    end
    
    def contact
    end
end
