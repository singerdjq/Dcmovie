class OrderMailer < ApplicationMailer
def notify_order_placed(order)  #建立通知信
   @order = order   #记录订单(为下面步骤3的order_url参数传入做准备)
   mail to: @order.email, subject: "Thanks order"
  
   end


   end

