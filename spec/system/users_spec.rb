require 'rails_helper'

# RSpec.describe "Users", type: :system do
#   before do
#     driven_by(:rack_test)
#   end
#
#   pending "add some scenarios (or delete) #{__FILE__}"
# end

RSpec.describe 'タスク管理機能', type: :system do
  before do
    @user = FactoryBot.create(:user)
  end

  # describe 'ユーザー新規作成機能' do
  #   context 'ユーザーを新規作成した場合' do
  #     it 'ユーザー登録ができる' do
  #
  #       visit new_user_path
  #       expect(new_user_path).to eq new_user_path
  #       fill_in 'user[name]',with: 'user'
  #       fill_in 'user[email]',with: 'user001@user.com'
  #       #fill_in 'user[admin]', with: 'true​'
  #       fill_in 'user[password]',with: '000000​'
  #       fill_in 'user[password_confirmation]',with: '000000​'
  #       click_on '登録'
  #       expect(page).to have_content 'user'
  #       #expect(page).to have_content 'user001@user.com'
  #
  #     end
  #
  #     it '​ログインしていない時はログイン画面に飛ぶテスト​' do
  #       visit tasks_path
  #       expect(current_path).to eq new_session_path
  #     end
  #
  #   end
  # end
  #
  # describe 'セッション機能' do
  #   context 'ログインした場合' do
  #     it 'ログインができること' do
  #       visit new_session_path
  #       fill_in 'session[email]',with: @user.email
  #       fill_in 'session[password]',with: @user.password
  #       click_on 'ログイン'
  #       visit tasks_path
  #       expect(page).to have_content 'タスク一覧'
  #     end
  #
  #     it '​自分の詳細画面(マイページ)に飛べること​' do
  #       visit new_session_path
  #       fill_in 'session[email]',with: @user.email
  #       fill_in 'session[password]',with: @user.password
  #       click_on 'ログイン'
  #       visit tasks_path
  #
  #       click_link "MyPage"
  #       expect(page).to have_content 'userのページ'
  #     end
  #
  #     it "一般ユーザが他人の詳細画面に飛ぶとタスク一覧ページに遷移すること" do
  #       visit new_session_path
  #       fill_in 'session[email]',with: @user.email
  #       fill_in 'session[password]',with: @user.password
  #       click_on 'ログイン'
  #       click_link 'ログアウト'
  #
  #       visit new_session_path
  #       fill_in 'session[email]',with: @second_user.email
  #       fill_in 'session[password]',with: @second_user.password
  #       click_on 'ログイン'
  #
  #       visit user_path(@user.id)
  #       expect(page).to have_content '権限がありません'
  #     end
  #
  #     it "ログイン画面に戻る" do
  #       visit new_session_path
  #       fill_in 'session[email]',with: @user.email
  #       fill_in 'session[password]',with: @user.password
  #       click_on 'ログイン'
  #
  #       visit tasks_path
  #       click_link 'ログアウト'
  #       expect(page).to have_content 'ログアウトしました'
  #     end
  #   end
  # end

  describe "管理画面のテスト" do
    context "管理ユーザ作成" do
      it "管理者は管理画面にアクセスできること" do
        visit new_session_path
        fill_in 'session[email]',with: @user.email
        fill_in 'session[password]',with: @user.password
        click_on 'ログイン'
        visit admin_users_path
        expect(page).to have_content "ユーザー一覧"
      end
    end

    context "一般ユーザーがログインしている場合" do
      it "一般ユーザーは管理画面にはアクセスできない" do
        visit new_session_path
        fill_in 'session[email]',with: @user.email
        fill_in 'session[password]',with: @user.password
        visit tasks_path
        visit admin_users_path
        expect(page).to have_content 'ログインページ'
      end

      it "管理者はユーザ新規登録ができる" do
        visit new_session_path
        fill_in 'session[email]',with: @user.email
        fill_in 'session[password]',with: @user.password
        click_on 'ログイン'

        visit admin_users_path
        click_link '新規ユーザー作成'
        fill_in 'user[name]',with: 'user2'
        fill_in 'user[email]',with: 'user2@user.com'
        fill_in 'user[password]',with: '111111'
        fill_in 'user[password_confirmation]',with: '111111'
        click_on "登録"
        expect(page).to have_content "登録しました"
      end

      it "管理者はユーザの詳細画面へ行ける" do
        visit new_session_path
        fill_in 'session[email]',with: @user.email
        fill_in 'session[password]',with: @user.password
        click_on 'ログイン'

        visit admin_users_path
        click_link '新規ユーザー作成'
        fill_in 'user[name]',with: 'user2'
        fill_in 'user[email]',with: 'user2@user.com'
        fill_in 'user[password]',with: '111111'
        fill_in 'user[password_confirmation]',with: '111111'
        click_on "登録"

        click_link '詳細', match: :first
        expect(page).to have_content "userのページ"
      end

      it "管理者ユーザーの編集画面からユーザーの編集ができる" do
        visit new_session_path
        fill_in 'session[email]',with: @user.email
        fill_in 'session[password]',with: @user.password
        click_on 'ログイン'

        visit admin_users_path
        click_link '新規ユーザー作成'
        fill_in 'user[name]',with: 'user2'
        fill_in 'user[email]',with: 'user2@user.com'
        fill_in 'user[password]',with: '111111'
        fill_in 'user[password_confirmation]',with: '111111'
        click_on "登録"

        click_link '編集', match: :first
        fill_in 'user[name]', with: 'user3'
        click_button '登録'
        expect(page).to have_content "更新しました"
      end

      it "管理者はユーザーを削除できる" do
        visit new_session_path
        fill_in 'session[email]',with: @user.email
        fill_in 'session[password]',with: @user.password
        click_on 'ログイン'
        visit admin_users_path
        click_link "削除", match: :first
      end
    end
  end

end
