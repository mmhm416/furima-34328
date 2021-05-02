require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it 'nickname, email、password, password_confirmation,
        first_name, last_name, first_name_kana, last_name_kana,
        birthday が存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end

    context '新規登録できないとき' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Nickname can't be blank"
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Email can't be blank"
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが存在してもpassword_confirmationが空では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'first_nameが空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "First name can't be blank"
      end
      it 'last_nameが空では登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name can't be blank"
      end
      it 'first_name_kanaが空では登録できない' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "First name kana can't be blank"
      end
      it 'last_name_kanaが空では登録できない' do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name kana can't be blank"
      end
      it 'birthdayが空では登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Birthday can't be blank"
      end
      it '重複したnicknameが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.nickname = @user.nickname
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Nickname has already been taken')
      end
      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.nickname = '次郎'
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'emailに@が存在しない場合登録できない' do
        @user.email = 'test123gmail.com'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = 'test1'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'passwordが英字のみでは登録できない' do
        @user.password = 'tester'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password include both letters and numbers')
      end
      it 'passwordが数字のみでは登録できない' do
        @user.password = '1234567'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password include both letters and numbers')
      end
      it 'first_nameが半角では登録できない' do
        @user.first_name = 'furima'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name input full-width characters')
      end
      it 'last_nameが半角では登録できない' do
        @user.last_name = 'furima'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name input full-width characters')
      end
      it 'first_name_kanaが半角では登録できない' do
        @user.first_name_kana = 'furima'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name kana input full-width katakana characters')
      end
      it 'last_name_kanaが半角では登録できない' do
        @user.last_name_kana = 'furima'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name kana input full-width katakana characters')
      end
      it 'first_name_kanaがカタカナ以外の全角では登録できない' do
        @user.first_name_kana = 'ふりま'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name kana input full-width katakana characters')
      end
      it 'last_name_kanaがカタカナ以外の全角では登録できない' do
        @user.last_name_kana = 'ふりま'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name kana input full-width katakana characters')
      end
    end
  end
end
