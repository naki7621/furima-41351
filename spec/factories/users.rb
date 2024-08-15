FactoryBot.define do
  factory :user do
    nickname              {'単体テスト'}
    email                 {Faker::Internet.email}
    password              {'abcdefg99'}
    password_confirmation {password}
    family_name           {'上田'}
    first_name            {'教授'}
    kana_family_name      {'ウエダ'}
    kana_first_name       {'キョウジュ'}
    birthday              {'1999-01-10'}
  end
end