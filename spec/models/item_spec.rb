require 'rails_helper'

describe Item do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '商品を出品できる時' do
      it 'フォームを全て記入すれば出品できる' do
        expect(@item).to be_valid
      end
    end

    context '商品を出品できない時' do
      it 'imageが空の時' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it 'nameが空の時' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end

      it 'explainが空の時' do
        @item.explain = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Explain can't be blank")
      end

      it 'category_idが1の時' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Category must be other than 1')
      end

      it 'status_idが1の時' do
        @item.status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Status must be other than 1')
      end

      it 'delivery_fee_idが1の時' do
        @item.delivery_fee_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Delivery fee must be other than 1')
      end

      it 'prefecture_idが1の時' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Prefecture must be other than 1')
      end

      it 'shipping_date_idが1の時' do
        @item.shipping_date_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Shipping date must be other than 1')
      end

      it 'priceが空の時' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it 'priceが数字でない時' do
        @item.price = 'sssss'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not number')
      end

      it 'priceが300円から9999999円でない時' do
        @item.price = '100'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is from 300yen to 9999999yen')
      end
    end
  end
end
