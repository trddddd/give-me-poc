require 'rails_helper'

RSpec.describe Role, type: :model do
  describe 'validations' do
    subject { create(:role) }

    it { is_expected.to validate_inclusion_of(:name).in_array(%w[ developer stuff author ]) }
  end
end
