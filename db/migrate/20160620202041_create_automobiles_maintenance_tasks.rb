class CreateAutomobilesMaintenanceTasks < ActiveRecord::Migration
  def change
    create_table :automobiles_maintenance_tasks do |t|
    	t.references :automobile, :maintenance_task
    end

    add_index :automobiles_maintenance_tasks, [:automobile_id, :maintenance_task_id], :name => 'automobiles_maintenance_task_index'
  end
end
