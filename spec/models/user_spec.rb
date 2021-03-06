require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it '全ての値が存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end

    context '新規登録できないとき' do
      it 'nicknameが空では登録できない' do
        @user.nickname = '' # nicknameの値を空にする
        @user.valid?
        expect(@user.errors.full_messages).to include "Nickname can't be blank"
      end
      it 'emailが空では登録できない' do
        @user.email = '' # emailの値を空にする
        @user.valid?
        expect(@user.errors.full_messages).to include "Email can't be blank"
      end
      it 'passwordが空では登録できない' do
        @user.password = '' # passwordの値を空にする
        @user.valid?
        expect(@user.errors.full_messages).to include "Password can't be blank"
      end
      it 'last_nameが空では登録できない' do
        @user.last_name = '' # last_nameの値を空にする
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name can't be blank"
      end
      it 'first_nameが空では登録できない' do
        @user.first_name = '' # first_nameの値を空にする
        @user.valid?
        expect(@user.errors.full_messages).to include "First name can't be blank"
      end
      it 'last_name_kanaが空では登録できない' do
        @user.last_name_kana = '' # last_name_kanaの値を空にする
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name kana can't be blank"
      end
      it 'first_name_kanaが空では登録できない' do
        @user.first_name_kana = '' # first_name_kanaの値を空にする
        @user.valid?
        expect(@user.errors.full_messages).to include "First name kana can't be blank"
      end
      it 'birth_dateが空では登録できない' do
        @user.birth_date = '' # birth_dateの値を空にする
        @user.valid?
        expect(@user.errors.full_messages).to include "Birth date can't be blank"
      end
      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'メールアドレスに@がないと登録できない' do
        @user.email = 'aaa111email.com'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Email is invalid'
      end
      it 'passwordが6文字以上でなければ登録できない' do
        @user.password = '11111'
        @user.valid?
        expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
      end
      it 'passwordが半角英数字混合でなければ登録できない' do
        @user.password = '111111'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Password には半角英数の混合で設定してください'
      end
      it 'passwordとpassword（確認）は値が一致しないと登録できない' do
        @user.password = '11111'
        @user.valid?
        expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
      end
      it 'last_nameは全角（漢字・ひらがな・カタカナ）でなければ登録できない' do
        @user.last_name = '11111'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Last name 全角文字を使用してください'
      end
      it 'first_nameは全角（漢字・ひらがな・カタカナ）でなければ登録できない' do
        @user.first_name = '11111'
        @user.valid?
        expect(@user.errors.full_messages).to include 'First name 全角文字を使用してください'
      end
      it 'last_name_kanaは全角（カタカナ）でなければ登録できない' do
        @user.last_name_kana = '11111'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Last name kana カタカナを使用してください'
      end
      it 'first_name_kanaは全角（カタカナ）でなければ登録できない' do
        @user.first_name_kana = '11111'
        @user.valid?
        expect(@user.errors.full_messages).to include 'First name kana カタカナを使用してください'
      end
      it 'passwordが英字のみでは登録できない' do
        @user.password = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Password には半角英数の混合で設定してください'
      end
      it 'passwordが全角では登録できない' do
        @user.password = '１１１１１１'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Password には半角英数の混合で設定してください'
      end
    end
  end
end
# % bundle exec rspec spec/models/user_spec.rb
