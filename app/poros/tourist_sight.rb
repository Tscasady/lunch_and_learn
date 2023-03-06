class TouristSight
  def initialize(tourist_data)
    @id = nil
    @name = tourist_data[:properties][:name]
    @address = tourist_data[:properties][:formatted]
    @place_id = tourist_data[:properties][:place_id]
  end
end
