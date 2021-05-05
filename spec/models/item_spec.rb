require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品新規出品' do
    context '出品できるとき' do
      it '全ての条件を満たしていれば保存できること' do
        expect(@item).to be_valid
      end
    end

    context '出品できないとき' do
      it 'imageが空では登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Image can't be blank"
      end
      it 'item_nameが空では登録できない' do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Item name can't be blank"
      end
      it 'explanationが空では登録できない' do
        @item.explanation = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Explanation can't be blank"
      end
      it 'category_idが--では登録できない' do
        @item.category_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('Category Select')
      end
      it 'condition_idが--では登録できない' do
        @item.condition_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include 'Condition Select'
      end
      it 'delivery_cost_idが--では登録できない' do
        @item.delivery_cost_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include 'Delivery cost Select'
      end
      it 'prefecture_idが--では登録できない' do
        @item.prefecture_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include 'Prefecture Select'
      end
      it 'delivery_time_idが--では登録できない' do
        @item.delivery_time_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include 'Delivery time Select'
      end
      it 'priceが空では登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Price can't be blank"
      end
      it 'priceが全角文字では登録できない' do
        @item.price = '９００００'
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price is not a number'
      end
      it 'priceが半角英字では登録できない' do
        @item.price = 'qwerty'
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price is not a number'
      end
      it 'priceが半角英数字混合では登録できない' do
        @item.price = 'qwe1234'
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price is not a number'
      end
      it 'priceが300未満では登録できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price must be greater than or equal to 300'
      end
      it 'priceが9,999,999超過では登録できない' do
        @item.price = 99_999_999
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price must be less than or equal to 9999999'
      end
    end
  end
end
