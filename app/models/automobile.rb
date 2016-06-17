class Automobile < ActiveRecord::Base
	validates :automobile_type, presence: true, inclusion: { in: %w(gasoline diesel electrical) }
	validates :make, presence: true
	validates :model, presence: true
	validates :year, presence: true, numericality: { only_integer: true }, length: { minimum: 4, maximum: 4 }
	validates :odometer_reading, presence: true, numericality: { only_integer: true }

end
