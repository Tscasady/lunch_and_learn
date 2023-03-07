require 'rails_helper'

RSpec.describe TouristSightsFacade do
  it 'can return an array of TouristSight objects', :vcr do
    tourist_sights = TouristSightsFacade.sights('thailand')
    expect(tourist_sights).to be_a Array
    tourist_sights.each do |tourist_sight|
      expect(tourist_sight).to be_a TouristSight
    end
  end
end
