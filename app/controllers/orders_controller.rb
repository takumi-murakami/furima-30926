class OrdersController < ApplicationController
  before_action :authenticate_user!

  def index
    @item = ItemOrder.find(params[:id])
    @item_order = ItemOrder.new
  end

  def create
    @item_order = ItemOrder.new(order_params)
    if @item_order.valid?
      # pay_item
      @item_order.save
      redirect_to root_path
    else
      render action: :index
    end
  end

  def order_params
    params.require(:item_order).permit(:postal_code, :prefecture_id, :city_name, :block_name, :building_name, :phone_nember).merge(token: params[:token])
  end

  # def pay_item
  #   Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
  #     Payjp::Charge.create(
  #       amount: order_params[:price],  # 商品の値段
  #       card: order_params[:token],    # カードトークン
  #       currency: 'jpy'                 # 通貨の種類（日本円）
  #     )
  #   end
end
