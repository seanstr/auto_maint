class Diesel < Automobile
	validates :fuel_mode, presence: true, inclusion: { in: %w(Diesel) }
end