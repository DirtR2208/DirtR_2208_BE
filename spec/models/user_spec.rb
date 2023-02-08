require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'relationships' do
    it { should have_many :trails }
  end

  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :email }
  end

  describe 'class methods' do
    before(:each) do
      @reba = User.create!(name: 'Reba', email: 'reba@dirtr.dirt')
      @bird = User.create!(name: 'Bird', email: 'bird@dirtr.dirt')
      @tweezer = User.create!(name: 'Tweezer', email: 'tweezer@dirtr.dirt')
    end

    describe '#find_by_user_id(id)' do
      it 'returns a user based on the id provided in the query' do
        expect(User.find_by_user_id(@bird.id)).to eq(@bird)
        expect(User.find_by_user_id(@bird.id)).to_not eq(@reba)
      end
    end
  end
end