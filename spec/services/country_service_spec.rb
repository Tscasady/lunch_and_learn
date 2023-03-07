require 'rails_helper'

RSpec.describe CountryService do
  describe 'class methods' do
    describe 'capital' do
      it 'returns a hash of country data', :vcr do
        country_data = CountryService.capital('France')

        expect(country_data).to be_a Array
        expect(country_data[0][:capital]).to be_a Array
        expect(country_data[0][:capitalInfo]).to be_a Hash
        expect(country_data[0][:capitalInfo][:latlng]).to be_a Array
        expect(country_data[0][:capitalInfo][:latlng].length).to eq 2
        expect(country_data[0][:capitalInfo][:latlng].first).to be_a Float
        expect(country_data[0][:capitalInfo][:latlng].last).to be_a Float
      end
    end
  end
end
