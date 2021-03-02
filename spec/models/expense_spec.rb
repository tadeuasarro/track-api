require 'rails_helper'

RSpec.describe Expense, type: :model do
  let(:subject) do
    described_class.new(
      name: 'Grocery'
    )
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
  end
end