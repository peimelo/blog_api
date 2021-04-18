require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'associations' do
    it { should have_many(:articles).dependent(:destroy) }
  end

  describe 'validations' do
    it { should validate_presence_of(:email) }
    it { should validate_length_of(:password).is_at_least(8) }
  end

  describe 'callbacks' do
    context 'before_validation' do
      it 'should set uid as email' do
        user = User.new attributes_for :user_without_uid
        expect(user.uid).to eq('')
        user.save
        expect(user.uid).to eq(user.email)
      end
    end
  end
end
