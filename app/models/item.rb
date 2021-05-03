class Item < ApplicationRecord
  with_options presence: true do
    validates :item_name
    validates :explanation
    validates :category_id
    validates :condition_id
    validates :delivery_cost_id
    validates :prefecture_id
    validates :delivery_time_id
    validates :price
  end
  belongs_to :user
end
