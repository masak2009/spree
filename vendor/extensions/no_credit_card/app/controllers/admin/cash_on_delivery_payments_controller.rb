class Admin::CashOnDeliveryPaymentsController < Admin::BaseController
helper 'spree/base'

  def edit
    @payment = Payment.find(params[:id])
    @order = Order.find(@payment.order_id)
  end

  def pay
    @payment = Payment.find(params[:id])
    amount = params[:payment][:amount]
    comma = 0
    #detect if amount contains comma or point => We need point as example => "22.90"
    amount = amount.each_char {|x| comma = 1 if x == ","}
    if comma == 1
      amount_array = amount.split(",")
      amount = amount_array[0] + "." + amount_array[1]
      comma == 0
    end
    @payment.update_attribute(:amount,amount)
    redir_url = "/admin/orders/" + @payment.order.number + "/payments"
    redirect_to redir_url
  end

  def new
    @order = Order.find(params[:id])
    CashOnDelivery.create(:order_id => @order.id)
    redir_url = "/admin/orders/" + @order.number + "/payments"
    redirect_to redir_url
  end

end
