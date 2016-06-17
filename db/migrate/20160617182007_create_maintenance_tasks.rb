class CreateMaintenanceTasks < ActiveRecord::Migration
  def change
  	drop_table :table_maintenance_tasks
    create_table :maintenance_tasks do |t|
    	t.datetime :maintenance_date
    	t.references :automobile, index: true
    	t.string :name
  		t.string :description

    	t.timestamps
    end
  end
end
