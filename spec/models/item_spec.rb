require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end
  describe '出品' do
    context '出品できるとき' do
      it '全ての必須項目が正しく入力されていれ出品できる' do
        expect(@item).to be_valid
      end
    end
    context '出品できないとき' do
      it '画像がないと出品できない' do
      end
      it '商品名がないと出品できない' do
        @item.title = ''
        @item.valid?
        expect(item.errors.full_messages).to include("Title can't be blank")
      end
      it '商品の説明がないと出品できない' do
      end
      it 'カテゴリーがないと出品できない' do
      end
      it '商品の状態がないと出品できない' do
      end
      it '配送料の負担がないと出品できない' do
      end
      it '発送元の地域がないと出品できない' do
      end
      it '発送までの日数がないと出品できない' do
      end
      it '価格がないと出品できない' do
        @item.price = ''
        @item.valid?
        expect(item.errors.full_messages).to include("Price can't be blank")
      end
      it '価格が300円以下だと出品できない' do
        @item.price = '299'
        @item.valid?
        expect(item.errors.full_messages).to include("Price が300円以下では出品できない")
      end
      it '価格が9,999,999円以上だと出品できない' do
      end
    end
  end
end