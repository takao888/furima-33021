class OrdersController < ApplicationController
  before_action :set_item, only: [:index, :create]
  before_action :authenticate_user!, only: :index

  def index
    @order_form = OrderForm.new
    if current_user == @item.user
      redirect_to root_path
      # 現在ログインしているユーザーと出品者が同じならトップページに
    else
      redirect_to root_path
    end
  end

  def new
  end

  def create
    @order_form = OrderForm.new(order_params)
    if @order_form.valid?
    pay
      @order_form.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:order_form).permit(:postal_code, :prefecture_id, :city, :phone_number, :address, :building)
    .merge(user_id: current_user.id,item_id: params[:item_id], token: params[:token])
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def pay
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end
end

