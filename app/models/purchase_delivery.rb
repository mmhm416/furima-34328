class PurchaseDelivery
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :zip_code, :prefecture_id, :city, :address, :building, :phone_no, :purchase_id, :token, :price

  with_options presence: true do
    validates :zip_code
    validates :city
    validates :address
    validates :phone_no
    validates :token
    validates :user_id
    validates :item_id
  end

  validates :prefecture_id, numericality: { other_than: 0, message: 'Select' }
  validates :phone_no, length: { maximum: 11 }
  validates :zip_code, format: { with: /\A\d{3}-\d{4}\z/, message: 'input must be of the form XXX-XXXX' }

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    Delivery.create(zip_code: zip_code, prefecture_id: prefecture_id, city: city, address: address, building: building,
                    phone_no: phone_no, purchase_id: purchase.id)
  end
end
