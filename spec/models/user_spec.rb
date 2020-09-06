require 'rails_helper'

RSpec.describe User do
  describe "validations" do
    it { is_expected.to validate_presence_of(:user_name) }
    it { is_expected.to validate_length_of(:user_name).is_at_least(User::MINIMUM_LENGTH) }
    it { is_expected.to validate_presence_of(:first_name) }
    it { is_expected.to validate_presence_of(:last_name) }
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_presence_of(:password) }
    it { is_expected.to validate_length_of(:password).is_at_least(User::MINIMUM_LENGTH) }
    it { is_expected.to have_secure_password }

    context 'has format email that' do
      it 'can be valid' do
        email = build(:user, email: 'GIMI@VALID.COM')

        expect(email.valid?).to be true
      end

      it 'can be invalid' do
        email = build(:user, email: 'GIMI@INVALID')

        expect(email.valid?).to be false
      end
    end

    context 'has format password that' do
      it 'can be valid' do
        password = build(:user, password: 'Caipirinha123', password_confirmation: 'Caipirinha123')

        expect(password.valid?).to be true
      end

      it 'can be invalid' do
        password = build(:user, password: 'Long-Island:', password_confirmation: 'Long-Island:')

        expect(password.valid?).to be false
      end
    end
  end

  describe "associations" do
    it { is_expected.to have_many(:recipes) }
  end

  describe "dependency" do
    let(:recipes_count) { 11 }
    let(:user) { create(:user) }

    it "is expected to destroy recipes when user destroyed" do
      create_list(:recipe, recipes_count, user: user)

      expect {user.destroy}.to change {Recipe.count}.by(-recipes_count)
    end
  end

  describe "before saving" do
    it "downcase and capitalize first and last name" do
      gzim_iseni = create(:user, first_name: 'gimII', last_name: 'isENI')

      expect(gzim_iseni.first_name).to eq 'Gimii'
      expect(gzim_iseni.last_name).to eq 'Iseni'
    end

    it "transforms email to downcase" do
      gimi = create(:user, email: 'GIMI12@GMAIL.com')
      
      expect(gimi.email).to eq 'gimi12@gmail.com'
    end
  end
end