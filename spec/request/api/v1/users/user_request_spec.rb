require 'rails_helper'

RSpec.describe 'The user resources request', type: :request do
  describe 'provides a post endpoint for adding a user' do
    it 'can add a user to the database with an id, name, email, and apikey' do
      post '/api/v1/users', params: { user: { name: 'test', email: 'test@email.com'} }



      
    end
  end
end

