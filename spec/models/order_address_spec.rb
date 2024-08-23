require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    @order_address = FactoryBot.build(:order_address)
    @user = FactoryBot.build(:user)
    @item = FactoryBot.build(:item)
  end
  describe '購入処理' do
    context '購入できるとき' do
      it '全ての必須項目が正しく入力されていれば購入できる' do
        expect(@order_address).to be_valid
      end
      it '建物名が空白でも購入できる' do
        @order_address.building_name = ''
        expect(@order_address).to be_valid
      end
    end
    context '購入できないとき' do
      it 'tokenが空では登録できないこと' do
        order_address = FactoryBot.build(:order_address, token: nil)
        expect(order_address).to_not be_valid
        expect(order_address.errors.full_messages).to include("Token can't be blank")
      end
      it '郵便番号が空白だと購入できない' do
        @order_address.postal_code = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Postal code can't be blank"
      end
      it '郵便番号が3桁ハイフン4桁の半角文字じゃないと購入できない' do
        @order_address.postal_code = '1231234'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Postal code is invalid. Include hyphen(-)"
      end
      it '都道府県が空白だと購入できない' do
        @order_address.area_id = 1
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Area can't be blank"
      end
      it '市区町村が空白だと購入できない' do
        @order_address.city = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "City can't be blank"
      end
      it '番地が空白だと購入できない' do
        @order_address.house_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "House number can't be blank"
      end
      it '電話番号が空白だと購入できない' do
        @order_address.phone_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Phone number can't be blank"
      end
      it '電話番号が11桁以上だと購入ができない' do
        @order_address.phone_number = '000111122223'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Phone number is invalid. Include 10 or 11 digits only"
      end
      it '電話番号が9桁以下だと購入ができない' do
        @order_address.phone_number = '123456789'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Phone number is invalid. Include 10 or 11 digits only"
      end
      it '電話番号が全角だと購入ができない' do
        @order_address.phone_number = '０００１１１１２２２２'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Phone number is invalid. Include 10 or 11 digits only"
      end
      it 'user_idが空では購入できない' do
        @order_address.user_id = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("User can't be blank")
      end
      it 'item_idが空では購入できない' do
        @order_address.item_id = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
