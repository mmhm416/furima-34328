class Item < ApplicationRecord
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture

  with_options numericality: { other_than: 0, message: 'Select' } do
  validates :category_id
  validates :condition_id
  validates :delivery_cost_id
  validates :prefecture_id
  validates :delivery_time_id
  end

  with_options presence: true do
    validates :item_name
    validates :explanation
    validates :price
    validates :image
  end

  validates :price, format: { with: /\A[\d]+\z/}
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }

  has_one_attached :image

  belongs_to :user
  
end
