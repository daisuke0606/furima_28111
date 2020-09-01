require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    @order_address = FactoryBot.build(:order_address)
  end

  describe '発送先情報の登録' do
    context '発送先情報登録がうまくいくとき' do
      it '建物名以外が記述されていれば登録できる' do
        @order_address.valid?
      end
    end

    context '発送先情報がうまくいかないとき' do
      it '郵便番号が空だと登録できない' do
        @order_address.post_code = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Post code can't be blank")
      end
      it '郵便番号に(-)無しでは登録できない' do
        @order_address.post_code = '1234567'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
      end
      it '都道府県が空だと登録できない' do
        @order_address.prefectures_id = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Prefectures can't be blank", "Prefectures を選択してください")
      end
      it '市町村が空だと登録できない' do
        @order_address.city = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("City can't be blank")
      end
      it '番地が空だと登録できない' do
        @order_address.block = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Block can't be blank")
      end
      it '電話番号が9桁だと登録できない' do
        @order_address.phone = '080123456'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone is invalid. Include 10-11")
      end
      it '電話番号が12桁だと登録できない' do
        @order_address.phone = '080123456789'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone is invalid. Include 10-11")
      end
      it 'ユーザー情報が無いと登録できない' do
        @order_address.user_id = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("User can't be blank")
      end
      it '商品情報が無いと登録できない' do
        @order_address.item_id = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
