# Preview all emails at http://localhost:3000/rails/mailers/order_mailer
class OrderMailerPreview < ActionMailer::Preview
def notify_order_placed
 order=Order.first
    OrderMailer.notify_order_placed(order)
  end

end
