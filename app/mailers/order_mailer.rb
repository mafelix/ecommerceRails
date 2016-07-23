class OrderMailer < ActionMailer::Base
  default from: "platinumcan@proton.com"
  
  def invoice_email(user, order)
    @user = user
    @order = order

    @cart_items = @order.cart_items
    mail(to: @user.email, subject: "##{@order.id} Invoice PlatinumCan")
  end
end
