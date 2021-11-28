require 'rails_helper'

RSpec.describe Pay, type: :model do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @pay = FactoryBot.build(:pay, user_id: user.id, item_id: item.id)
    end
  
  describe '購入情報と住所情報の保存' do
    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@pay).to be_valid
      end
      it '住所/建物名「building」は空でも保存できること' do
        @pay.building = ''
        expect(@pay).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it '住所/郵便番号「code」が空だと保存できないこと' do
        @pay.code = ''
        @pay.valid?
        expect(@pay.errors.full_messages).to include "Code can't be blank"
      end
      it '住所/郵便番号「code」が半角のハイフンを含む形式でないと保存できないこと' do
        @pay.code = '1234567'
        @pay.valid?
        expect(@pay.errors.full_messages).to include 'Code is invalid'
      end
      it '住所/郵便番号「code」が全角では登録できない' do
        @pay.code = '１１１１１１１'
        @pay.valid?
        expect(@pay.errors.full_messages).to include 'Code is invalid'
      end

      it '住所/都道府県「area_id」に「---」が選択されていると保存ができない' do
        @pay.area_id = 1
        @pay.valid?
        expect(@pay.errors.full_messages).to include "Area can't be blank"
      end
      it '住所/都道府県「area_id」が空では登録できない' do
        @pay.area_id = ''
        @pay.valid?
        expect(@pay.errors.full_messages).to include "Area can't be blank"
      end

      it '住所/市町村「city」が空では登録できない' do
        @pay.city = ''
        @pay.valid?
        expect(@pay.errors.full_messages).to include "City can't be blank"
      end
      it '住所/丁番地「number」が空では登録できない' do
        @pay.number = ''
        @pay.valid?
        expect(@pay.errors.full_messages).to include "Number can't be blank"
      end
      it '電話番号「tel」が空では登録できない' do
        @pay.tel = ''
        @pay.valid?
        expect(@pay.errors.full_messages).to include 'Tel is invalid. Include hyphen(-)'
      end
      it '電話番号「tel」が9桁以下では登録できない' do
        @pay.tel = '12345'
        @pay.valid?
        expect(@pay.errors.full_messages).to include 'Tel is invalid. Include hyphen(-)'
      end
      it '電話番号「tel」が12桁以上では登録できない' do
        @pay.tel = '123456789012345'
        @pay.valid?
        expect(@pay.errors.full_messages).to include 'Tel is invalid. Include hyphen(-)'
      end
      it '電話番号「tel」が全角では登録できない' do
        @pay.tel = '１２３４５６７８９１０'
        @pay.valid?
        expect(@pay.errors.full_messages).to include 'Tel is invalid. Include hyphen(-)'
      end
      it 'お客様顧客「user」は購入の時、user登録完了者でなければ購入と支払いができない' do
        @pay.user_id = ""
        @pay.valid?
        expect(@pay.errors.full_messages).to include "User can't be blank"
      end
      it 'お客様顧客「item」は購入の時、商品選択していなければ購入と支払いができない' do
        @pay.item_id = ""
        @pay.valid?
        expect(@pay.errors.full_messages).to include "Item can't be blank"
      end
      it 'クレジット情報「token」が空では購入と支払いができない' do
        @pay.token = ""
        @pay.valid?
        expect(@pay.errors.full_messages).to include "Token can't be blank"
      end
    end
  end
end

# % bundle exec rspec spec/models/pay_spec.rb
