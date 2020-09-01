class OrdersController < ApplicationController
  before_action :set_item, only: [:index, :create]
  before_action :authenticate_user!
  before_action :user_item
  before_action :re_item
  def index
    @order = OrderAddress.new
  end

  def create
    @order = OrderAddress.new(order_params)
    if @order.valid?
      pay_item
      @order.save
      redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def order_params
    params.permit(:item_id, :post_code, :prefectures_id, :city, :block, :building, :phone, :token).merge(user_id: current_user.id)
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  # PAY.JPテスト秘密鍵
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token], # カードトークン
      currency: 'jpy'                 # 通貨の種類(日本円)
    )
  end

  def user_item
    item = Item.find(params[:item_id])
      if current_user.id == item.user_id
        redirect_to root_path
      end
  end

  def re_item
    item = Item.find(params[:item_id])
      unless item.order.nil?
        redirect_to root_path
      end
  end
end
