class OrdersController < ApplicationController
  before_action :authenticate_user!

  def index
    @item = Item.find(params[:item_id])
    @item_order = ItemOrder.new
  end

  def create
    @item = Item.find(params[:item_id])
    @item_order = ItemOrder.new(order_params)
    # binding.pry
    if @item_order.valid?
      pay_item
      @item_order.save
      return redirect_to root_path
    else
      render action: :index
    end
  end

  def order_params
    binding.pry
    params.require(:item_order).permit(:postal_code, :prefecture_id, :city_name, :block_name, :building_name, :phone_number).merge(token: params[:token], item_id: params[:item_id], user_id: current_user.id )
  end

  def pay_item
    Payjp.api_key = "sk_test_521db06cf645b390232a69e1"
      Payjp::Charge.create(
        amount: @item.price,  
        card: order_params[:token],    
        currency: 'jpy'                 
      )
    end
end

