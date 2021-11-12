require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能登録' do
      context '商品出品情報の登録ができるとき' do
      it '全ての値が存在すれば登録できる' do
        expect(@item).to be_valid
      end
    end

    context '商品出品情報の登録ができないとき' do
    it '商品画像が空では登録できない' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include "Image can't be blank"
    end
    it '商品名が空では登録できない' do
      @item.item = ''
      @item.valid?
      expect(@item.errors.full_messages).to include "Item can't be blank"
    end
    it '商品の説明が空では登録できない' do
      @item.info = ''
      @item.valid?
      expect(@item.errors.full_messages).to include "Info can't be blank"
    end
    it 'カテゴリーの情報が空では登録できない' do
      @item.category_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include "Category can't be blank"
    end
    it '商品の状態の情報が空では登録できない' do
      @item.rank_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include "Rank can't be blank"
    end
    it '配送料の負担の情報が空では登録できない' do
      @item.postage_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include "Postage can't be blank"
    end    
    it '発送元の地域の情報が空では登録できない' do
      @item.area_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include "Area can't be blank"
    end
    it '発送までの日数の情報が空では登録できない' do
      @item.scheduled_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include "Scheduled can't be blank"
    end
    it '価格の情報が空では登録できない' do
      @item.price = ''
      @item.valid?
      expect(@item.errors.full_messages).to include "Price can't be blank"
    end
    it '価格は、¥300~¥9999999の間でないと登録できない' do
      @item.price = '200'
      @item.valid?
      expect(@item.errors.full_messages).to include "Price is not included in the list"
    end
    it '価格は、半角数字でなければ登録できない' do
      @item.price = 'あああ'
      @item.valid?
      expect(@item.errors.full_messages).to include "Price can't be blank"
    end
  end
end
end

## items table

# | Column             | Type       | Options                        |
# |--------------------|------------|--------------------------------|
# | user               | references | null: false, foreign_key: true |
# | item               | string     | null: false                    |
# | info               | text       | null: false                    |
# | category_id        | integer    | null: false                    |
# | rank_id            | integer    | null: false                    |
# | postage_id         | integer    | null: false                    |
# | area_id            | integer    | null: false                    |
# | scheduled_id       | integer    | null: false                    |
# | price              | integer    | null: false                    |