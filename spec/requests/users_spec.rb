require 'rails_helper'
require 'json'

describe 'Users API', type: :request do
  it 'return the created user' do
    FactoryBot.create(:user, username: 'María', email: 'anemail@mail.com', password: '111111',
                             password_confirmation: '111111')
    get '/api/v1/users/1'

    expect(response).to have_http_status(:success)
    expect(JSON.parse(response.body).size).to eq(6)
    expect(JSON.parse(response.body).size).to_not eq(0)
  end

  it 'creates a user' do
    post '/api/v1/users', params: {
      user: {
        username: 'MariaB',
        email: 'a2nemail@mail.com',
        password: '111111',
        password_confirmation: '111111'
      }
    }
    expect(response).to have_http_status(:success)
    parsed = JSON.parse(response.body)
    expect(parsed.size).to eq(6)
    expect(parsed.size).to_not eq(0)
    expect(parsed['username']).to eq('MariaB')
    expect(parsed['email']).to eq('a2nemail@mail.com')
    expect(parsed['username']).to_not eq('')
    expect(parsed['email']).to_not eq('')
  end

  it 'delete a user' do
    post '/api/v1/users', params: {
      user: {
        username: 'MariaB',
        email: 'a2nemail@mail.com',
        password: '111111',
        password_confirmation: '111111'
      }
    }
    expect(response).to have_http_status(:success)
    expect(JSON.parse(response.body).size).to eq(6)
    expect(JSON.parse(response.body).size).to_not eq(0)

    delete '/api/v1/users/3'
    expect(response).to have_http_status(:success)
    expect(JSON.parse(response.body).size).to_not eq(3)
  end

  it 'update a user' do
    post '/api/v1/users', params: {
      user: {
        username: 'MariaB',
        email: 'a2nemail@mail.com',
        password: '111111',
        password_confirmation: '111111'
      }
    }
    expect(response).to have_http_status(:success)
    parsed = JSON.parse(response.body)
    expect(parsed['username']).to eq('MariaB')

    put '/api/v1/users/4', params: {
      user: {
        username: 'Maria',
        email: 'a2nemail@mail.com',
        password: '111111',
        password_confirmation: '111111'
      }
    }
    expect(response).to have_http_status(:success)
    parsed = JSON.parse(response.body)['message']
    expect(parsed).to eq('Successfully updated.')
    expect(response).to_not have_http_status(401)
  end
end
