FactoryBot.define do
  factory :user do
        nickname {Faker::Name.name}
        email {Faker::Internet.free_email}
        password = '1a' + Faker::Internet.password(min_length: 6)
        password {password}
        password_confirmation {password}
        first_name {'山田'}
        last_name {'花子'}
        date_of_birth {Faker::Date.birthday}
  end
end
