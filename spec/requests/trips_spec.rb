require 'rails_helper'

describe 'Trips API', type: :request do
  it 'return all trips' do 
    FactoryBot.create(:trip, destiny: 'Paris', price: 13.23, description: 'An amazing trip', days: 10, hotel: 'One', trip_type: 'Car')
    get '/api/v1/trips'

    expect(response).to have_http_status(:success)
    expect(JSON.parse(response.body).size).to eq(1)
    expect(JSON.parse(response.body).size).to_not eq(2)
  end
end
