require 'rails_helper'
RSpec.describe 'タスク管理機能', type: :system do
  # describe 'ユーザー新規作成機能' do
  #   context 'ユーザーを新規作成した場合' do
  #     it 'ユーザー登録ができる' do
  #       visit new_user_path
  #       user = FactoryBot.create(:user, name: 'user', email: 'user02@user.com', password: '000000', password_confirmation: '000000')
  #       click_on '登録'
  #       # visit new_session_path
  #       #
  #       # user = FactoryBot.create(:user, email: 'user01@user.com', password: '000000')
  #       # click_on 'ログイン'
  #       visit tasks_path
  #       expect(page).to have_content '登録しました'
  #     end
  #
  #     it '​ログインしていない時はログイン画面に飛ぶテスト​' do
  #       visit tasks_path
  #       expect(current_path).to eq new_session_path
  #     end
  #
  #   end
  # end

  describe 'セッション機能' do
    context 'ログインした場合' do
      it 'ログインができるこ' do
        visit new_session_path
        user = FactoryBot.create(:user, name: 'テスト　太郎', email: 'test@test.com', password: '111111')

        click_on 'ログイン'
        visit tasks_path
        expect(page).to have_content 'タスク一覧'
      end

      it '​自分の詳細画面(マイページ)に飛べること​' do
        visit user_path(id: @user.id)
        expect(current_path).to eq user_path(id: @user.id)
      end

      it "一般ユーザが他人の詳細画面に飛ぶとタスク一覧ページに遷移すること" do
        visit user_path(2)
        expect(page).to have_content "権限がありません。ログインしてください。"
      end

      it "ログイン画面に戻る" do
        visit user_path(id: @user.id)
        click_link "ログアウト"
        expect(page).to have_content "ログアウトしました"
      end
    end
  end

  describe "管理画面のテスト" do
    context "管理ユーザ作成" do
      it "管理者は管理画面にアクセスできること" do
        visit new_admin_user_path
        user = FactoryBot.create(:user, name: 'user', email: 'user@user.com', admin:　'true', password: '000000', password_confirmation: '000000')
        visit new_session_path
        fill_in "session_email", with: "user@user.com​"
        fill_in "session_password", with: "000000"
        click_on "ログイン"
        visit admin_users_path
        expect(page).to have_content "ユーザー一覧"
      end
    end

    context "一般ユーザーがログインしている場合" do
      it "一般ユーザーは管理画面にはアクセスできない" do
        visit new_user_path
        user = FactoryBot.create(:second_user, name: 'user2', email: 'user2@user.com', admin: 'false', password: '111111', password_confirmation: '111111')
        visit tasks_path
        click_on "Admin"
        expect(page).to have_content "不正なアクセスです"
      end

      it "管理者はユーザ新規登録ができる" do
        visit new_admin_user_path
        user = FactoryBot.create(:user, name: 'user', email: 'user@user.com', admin:　'true', password: '000000', password_confirmation: '000000')
        visit admin_users_path
        click_link "新規ユーザー作成"
        fill_in "user_name", with: "テスト　テスト"
        fill_in "user_email", with: "test000@test.com"
        fill_in "user_password", with: "999999"
        fill_in "user_password_confirmation", with: "999999"
        click_on "登録"
        expect(page).to have_content "登録しました"
      end

      it "管理者はユーザの詳細画面へ行ける" do
        @user = FactoryBot.create(:user)
        visit admin_user_path(id: @user.id)
        expect(page).to have_content "user"
      end

      it "管理者ユーザーの編集画面からユーザーの編集ができる" do
        visit new_admin_user_path
        user = FactoryBot.create(:user, name: 'user', email: 'user@user.com', admin:　'true', password: '000000', password_confirmation: '000000')
        visit edit_admin_user_path(id: @user.id)
        fill_in 'user_name', with: 'user'
        fill_in 'user_email', with: 'user@user.com'
        fill_in 'user_password', with: '000000'
        fill_in 'user_password_confirmation', with: '000000'
        click_button '作成登録'
        expect(page).to have_content "更新しました"
      end

      it "管理者はユーザーを削除できる" do
        visit new_admin_user_path
        user = FactoryBot.create(:user, name: 'user', email: 'user@user.com', admin:　'true', password: '000000', password_confirmation: '000000')
        visit admin_users_path
        click_link "削除", match: :first
      end
    end
  end

end
