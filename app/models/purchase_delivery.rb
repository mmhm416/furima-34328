class PurchaseDelivery
  
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :zip_code, :prefecture_id, :city, :address, :building, :phone_no, :purchase_id, :token

  with_options presence: true do
    validates :zip_code
    validates :city
    validates :address
    validates :phone_no
  end

  validates :prefecture_id, numericality: { other_than: 0, message: 'Select' }

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    Delivery.create(zip_code: zip_code, prefecture_id: prefecture_id, city: city, address: address, building: building, phone_no: phone_no, purchase_id: purchase.id)
  end

end

