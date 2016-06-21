class Gasoline < Automobile
	validates :fuel_mode, presence: true, inclusion: { in: %w(Gasoline) }
end