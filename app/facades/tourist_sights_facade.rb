class TouristSightsFacade
  def self.sights(country)
    response = TouristSightService.sights(country)

    response[:hits].map do |tourist_sight|
      TouristSight.new(tourist_sight) 
    end
  end
end
