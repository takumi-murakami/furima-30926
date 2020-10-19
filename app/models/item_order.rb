class ItemOrder
  include ActiveModel::Model
  attr_accessor :token, :postal_code, :prefecture_id, :city_name, :block_name, :building_name, :phone_number
  # ここにitemカラムも追加？
  # :title, :price, :image

  with_options presense: true do
    validates :token, :prefecture_id, :city_name, :block_name
    validates :postal_code, format: { with: /\A[-]?[0-9]+(\.[0-9]+)?\z/ }, length: { is: 8 }
    validates :phone_nember, format: { with: /\A[0-9]+\z/ }, length: { is: 11 }
  end
# 以下itemモデルのvalidation
    # with_options presence: true do
    #   validates :title, :text, :image
      
    #   with_options numericality: { other_than: 1 } do
    #     validates :category_id, :sales_status_id, :shipping_fee_status_id, :prefecture_id, :scheduled_delivery_id
    #   end
  
    #   with_options format: { with: /\A[0-9]+\z/ } do
    #     validates :price, numericality: { greater_than: 300, less_than: 9999999 } 
    #   end
    # end

    def save
      # item = Item.create(title: title, price: price, image: image)
      Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city_name: city_name, block_name: block_name, building_name: building_name, phone_number: phone_number)
      Order.create(user_id: user.id, item_id: item.id)
    end
end

