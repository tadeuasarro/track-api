require 'rails_helper'

RSpec.describe Expense, type: :model do
  let(:subject) do
    described_class.new(
      name: 'Grocery',
    )
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }

    it "expects the subject to be invalid for it doesn't have an username" do
      subject.name = nil
      expect(subject).not_to be_valid
    end

    it "expects the subject to be invalid for it's length is not enough" do
      subject.name = '123'
      expect(subject).not_to be_valid
    end

    it "expects the subject to be invalid for it's length is not enough" do
      subject.name = '123456789012345678901234567890'
      expect(subject).not_to be_valid
    end

    it "expects the subject to be valid" do
      subject.name = '12345678'
      expect(subject).to be_valid
    end

  end
end