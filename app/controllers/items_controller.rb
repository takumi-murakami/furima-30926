class ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.create(item_params)
    # if @item.save
    #   redirect_to path
    # end
  end

  private
  def item_params
  params.require(:item).permit(:title, :text, :category_id, :sales_status_id, :shipping_fee_status_id, :prefecture_id, :scheduled_delivery_id, :genre_id, :price, :image).merge(user_id: current_user.id)
  end
end
