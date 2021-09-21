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
    p parsed.size
    expect(parsed['destiny']).to eq('Paris')
    expect(parsed.size).to eq(8)
    expect(parsed['destiny']).to_not eq('')
    expect(parsed.size).to_not eq(0)
  end

  it 'can be updated by an ADMIN user' do
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

    patch "/api/v1/trips/3", :params => {
      trip: {
      destiny: "Parisine",
      price: 124.72,
      description: "test desc",
      days: 2,
      hotel: "One",
      trip_type: "Flight"
      }
    }
    parsed = JSON.parse(response.body)
    expect(parsed['message']).to eq('Successfully updated.')
    expect(parsed['message']).to_not eq('Unable to update.')
  end

  it 'can NOT be updated by a normal user' do
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

    delete "/api/v1/logout"

    patch "/api/v1/trips/3", :params => {
      trip: {
      destiny: "Parisine",
      price: 124.72,
      description: "test desc",
      days: 2,
      hotel: "One",
      trip_type: "Flight"
      }
    }
    parsed = JSON.parse(response.body)
    expect(parsed['message']).to eq('Access Denied')
    expect(parsed['message']).to_not eq('Successfully updated.')
  end

  it 'can be deleted by an ADMIN user' do
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

    delete "/api/v1/trips/5"

    parsed = JSON.parse(response.body)
    expect(parsed['message']).to eq('Successfully deleted.')
    expect(parsed['message']).to_not eq('')
  end

  it 'can NOT be deleted by a normal user' do
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

    delete "/api/v1/logout"
    delete "/api/v1/trips/5"

    parsed = JSON.parse(response.body)
    expect(parsed['message']).to eq('Access Denied')
    expect(parsed['message']).to_not eq('Successfully deleted.')
  end
end
