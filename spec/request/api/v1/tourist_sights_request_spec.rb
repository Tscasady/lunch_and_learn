require 'rails_helper'

RSpec.describe 'The tourist sights request', type: :request do
  describe 'provides the tourist sights by country endpoint' do
    it 'can return all tourist sights within 20km of the capital of a given country', :vcr do
      get '/api/v1/tourist_sights?country=France'

      expect(response).to be_successful

      tourist_sights = JSON.parse(response.body, symbolize_names: true)[:data]
      
      expect(tourist_sights).to be_a Array
      tourist_sights.each do |tourist_sight| 
        expect(tourist_sight[:id]).to eq nil
        expect(tourist_sight[:type]).to eq "tourist_sight"
        expect(tourist_sight[:attributes]).to be_a Hash
        expect(tourist_sight[:attributes][:name]).to be_a String
        expect(tourist_sight[:attributes][:address]).to be_a String
        expect(tourist_sight[:attributes][:place_id]).to be_a String
      end
    end

    it 'can return an empty array if no country is provided' do
      get '/api/v1/tourist_sights?'
      expect(response).to be_successful

      tourist_sights = JSON.parse(response.body, symbolize_names: true)[:data]

      expect(tourist_sights).to eq []
    end
  end
end

