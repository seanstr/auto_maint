FactoryGirl.define do

  factory :automobile do
    id 1
    fuel_mode "Gasoline"
    make "Mazda"
    model "3"
    year 2015
    odometer_reading 90001
  end

  factory :gasoline do
  	id 1
    fuel_mode "Gasoline"
    make "Mazda"
    model "3"
    year 2015
    odometer_reading 90001

    after(:create) {|gasoline| gasoline.maintenance_tasks = [create(:maintenance_task)]}

  # factory :organization do
  #   name "example"
  #   website "www.aquarterit.com"
  #   after(:create) {|organization| organization.users = [create(:admin)]}
  # end  

  end

  factory :maintenance_task do
    # sequence :id do |n|
    #   "#{n}"
    # end
  	#id 1
    name "change oil"
    description "maintenance to change oil"
    suitable_for_gasoline true
    suitable_for_diesel true
    suitable_for_electrical false

    #after(:create) {|maintenance_task| maintenance_task.gasoline = [create(:gasoline)]}
  end

  factory :invalid_maintenance_task, class: OpenStruct do
    name nil
    description "maintenance to change oil"
    suitable_for_gasoline true
    suitable_for_diesel true
    suitable_for_electrical false
  end

########################################

  # factory :user do
  #   email 'example@example.com'
  #   password 'password'
  #   password_confirmation 'password'
  #   after(:create) {|user| user.add_role(:user)}

  #   factory :owner do
  #     after(:create) {|user| user.add_role(:owner)}
  #   end

  #   factory :admin do
  #     after(:create) {|user| user.add_role(:admin)}
  #   end

  #   factory :superadmin do
  #     after(:create) {|user| user.add_role(:superadmin)}
  #   end
  # end

  # factory :organization do |f|
  #   f.name "example"
  #   f.website "www.aquarterit.com"
  #   f.association :users, :factory => :admin
  # end

  #----  

  # factory :organization do
  #   name "example"
  #   website "www.aquarterit.com"
  #   after(:create) {|organization| organization.users = [create(:admin)]}
  # end  
  
end
