class TouristSight
  attr_reader :id, :name, :address, :place_id

  def initialize(tourist_data)
    @id = nil
    @name = tourist_data[:properties][:name]
    @address = tourist_data[:properties][:formatted]
    @place_id = tourist_data[:properties][:place_id]
  end
end
