require 'rails_helper'
RSpec.describe 'タスク管理機能', type: :system do
  # describe '検索機能' do
  #   context 'タイトルであいまい検索をした場合' do
  #     it "検索キーワードを含むタスクで絞り込まれる" do
  #       visit new_task_path
  #       task = FactoryBot.create(:task, title: 'title1')
  #       task = FactoryBot.create(:second_task, title: 'sample')
  #       visit tasks_path
  #       fill_in 'title_key', with: 'title1'
  #       click_on '検索'
  #       expect(page).to have_content 'title1'
  #       expect(page).to_not have_content 'sample'
  #     end
  #   end
  #
  #   context 'ステータス検索をした場合' do
  #     it "ステータスに完全一致するタスクが絞り込まれる" do
  #       visit new_task_path
  #       task = FactoryBot.create(:task, title: 'title1', status: '未着手')
  #       task = FactoryBot.create(:task, title: 'sample', status: '着手中')
  #       visit tasks_path
  #       select '未着手', from: 'ステータス'
  #       click_on '検索'
  #       expect(page).to have_content 'title1'
  #       expect(page).to_not have_content 'sample'
  #     end
  #   end
  # end

#   context 'ステータス検索をした場合' do
#     it "ステータスに完全一致するタスクが絞り込まれる" do
#       visit new_task_path
#       task = FactoryBot.create(:task, title: 'title1', status: '未着手')
#       task = FactoryBot.create(:task, title: 'sample', status: '着手中')
#       visit tasks_path
#       select '未着手', from: 'ステータス'
#       click_on '検索'
#       expect(page).to have_content 'title1'
#       expect(page).to_not have_content 'sample'
#     end
#   end

  # describe '新規作成機能' do
  #   context 'タスクを新規作成した場合' do
  #     it '作成したタスクが表示される' do
  #       # 1. new_task_pathに遷移する（新規作成ページに遷移する）
  #       visit new_task_path
  #       # 2. 新規登録内容を入力する
  #       #「タスク名」というラベル名の入力欄と、「タスク詳細」というラベル名の入力欄にタスクのタイトルと内容をそれぞれ入力する
    #       fill_in 'task[title]', with: 'title'
  #       fill_in 'task[detail]', with: 'detail'
  #       # 3. 「登録する」というvalue（表記文字）のあるボタンをクリックする
  #       click_on '作成'
  #       # 4. clickで登録されたはずの情報が、タスク詳細ページに表示されているかを確認する
  #       visit tasks_path
  #       expect(page).to have_content 'title'
  #     end
  #   end
  # end
  #
  # describe '新規作成機能' do
  #   context 'タスクを新規作成した場合' do
  #     it 'ステータスも登録ができる' do
  #       visit new_task_path
  #       task = FactoryBot.create(:task, title: 'title1', status: '未着手')
  #       click_on '作成'
  #       visit tasks_path
  #       expect(page).to have_content '未着手'
  #     end
  #   end
  # end

  #
  # describe '一覧表示機能' do
  #   context '一覧画面に遷移した場合' do
  #     it '作成済みのタスク一覧が表示される' do
  #       # テストで使用するためのタスクを作成
  #       task = FactoryBot.create(:task, title: 'title1')
  #       # タスク一覧ページに遷移
  #       visit tasks_path
  #       # visitした（遷移した）page（タスク一覧ページ）に「task」という文字列が
  #       # have_contentされているか（含まれているか）ということをexpectする（確認・期待する）
  #       expect(page).to have_content 'title1'
  #       # expectの結果が true ならテスト成功、false なら失敗として結果が出力される
  #     end
  #   end
  # end

    # context 'タスクが作成日時の降順に並んでいる場合' do
    #   it '新しいタスクが一番上に表示される' do
    #     task = FactoryBot.create(:task, title: 'title1')
    #     second_task = FactoryBot.create(:task, title: 'title2')
    #     visit tasks_path
    #     task_list = all('.task_row')
    #     expect(task_list[0]).to have_content 'title2'
    #     expect(task_list[1]).to have_content 'title1'
    #   end
    # end

  # describe '詳細表示機能' do
  #    context '任意のタスク詳細画面に遷移した場合' do
  #      it '該当タスクの内容が表示される' do
  #        task = FactoryBot.create(:task, title: 'title1')
  #        visit task_path(task.id)
  #        expect(page).to have_content '#:'
  #      end
  #    end
  # end

  # context 'if clicked "deadline"' do
  #   it 'line up in DESC of deadline' do
  #     task = FactoryBot.create(:task, title: 'title1', expired_at: '2021/05/01')
  #     second_task = FactoryBot.create(:task, title: 'title2', expired_at: '2021/05/02')
  #     visit tasks_path
  #     click_link '終了期限'
  #     task_list = all('.task_row')
  #     expect(task_list[0]).to have_content 'title2'
  #     expect(task_list[1]).to have_content 'title1'
  #   end
  # end
end
