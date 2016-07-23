# Preview all emails at http://localhost:3000/rails/mailers/order_mailer
class OrderMailerPreview < ActionMailer::Preview
  def invoice_email
    user = User.find(5)
    order = Order.last
    OrderMailer.invoice_email(user, order)
  end
end
