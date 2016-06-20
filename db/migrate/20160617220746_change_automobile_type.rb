class ChangeAutomobileType < ActiveRecord::Migration
  def change
  	remove_column :automobiles, :automobile_type
  	add_column :automobiles, :fuel_mode, :string
  end
end
