# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :news do
    image ""
    title "MyString"
    preview "MyText"
    txt "MyText"
    published false
  end
end
