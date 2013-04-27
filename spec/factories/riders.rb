# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :rider do
    event_id 1
    name "MyString"
    horse "MyString"
    status "MyText"
    dressage "2013-04-26 18:22:21"
    xcountry "2013-04-26 18:22:21"
  end
end
