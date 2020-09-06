FactoryBot.define do
  factory :recipe do
    user

    title { 'Overnight Asparagus Mushroom Strata' }
    description { "This recipe of my mom's is a colorful make-ahead dish that makes brunch a breeze!" }
  end
end
