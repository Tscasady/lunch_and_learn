require 'rails_helper'

RSpec.describe 'The recipe request', type: :request do
  describe 'provides the recipes by country endpoint' do
    it 'can return all recipes for a given country', :vcr do
      get '/api/v1/recipes?country=thailand'
      expect(response).to be_successful

      recipes = JSON.parse(response.body, symbolize_names: true)[:data]

      expected_keys = %i[id type attributes]
      expected_attributes = %i[title url country image]
      expect(recipes.first.keys).to eq expected_keys
      expect(recipes.first[:attributes].keys).to eq expected_attributes
      
      expect(recipes).to be_a Array
      recipes.each do |recipe| 
        expect(recipe[:id]).to eq nil
        expect(recipe[:type]).to eq "recipe"
        expect(recipe[:attributes]).to be_a Hash
        expect(recipe[:attributes][:title]).to be_a String
        expect(recipe[:attributes][:url]).to be_a String
        expect(recipe[:attributes][:country]).to be_a String
        expect(recipe[:attributes][:image]).to be_a String
      end
    end

    it 'can provide recipes from a random country if no country is given' do
      get '/api/v1/recipes'
      expect(response).to be_successful

      recipes = JSON.parse(response.body, symbolize_names: true)[:data]
      
      expect(recipes).to be_a Array
      recipes.each do |recipe| 
        expect(recipe[:id]).to eq nil
        expect(recipe[:type]).to eq 'recipe'
        expect(recipe[:attributes]).to be_a Hash
        expect(recipe[:attributes][:title]).to be_a String
        expect(recipe[:attributes][:url]).to be_a String
        expect(recipe[:attributes][:country]).to be_a String
        expect(recipe[:attributes][:image]).to be_a String
      end
    end

    it 'can return an empty array if no recipes are found', :vcr do
      get '/api/v1/recipes?country=notcountry'
      expect(response).to be_successful

      recipes = JSON.parse(response.body, symbolize_names: true)[:data]

      expect(recipes).to eq []
    end

    it 'can return an empty array if country param is an empty string', :vcr do
      get '/api/v1/recipes?country='
      expect(response).to be_successful

      recipes = JSON.parse(response.body, symbolize_names: true)[:data]

      expect(recipes).to eq []
    end
  end
end

