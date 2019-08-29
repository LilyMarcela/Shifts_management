require 'rails_helper'

RSpec.describe UserSerializer, type: :serializer do
  fixtures :users
  let(:model) { users(:one) }

  subject { described_class.new(model).as_json }

  it { expect(subject[:id]).to eq('1') }
  it { expect(subject[:name]).to eq('Sally') }
  it { expect(subject[:email]).to eq('sally@example.com') }
  it { expect(subject[:total_worked_hours]).to eq(8) }


end