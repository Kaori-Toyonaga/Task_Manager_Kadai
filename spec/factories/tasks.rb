FactoryBot.define do
  factory :task do
    title { 'title1' }
    detail { 'detail1' }
  end
  factory :second_task, class: Task do
    title { 'title2' }
    detail { 'detail2' }
  end
end
