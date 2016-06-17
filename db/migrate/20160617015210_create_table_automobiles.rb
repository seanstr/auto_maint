class CreateTableAutomobiles < ActiveRecord::Migration
  def change
    create_table :table_automobiles do |t|
    	t.string :automobile_type, :make, :model
    	t.integer :year, :odometer_reading
    end
  end
end
