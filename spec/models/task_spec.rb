require 'rails_helper'
describe 'タスクモデル機能', type: :model do
  describe '検索機能' do
    # 必要に応じて、テストデータの内容を変更して構わない
    context 'scopeメソッドでタイトルのあいまい検索をした場合' do
      it "検索キーワードを含むタスクが絞り込まれる" do
        task = FactoryBot.create(:task, title: 'title1')
        second_task = FactoryBot.create(:task, title: 'sample')
        # title_seachはscopeで提示したタイトル検索用メソッドである。メソッド名は任意で構わない。
        expect(Task.search_title('title1')).to include(task)
        expect(Task.search_title('title1')).not_to include(second_task)
        # expect(Task.search_title_status('title1').count).to eq 1
      end
    end

    context 'scopeメソッドでステータス検索をした場合' do
      it "ステータスに完全一致するタスクが絞り込まれる" do
        task = FactoryBot.create(:task, title: 'title1', status: '未着手')
        second_task = FactoryBot.create(:task, title: 'sample', status: '着手中')
        # title_seachはscopeで提示したタイトル検索用メソッドである。メソッド名は任意で構わない。
        # expect(Task.search_status('未着手')).to include(task)
        # expect(Task.search_status('未着手')).not_to include(second_task)
        expect(Task.search_title_status('','未着手').count).to eq 1
      end
    end

    context 'scopeメソッドでタイトルのあいまい検索とステータス検索をした場合' do
      it "検索キーワードをタイトルに含み、かつステータスに完全一致するタスク絞り込まれる" do
        task = FactoryBot.create(:task, title: 'title1', status: '未着手')
        second_task = FactoryBot.create(:task, title: 'sample', status: '着手中')
        # title_seachはscopeで提示したタイトル検索用メソッドである。メソッド名は任意で構わない。
        expect(Task.search_title_status('title1','未着手')).to include(task)
        expect(Task.search_title_status('title1','未着手')).not_to include(second_task)
      end
    end
  end
  # describe 'バリデーションのテスト' do
  #   context 'タスクのタイトルが空の場合' do
  #     it 'バリデーションにひっかる' do
  #       task = Task.new(title: '', detail: 'detail')
  #       expect(task).not_to be_valid
  #     end
  #   end
  #
  #   context 'タスクの詳細が空の場合' do
  #     it 'バリデーションにひっかかる' do
  #       task = Task.new(title: 'title', detail: '')
  #       expect(task).not_to be_valid
  #     end
  #   end
  #
  #   context 'タスクのタイトルと詳細に内容が記載されている場合' do
  #     it 'バリデーションが通る' do
  #       task = Task.new(title: 'title', detail: 'detail')
  #       expect(task).to be_valid
  #     end
  #   end
  # end

end
