class Task < ApplicationRecord
  with_options presence: true do
    validates :title
    validates :detail
  end
end
