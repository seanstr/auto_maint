class CreateAutomobiles < ActiveRecord::Migration
  def change
    create_table :automobiles do |t|
    	t.string :automobile_type, :make, :model
    	t.integer :year, :odometer_reading

    	t.timestamps
    end
  end
end
