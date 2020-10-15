class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  has_one_attached :image
  belongs_to_active_hash :category
  belongs_to_active_hash :sales_status
  belongs_to_active_hash :shipping_fee_status
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :scheduled_delivery
  # has_one :order

  with_options presence: true do
    validates :title, :text, :category_id, :sales_status_id, :shipping_fee_status_id, :prefecture_id, :scheduled_delivery

    with_options format: {with: /\A[0-9]+\z/} do
      validates :price, length: { in: (300..9999999)}
    end
  end
end
