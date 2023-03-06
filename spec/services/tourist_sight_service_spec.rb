require 'rails_helper'

RSpec.describe TouristSightService do
  describe 'class methods' do
    describe 'sights' do
      it 'returns a hash of tourist sight data' do
        #Coords for Sarajevo
        lat = 43.8 
        lng = 18.4 
        tourist_sights = TouristSightService.sights(lat, lng)
        
        expect(tourist_sights).to be_a Hash
        expect(tourist_sights[:features]).to be_a Array
        expect(tourist_sights[:features][0]).to be_a Hash
        expect(tourist_sights[:features][0][:properties]).to be_a Hash
        expect(tourist_sights[:features][0][:properties][:name]).to be_a String
        expect(tourist_sights[:features][0][:properties][:formatted]).to be_a String
        expect(tourist_sights[:features][0][:properties][:place_id]).to be_a String
      end
    end
  end
end
