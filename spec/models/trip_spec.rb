require 'rails_helper'

RSpec.describe Trip, type: :model do
  it 'validates precense' do   
    should validate_presence_of(:destiny)
    should validate_presence_of(:price)
    should validate_presence_of(:description)
    should validate_presence_of(:days)
    should validate_presence_of(:hotel)
    should validate_presence_of(:trip_type)
  end

  it 'validates length' do   
    should validate_length_of(:destiny).is_at_most(50) 
    should validate_length_of(:description).is_at_most(50) 
    should validate_length_of(:hotel).is_at_most(50)
    should validate_length_of(:trip_type).is_at_most(50) 
  end

  context 'associations' do 
    it { should have_many(:favorites) }
    it { should have_many(:users) }
    it { should have_many_attached(:images) }
  end

  it 'validates with good examples' do 
    is_expected.to allow_value('aval1destiny').for(:destiny)
    is_expected.to allow_value(13.50).for(:price)
    is_expected.to allow_value('a valid description').for(:description)
    is_expected.to allow_value(10).for(:days)
    is_expected.to allow_value('a valid Hotel').for(:hotel)
    is_expected.to allow_value('car').for(:trip_type)
  end

  it 'validates with BAD EXAMPLES' do 
    is_expected.to_not allow_value('').for(:destiny)
    is_expected.to_not allow_value('').for(:price)
    is_expected.to_not allow_value('').for(:description)
    is_expected.to_not allow_value('').for(:days)
    is_expected.to_not allow_value('').for(:hotel)
    is_expected.to_not allow_value('').for(:trip_type)
    is_expected.to_not allow_value('invalidevenwithmorethan0characterswithwrongformatmorethan50').for(:destiny)
    is_expected.to_not allow_value('invalidevenwithmorethan0characterswithwrongformatmorethan50').for(:description)
    is_expected.to_not allow_value('invalidevenwithmorethan0characterswithwrongformatmorethan50').for(:hotel)
    is_expected.to_not allow_value('invalidevenwithmorethan0characterswithwrongformatmorethan50').for(:trip_type)
  end

  context 'table data base' do 
    it { should have_db_column(:destiny).of_type(:string) }
    it { should have_db_column(:price).of_type(:float) }
    it { should have_db_column(:description).of_type(:string) }
    it { should have_db_column(:days).of_type(:integer) }
    it { should have_db_column(:hotel).of_type(:string) }
    it { should have_db_column(:trip_type).of_type(:string) }
  end
end

