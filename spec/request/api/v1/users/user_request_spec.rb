require 'rails_helper'

RSpec.describe 'The user resources request', type: :request do
  describe 'provides a post endpoint for adding a user' do
    it 'can add a user to the database with an id, name, email, and apikey' do
      post '/api/v1/users', params: { user: { name: 'test', email: 'test@email.com'} }

      expect(response.status).to be 201

      user = User.last
      expect(user.name).to eq 'test'
      expect(user.email).to eq 'test@email.com' 
      expect(user.api_key).to be_a String
    end

    it 'can return an error if a non unique email is given' do
      post '/api/v1/users', params: { user: { name: 'test', email: 'test@email.com'} }
      post '/api/v1/users', params: { user: { name: 'second_user', email: 'test@email.com'} }

      expect(response.status).to eq 422 
      message = JSON.parse(response.body, symbolize_names: true)
      expect(message[:email].first).to eq 'has already been taken'

      user = User.last
      expect(user.name).to eq 'test'
      expect(user.email).to eq 'test@email.com' 
      expect(user.api_key).to be_a String
    end
  end
end

