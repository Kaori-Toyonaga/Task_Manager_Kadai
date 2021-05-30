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

scope :search_title_status, -> (title, status) { where("title LIKE ?", "%#{title}%") && where(status: status) }
scope :search_title, -> (title) { where("title LIKE ?", "%#{title}%") }
# scope :search_status, -> (status) { where(status: status) }
scope :search_status, -> (status) { where(status: [2..4]) }

belongs_to :user

end
