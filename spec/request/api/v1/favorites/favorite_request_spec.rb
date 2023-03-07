require 'rails_helper'

RSpec.describe 'The favorite resources request', type: :request do
  describe 'provides a post endpoint for adding a favorite recipe to a user' do
    it 'can create a new favorite recipe for a user' do
      user = User.create!(name: 'test', email: 'test@email.com', api_key: 'jgn983hy48thw9begh98h4539h4')
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
      expect(user.favorites).to eq [favorite]
      expect(favorite.country).to eq 'thailand'
      expect(favorite.recipe_link).to eq 'https://www.tastingtable.com/'
      expect(favorite.recipe_title).to eq 'Crab Fried Rice (Khaao Pad Bpu)'
    end

    it 'can return an error if user does not exist or cannot be found with provided api_key' do
      user = User.create!(name: 'test', email: 'test@email.com', api_key: 'jgn983hy48thw9begh98h4539h4')
      post '/api/v1/favorites', params: { favorite: {
        "api_key": 'badkey',
        "country": 'thailand',
        "recipe_link": 'https://www.tastingtable.com/',
        "recipe_title": 'Crab Fried Rice (Khaao Pad Bpu)'
      } }

      expect(response.status).to be 422
      message = JSON.parse(response.body, symbolize_names: true)
      expect(message[:user]).to eq ['must exist']

      expect(Favorite.all.count).to eq 0
      expect(user.favorites).to eq []
    end
  end

  describe 'get favorite endpoint' do
    it 'can return a list of favorites for a given user api_key' do
      user = User.create!(name: 'test', email: 'test@email.com', api_key: 'jgn983hy48thw9begh98h4539h4')
      Favorite.create!(country: 'Brazil', recipe_title: 'food thing', recipe_link: 'recipe.com', user: user)
      Favorite.create!(country: 'Canada', recipe_title: 'good meal', recipe_link: 'recipe.com', user: user)
      Favorite.create!(country: 'Mexico', recipe_title: 'tasty dinner', recipe_link: 'recipe.com', user: user)
      get "/api/v1/favorites?api_key=#{user.api_key}"

      expected_favorite_keys = %i[id type attributes]
      expected_attribute_keys = %i[recipe_title recipe_link country created_at]

      expect(response.status).to be 200

      favorites = JSON.parse(response.body, symbolize_names: true)[:data]

      expect(favorites).to be_a Array
      expect(favorites.length).to eq 3
      expect(favorites.first.keys).to eq expected_favorite_keys
      expect(favorites.first[:attributes].keys).to eq expected_attribute_keys

      favorites.each do |favorite|
        expect(favorite[:id]).to be_a String
        expect(favorite[:type]).to eq 'favorite'
        expect(favorite[:attributes]).to be_a Hash
        expect(favorite[:attributes][:recipe_title]).to be_a String
        expect(favorite[:attributes][:recipe_link]).to be_a String
        expect(favorite[:attributes][:country]).to be_a String
        expect(favorite[:attributes][:created_at]).to be_a String
      end

      expect(favorites.first[:attributes][:country]).to eq 'Brazil'
      expect(favorites.last[:attributes][:country]).to eq 'Mexico'
    end

    it 'can return an empty array if the user has not favorited any recipes' do
      user = User.create!(name: 'test', email: 'test@email.com', api_key: 'jgn983hy48thw9begh98h4539h4')
      get "/api/v1/favorites?api_key=#{user.api_key}"

      expect(response.status).to be 200

      favorites = JSON.parse(response.body, symbolize_names: true)[:data]
      expect(favorites).to eq []
    end

    it 'can return an error if the api_key does not refer to a user' do
      User.create!(name: 'test', email: 'test@email.com', api_key: 'jgn983hy48thw9begh98h4539h4')
      get "/api/v1/favorites?api_key=badkey"

      expect(response.status).to be 404
      error = JSON.parse(response.body, symbolize_names: true)
      expect(error[:errors]).to eq "Couldn't find User"
    end
  end
end
