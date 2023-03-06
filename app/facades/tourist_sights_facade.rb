class TouristSightsFacade
  def self.sights(country)
    lat, lng = capital_data(country)
    response = TouristSightService.sights(lat, lng)

    response[:features].map do |tourist_sight_data|
      TouristSight.new(tourist_sight_data) 
    end
  end

  def self.capital_data(country)
    CountryService.capital(country).first[:capitalInfo][:latlng]
  end
end
