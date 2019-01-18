class OrderMailer < ApplicationMailer

  layout 'mailer'

  def order_email(user, order)
    @user = user
    @order = order
    @lineitems = LineItem.where(order_id: @order.id)
    mail(to: @user.email, subject: "Confirmation for order: #{@order.id}")
  end
end
