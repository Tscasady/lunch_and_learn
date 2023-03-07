require 'rails_helper'

RSpec.describe 'The favorite resources request', type: :request do
  describe 'provides a post endpoint for adding a favorite recipe to a user' do
    it '' do
      post '/api/v1/favorites', params: {
        "api_key": 'jgn983hy48thw9begh98h4539h4',
        "country": 'thailand',
        "recipe_link": 'https://www.tastingtable.com/',
        "recipe_title": 'Crab Fried Rice (Khaao Pad Bpu)'
      }

      expect(response.status).to be 201
      message = JSON.parse(response.body, symbolize_names: true)
      expect(message[:success]).to eq 'Favorite added successfully'

      favorite = Favorite.last
      expect(favorite.api_key).to eq 'jgn983hy48thw9begh98h4539h4'
      expect(favorite.country).to eq 'thailand'
      expect(favorite.recipe_link).to eq 'https://www.tastingtable.com/'
      expect(favorite.recipe_title).to eq 'Crab Fried Rice (Khaao Pad Bpu)'
    end
  end
end
