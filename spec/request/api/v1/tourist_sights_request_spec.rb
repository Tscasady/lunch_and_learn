require 'rails_helper'

RSpec.describe 'The tourist sights request', type: :request do
  describe 'provides the tourist sights by country endpoint' do
    it 'can return all tourist sights within 20km of the capital of a given country' do
      get '/api/v1/tourist_sights?country=France'

      expect(response).to be_successful

      tourist_sights = JSON.parse(response.body, symbolize_names: true)[:data]
      
      expect(tourist_sights).to be_a Array
      tourist_sights.each do |tourist_sight| 
        expect(toursit_sights[:id]).to eq nil
        expect(toursit_sights[:type]).to eq "tourist_sight"
        expect(toursit_sights[:attributes]).to be_a Hash
        expect(toursit_sights[:attributes][:name]).to be_a String
        expect(toursit_sights[:attributes][:address]).to be_a String
        expect(toursit_sights[:attributes][:place_id]).to be_a String
      end
    end

    it 'can return an empty array if no tourist_sights are found' do
      get '/api/v1/tourist_sights?country=notacountry'
      expect(response).to be_successful

      tourist_sights = JSON.parse(response.body, symbolize_names: true)[:data]

      expect(tourist_sights).to eq []
    end
  end
end

