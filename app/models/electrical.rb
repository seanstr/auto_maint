class Electrical < Automobile
	validates :fuel_mode, presence: true, inclusion: { in: %w(Electrical) }
end