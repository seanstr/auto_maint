class AddSuitableTypesToMaintenanceTasks < ActiveRecord::Migration
  def change
  	add_column :maintenance_tasks, :suitable_for_gasoline, :boolean
  	add_column :maintenance_tasks, :suitable_for_diesel, :boolean
  	add_column :maintenance_tasks, :suitable_for_electrical, :boolean
  end
end
