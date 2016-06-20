FactoryGirl.define do
  factory :maintenance_task do
    name "change oil"
    description "maintenance to change oil"
    suitable_for_gasoline true
    suitable_for_diesel true
    suitable_for_electrical false
  end
end
