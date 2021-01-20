class OrdersController < ApplicationController

  def index
    @order_form = OrderForm.new(order_params)
    @item = Item.find(params[:item_id])
  end

  def create
    # @order_form = OrderForm.new(order_params)
    # if @oreder_form.valid?
    #   @order_form.save
    #   redirect_to action: :index
    # else
    #   render action: :new
    # end
  end

  private

  def order_params
    params.permit(:card_number, :card_exp_month, :card_exp_year, :card_cvc, :postal_code, :prefecture_id, :city, :phone_number, :address)
  end
end
# require(:order_form).