require 'rails_helper'

RSpec.describe User, type: :model do
  fixtures :users
  subject { users(:one) }

  describe 'ActiveModel validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:email) }
  end

  describe 'ActiveModel associations' do
    it { is_expected.to have_many(:hours) }
  end

  describe 'assign_role' do
    it 'assigns 1 as role_id when role_id is not present' do
      expect(subject.assign_role).to eq(1)
    end
  end

  describe 'admin?' do
    it 'returns true when the role_id is 2' do
      expect(subject.admin?).to be false
    end
  end
end
