require 'rails_helper'

RSpec.describe TouristSightService do
  describe 'class methods' do
    describe 'sights' do
      it 'returns a hash of tourist sight data' do
        tourist_sights = TouristSightService.sights('Bosnia')
        
        expect(tourist_sights).to be_a Hash
        expect(tourist_sights[:hits]).to be_a Array
        expect(tourist_sights[:hits][0]).to be_a Hash
        expect(tourist_sights[:hits][0][:recipe]).to be_a Hash
        expect(tourist_sights[:hits][0][:recipe][:url]).to be_a String
        expect(tourist_sights[:hits][0][:recipe][:label]).to be_a String
        expect(tourist_sights[:hits][0][:recipe][:image]).to be_a String
      end
    end
  end
end
