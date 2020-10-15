class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  # has_one :order

  # with_options presence: true do
  # validates :title
  # end
end
