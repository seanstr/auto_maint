require 'rails_helper'

RSpec.describe MaintenanceTask, type: :model do
  before { @maintenance_task = FactoryGirl.build(:maintenance_task)}

  subject { @maintenance_task }

  it { is_expected.to respond_to(:name) }
  it { is_expected.to respond_to(:description) }
  it { is_expected.to respond_to(:suitable_for_gasoline) }
  it { is_expected.to respond_to(:suitable_for_diesel) }
  it { is_expected.to respond_to(:suitable_for_electrical) }
end
