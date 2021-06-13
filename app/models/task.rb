class Task < ApplicationRecord
  with_options presence: true do
    validates :title
    validates :detail
  end

  enum status: {
    未選択: 1, 未着手: 2, 着手中: 3, 完了: 4
  }

  enum priority: {
    低: 1, 中: 2, 高: 3
  }

  has_many :task_labels, dependent: :destroy, foreign_key: 'task_id'
  has_many :labels, through: :task_labels, source: :label

  scope :search_title, -> (title) { where("title LIKE ?", "%#{title}%") }
  scope :search_status, -> (status) { where(status: status) }
  scope :search_label, -> (label_id) {
    task_ids = TaskLabel.where(label_id: label_id).pluck(:task_id)
    #中間テーブルにあるlabel_idを呼び出しつつ、pluckでlabel_idに紐づくtask_idを呼び出しtask_idsに代入
    where(id: task_ids)
    #上記で定義した（label_idに紐づくtask_idを持つtask）task_idsの中から検索する
  }

  belongs_to :user


end
