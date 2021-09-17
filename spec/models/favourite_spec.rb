require 'rails_helper'

RSpec.describe Favourite, type: :model do
  context 'associations' do 
    it { should belong_to(:user) }
    it { should belong_to(:trip) }
  end

  context 'table data base' do 
    it { should have_db_column(:user_id).of_type(:integer) }
    it { should have_db_column(:trip_id).of_type(:integer) }
  end
end
