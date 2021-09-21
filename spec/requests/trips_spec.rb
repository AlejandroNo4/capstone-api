require 'rails_helper'
require 'json'

describe 'Trips API', type: :request do
  it 'return all trips' do 
    FactoryBot.create(:trip, destiny: 'Paris', price: 13.23, description: 'An amazing trip', days: 10, hotel: 'One', trip_type: 'Car')
    get '/api/v1/trips'

    expect(response).to have_http_status(:success)
    expect(JSON.parse(response.body).size).to eq(1)
    expect(JSON.parse(response.body).size).to_not eq(2)
  end

  it 'can NOT be created by a COMMON user' do 
    post "/api/v1/trips", :params => {
      trip: {
      destiny: "Paris",
      price: 124.72,
      description: "test desc",
      days: 2,
      hotel: "One",
      trip_type: "Flight"
      }
    }
    parsed = JSON.parse(response.body)
    expect(parsed['message']).to eq('Access Denied')
    expect(parsed).to_not include('trip')
  end

  it 'can be created by a ADMIN user' do 
    FactoryBot.create(:user, id: 10, username: 'Pablo', email: 'examplepablo@mail.com', password: '111111', password_confirmation: '111111', admin: true)

    post '/api/v1/sessions', :params => {
      user: {
        email: "examplepablo@mail.com",
        password: "111111" 
      }
    }

    post "/api/v1/trips", :params => {
      trip: {
      destiny: "Paris",
      price: 124.72,
      description: "test desc",
      days: 2,
      hotel: "One",
      trip_type: "Flight"
      }
    }
    parsed = JSON.parse(response.body)
    p parsed
    expect(parsed['status']).to eq('created')
    # expect(parsed).to_not include('trip')
  end
end
