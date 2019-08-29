require 'rails_helper'

RSpec.describe Hour, type: :model do
  describe 'ActiveModel associations' do
    it { is_expected.to belong_to(:user) }
  end
end
