require 'rails_helper'

RSpec.describe User, type: :model do
  context 'validations' do
    it 'validates precense' do
      should validate_presence_of(:email)
      should validate_presence_of(:username)
      should validate_presence_of(:password)
      should validate_presence_of(:password_confirmation)
    end

    it 'validates length' do
      should validate_length_of(:username).is_at_most(50)
      should validate_length_of(:email).is_at_most(50)
      should validate_length_of(:username).is_at_least(4)
      should validate_length_of(:email).is_at_least(4)
      should validate_length_of(:password).is_at_least(6)
      should validate_length_of(:password_confirmation).is_at_least(6)
    end

    it 'validates with good examples' do
      is_expected.to allow_value('aval1dname').for(:username)
      is_expected.to allow_value('.asd0q3').for(:username)
      is_expected.to allow_value('mail@hey.com').for(:email)
      is_expected.to allow_value('ñ.241004sjf').for(:password)
      is_expected.to allow_value('ñ.241004sjf').for(:password_confirmation)
    end

    it 'validates BAD EXAMPLE USING different password and password_confirmation' do
      is_expected.to allow_value('validpassword').for(:password)
      is_expected.to_not allow_value('differentpassword').for(:password_confirmation)
    end
  end

  context 'compares BAD EXAMPLES for email and username' do
    it 'validates with BAD EXAMPLES for email and username' do
      is_expected.to_not allow_value('inv').for(:username)
      is_expected.to_not allow_value('').for(:username)
      is_expected.to_not allow_value('invalidevenwithmorethan6characterswithwrongformatmorethan50').for(:username)
      is_expected.to_not allow_value('inv').for(:email)
      is_expected.to_not allow_value('').for(:email)
      is_expected.to_not allow_value('invalidwithwrongformat').for(:email)
      is_expected.to_not allow_value('invalidevenwithmorethan6characterswithwrongformatmorethan50').for(:email)
      is_expected.to_not allow_value('').for(:password)
      is_expected.to_not allow_value('').for(:password_confirmation)
      is_expected.to_not allow_value('5char').for(:password)
      is_expected.to_not allow_value('5char').for(:password_confirmation)
    end
  end

  context 'associations' do
    it { should have_many(:favorites) }
    it { should have_many(:trips) }
  end

  context 'table data base' do
    it { should have_db_column(:username).of_type(:string) }
    it { should have_db_column(:email).of_type(:string) }
    it { should have_db_column(:password_digest).of_type(:string) }
  end
end
