require 'rails_helper'
RSpec.describe '新規作成機能' do

  before do
    @user = FactoryBot.create(:user)
  end

    context 'タグを新規作成した場合' do
      it 'タグの登録ができる' do
        visit new_session_path
        fill_in 'session[email]',with: 'user@user.com'
        fill_in 'session[password]',with: '000000'
        click_on 'ログイン'
        visit tasks_path
        visit new_label_path
        label = FactoryBot.create(:label, title: 'タグ1')
        find('input[type="submit"]').click
        visit labels_path
        expect(page).to have_content 'タグ1'

      end
    end
end
