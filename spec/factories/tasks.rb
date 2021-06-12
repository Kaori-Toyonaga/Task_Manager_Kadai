FactoryBot.define do
  # factory :task do
  #   title { 'title1' }
  #   status { '未着手' }
  #   detail { 'detail1' }
  # association :user
  # end
  # factory :second_task, class: Task do
  #   title { 'title2' }
  #   detail { 'detail2' }
  #   association :user
  # end

  # factory :task do
  #   expired_at { DateTime }
  #   detail { 'detail1' }
  #   title { 'title1' }
  #   association :user
  # end
  # factory :second_task, class: Task do
  #   expired_at { DateTime }
  #   detail { 'detail2' }
  #   title { 'title2' }
  #   association :user
  # end

  # factory :task do
  #   title { 'title1' }
  #   status { '未着手' }
  #   detail { 'detail1' }
  #   association :user
  # end
  # factory :second_task, class: Task do
  #   title { 'sample' }
  #   status { '着手中' }
  #   detail { 'detail2' }
  #   association :user
  # end

  # factory :task do
  #   priority { '中' }
  #   detail { 'detail1' }
  #   title { 'title1' }
  #   association :user
  # end
  # factory :second_task, class: Task do
  #   priority { '高' }
  #   detail { 'detail2' }
  #   title { 'title2' }
  #   association :user
  # end

  factory :task do
      title { 'title1'}
      detail { 'detail1' }
      task_labels { 'タグ1' }
    end

  factory :second_task do
      title { 'sample'}
      detail { 'detail2' }
      task_labels { 'タグ2' }
    end

end
