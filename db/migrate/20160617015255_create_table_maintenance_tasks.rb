class CreateTableMaintenanceTasks < ActiveRecord::Migration
  def change
    create_table :table_maintenance_tasks do |t|
    	t.datetime :maintenance_date
    	t.integer :automobile_id
    	t.string :name
  		t.string :description
    end
  end
end
