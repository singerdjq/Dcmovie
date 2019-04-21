class OrderMailer < ApplicationMailer
def notify_order_placed(order)  
   @order = order  
   mail to: @order.email, subject: "Thanks order"
  
   end


   end

