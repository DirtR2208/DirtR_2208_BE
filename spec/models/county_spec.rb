require 'rails_helper'

RSpec.describe County, type: :model do
  describe "Relationships" do
    it { should have_many :trails }
  end

  describe "Validations" do
    it { should validate_presence_of :name }
  end
end
