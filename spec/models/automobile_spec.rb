RSpec.describe Automobile, type: :model do
  before { @automobile = FactoryGirl.build(:automobile)}

  subject { @automobile }

  describe MaintenanceTasks 
    it { is_expected.to belong_to(:automobile) }
  end

  it { is_expected.to respond_to(:fuel_mode) }
  it { is_expected.to respond_to(:make) }
  it { is_expected.to respond_to(:model) }
  it { is_expected.to respond_to(:year) }
  it { is_expected.to respond_to(:odometer_reading) }
end
