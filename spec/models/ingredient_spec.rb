require 'rails_helper'

RSpec.describe Ingredient, type: :model do
  describe 'validations' do
    it { is_expected.to validate_presence_of(:body) }
  end

  describe 'associations' do
    it { is_expected.to belong_to(:recipe) }
  end
end
