class MaintenanceTask < ActiveRecord::Base
	has_and_belongs_to_many :automobiles
	
	validates :name, presence: true
	validates :suitable_for_gasoline, inclusion: { in: [true, false] }
	validates :suitable_for_diesel, inclusion: { in: [true, false] }
	validates :suitable_for_electrical, inclusion: { in: [true, false] }
end
