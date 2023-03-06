require 'rails_helper'

RSpec.describe TouristSight do
  it 'exists and has readable attributes' do
    tourist_data = {
    }
    tourist_sight = TouristSight.new(tourist_data)

    expect(tourist_sight.id).to eq nil
    expect(tourist_sight.name).to eq tourist_data[:name] 
    expect(tourist_sight.address).to eq tourist_data[:address] 
    expect(tourist_sight.place_id).to eq tourist_data[:place_id] 
  end
end
