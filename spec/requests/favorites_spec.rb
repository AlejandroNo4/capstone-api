require 'rails_helper'
require 'json'

describe 'Trips API', type: :request do
  it "can be ADDED to a user's favorite" do
    FactoryBot.create(:trip, id: 15, destiny: 'Paris', price: 13.23, description: 'An amazing trip', days: 10,
                             hotel: 'One', trip_type: 'Car')
    FactoryBot.create(:user, id: 33, username: 'Pablo', email: 'examplep@mail.com', password: '111111',
                             password_confirmation: '111111', admin: true)

    post '/api/v1/sessions', params: {
      user: {
        email: 'examplep@mail.com',
        password: '111111'
      }
    }

    post '/api/v1/favorites', params: {
      trip_id: 15
    }

    message_parsed = JSON.parse(response.body)
    expect(message_parsed['message']).to eq('Successfully added')
    expect(message_parsed['message']).to_not eq('Unable to add.')

    get '/api/v1/logged_in'
    parsed = JSON.parse(response.body)
    expect(parsed['trips'].size).to be(1)
    expect(parsed['trips'].size).to_not be(0)
  end

  it "can be DELETED to a user's favorite" do
    FactoryBot.create(:trip, id: 15, destiny: 'Paris', price: 13.23, description: 'An amazing trip', days: 10,
                             hotel: 'One', trip_type: 'Car')
    FactoryBot.create(:user, id: 33, username: 'Pablo', email: 'examplep@mail.com', password: '111111',
                             password_confirmation: '111111', admin: true)

    post '/api/v1/sessions', params: {
      user: {
        email: 'examplep@mail.com',
        password: '111111'
      }
    }

    post '/api/v1/favorites', params: {
      trip_id: 15
    }

    message_parsed = JSON.parse(response.body)
    expect(message_parsed['message']).to eq('Successfully added')
    expect(message_parsed['message']).to_not eq('Unable to add.')

    get '/api/v1/logged_in'
    parsed = JSON.parse(response.body)
    expect(parsed['trips'].size).to be(1)
    expect(parsed['trips'].size).to_not be(0)

    get '/api/v1/remove_favorite', params: {
      trip_id: 15
    }

    parsed_deleted = JSON.parse(response.body)
    expect(parsed_deleted['message']).to eq('Successfully deleted.')
    expect(parsed_deleted['message']).to_not eq('')
  end
end
