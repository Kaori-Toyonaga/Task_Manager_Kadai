FactoryBot.define do
  # factory :user do
  #   name { 'user' }
  #   email { 'user02@user.com' }
  #   password { '000000' }
  #   password_confirmation { '000000' }
  # end

#   factory :user do
#     name { 'テスト　太郎' }
#     email { 'test@test.com' }
#     password { '111111' }
#     password_confirmation { '111111' }
#   end
# #
  factory :user do
    name { 'user' }
    email { 'user000@user.com'}
    admin { true }
    password { '000000' }
    password_confirmation { '000000' }
  end
#   factory :second_user, class: User do
#     name { 'user2' }
#     email { 'user2@user.com' }
#     admin { false }
#     password { '111111' }
#     password_confirmation { '111111' }
#   end
end
