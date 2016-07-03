class Automobile < ActiveRecord::Base
	has_and_belongs_to_many :maintenance_tasks

	self.inheritance_column = :fuel_mode

	validates :fuel_mode, presence: true, inclusion: { in: %w(Gasoline Diesel Electrical) }
	validates :make, presence: true
	validates :model, presence: true
	validates :year, presence: true, numericality: { only_integer: true }
	validates :odometer_reading, presence: true, numericality: { only_integer: true }

	scope :gasolines, -> { where(fuel_mode: 'Gasoline') } 
	scope :diesels, -> { where(fuel_mode: 'Diesel') } 
	scope :electricals, -> { where(fuel_mode: 'Electrical') }

	class << self
		def fuel_modes
			%w(Gasoline Diesel Electrical)
		end
	end
end
