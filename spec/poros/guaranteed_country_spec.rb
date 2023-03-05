require 'rails_helper'

RSpec.describe GuaranteedCountry do
  describe 'methods' do
    describe 'fetch' do
      it 'returns the name of a country' do
        country = GuaranteedCountry.fetch('Ireland')
        country2 = GuaranteedCountry.fetch(nil)
        country3 = GuaranteedCountry.fetch

        expect(country).to eq 'Ireland'
        expect(country2).to be_a String
        expect(country2).to_not eq country
        expect(country2).to_not eq country3
      end
    end
  end
end
