FactoryGirl.define do
	factory :tasks_hash, class:Hash do
    automobile_id "1"

    maintenance_tasks {{
      "maintenance_task_id" => "1", 
      "maintenance_task_id" => "2", 
      "maintenance_task_id" => "4", 
    }}

    initialize_with { attributes } 
  end
end