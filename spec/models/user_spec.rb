require 'rails_helper'

RSpec.describe User, type: :model do
  let(:subject) do
    described_class.new(
      username: 'Tadeu'
    )
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:username) }

    it "expects the subject to be invalid for it doesn't have an username" do
      subject.username = nil
      subject.target = 0
      expect(subject).not_to be_valid
    end

    it "expects the subject to be invalid for it's length is not enough" do
      subject.username = '123'
      subject.target = 0
      expect(subject).not_to be_valid
    end

    it "expects the subject to be invalid for it's length is not enough" do
      subject.username = '123456789012345678901234567890'
      subject.target = 0
      expect(subject).not_to be_valid
    end

    it "expects the subject to be invalid for it's length is not enough" do
      subject.username = '12345678'
      subject.target = nil
      expect(subject).not_to be_valid
    end

    it 'expects the subject to be valid' do
      subject.username = '12345678'
      subject.target = 0
      expect(subject).to be_valid
    end
  end

  describe 'associations' do
    it { is_expected.to have_many(:expenditures) }
  end
end
