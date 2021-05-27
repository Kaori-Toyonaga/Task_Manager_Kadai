class Task < ApplicationRecord
  with_options presence: true do
    validates :title
    validates :detail
  end

  enum status: {
  未選択: 1, 未着手: 2, 着手中: 3, 完了: 4
}

end
