require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    @purchase_delivery = FactoryBot.build(:purchase_delivery, user_id: @user.id, item_id: @item.id)
  end
  
  describe '商品購入機能' do
    context '購入できる時' do
      it '全ての項目を記入していれば保存できること' do
        expect(@purchase_delivery).to be_valid
      end
      it '建物名が空欄でも保存できること' do
        @purchase_delivery.building = ""
        expect(@purchase_delivery).to be_valid
      end
    end

    context '購入できない時' do
      it '郵便番号が空欄では保存できないこと' do
        @purchase_delivery.zip_code = ""
        @purchase_delivery.valid?
        expect(@purchase_delivery.errors.full_messages).to include "Zip code can't be blank"
      end
      it '郵便番号に"-"が入っていないと保存できないこと' do
        @purchase_delivery.zip_code = "1234567"
        @purchase_delivery.valid?
        expect(@purchase_delivery.errors.full_messages).to include "Zip code input must be of the form XXX-XXXX"
      end
      it '都道府県が空欄では保存できないこと' do
        @purchase_delivery.prefecture_id = 0
        @purchase_delivery.valid?
        expect(@purchase_delivery.errors.full_messages).to include 'Prefecture Select'
      end
      it '市区町村が空欄では保存できないこと' do
        @purchase_delivery.city = ""
        @purchase_delivery.valid?
        expect(@purchase_delivery.errors.full_messages).to include "City can't be blank"
      end
      it '住所が空欄では保存できないこと' do
        @purchase_delivery.address = ""
        @purchase_delivery.valid?
        expect(@purchase_delivery.errors.full_messages).to include "Address can't be blank"
      end
      it '電話番号が空欄では保存できないこと' do
        @purchase_delivery.phone_no = ""
        @purchase_delivery.valid?
        expect(@purchase_delivery.errors.full_messages).to include "Phone no can't be blank"
      end
      it '電話番号が11桁以上では保存できないこと' do
        @purchase_delivery.phone_no = "090123456789"
        @purchase_delivery.valid?
        expect(@purchase_delivery.errors.full_messages).to include "Phone no is too long (maximum is 11 characters)"
      end
      it 'tokenが空では保存できないこと' do
        @purchase_delivery.token = nil
        @purchase_delivery.valid?
        expect(@purchase_delivery.errors.full_messages).to include "Token can't be blank"
      end
      it 'userが紐付いていないと保存できないこと' do
        @purchase_delivery.user_id = nil
        @purchase_delivery.valid?
        expect(@purchase_delivery.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが紐付いていないと保存できないこと' do
        @purchase_delivery.item_id = nil
        @purchase_delivery.valid?
        expect(@purchase_delivery.errors.full_messages).to include("Item can't be blank")
      end
    end

  end
end
