class Item < ApplicationRecord
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :delivery_cost
  belongs_to :prefecture
  belongs_to :delivery_time

  with_options presence: true do
    validates :image
    validates :item_name
    validates :explanation
    validates :price
  end

  with_options numericality: { other_than: 0, message: 'Select' } do
    validates :category_id
    validates :condition_id
    validates :delivery_cost_id
    validates :prefecture_id
    validates :delivery_time_id
  end

  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }

  belongs_to :user
  has_one :purchase
end
