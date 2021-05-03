# require 'rails_helper'
#
# RSpec.describe 'ユーザー新規登録', type: :system do
#   before do
#     @user = FactoryBot.build(:user)
#   end
#
#     context 'ユーザー新規登録できるとき' do
#       it '正しい情報を入力すればユーザー新規登録ができてトップページに移動する' do
#         # トップページに移動する
#         visit root_path
#         # トップページにサインアップページへ遷移するボタンがあることを確認する
#         expect(page).to have_content('新規登録')
#         # 新規登録ページへ移動する
#         visit new_user_registration_path
#         # ユーザー情報を入力する
#         fill_in 'user[nickname]', with: @user.nickname
#       end
#     end
#   end
