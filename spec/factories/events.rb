# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :event do
    date_and_time DateTime.now
    name "event name"
    description "event description"
  end
end
