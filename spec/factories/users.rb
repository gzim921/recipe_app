FactoryBot.define do
  factory :user do
    sequence(:email) { "gzimiseni12@gmail.com" }
    user_name { 'gzim9212' }
    first_name { 'Gzim' }
    last_name { 'Iseni' }
    password { 'gimi12345689' }
    password_confirmation { 'gimi12345689' }
  end
end
