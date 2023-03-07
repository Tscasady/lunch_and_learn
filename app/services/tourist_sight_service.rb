class TouristSightService
  BASE_URL = 'https://api.geoapify.com'
  RADIUS = 20000 

  def self.sights(lat, lng)
    parse(conn.get('/v2/places') do |req|
      req.params[:filter] = "circle:#{lng},#{lat},#{RADIUS}" 
    end)
  end

  def self.conn
    Faraday.new(conn_params)
  end

  def self.conn_params
    {
      url: BASE_URL,
      params: { categories: 'tourism.sights', 
                apiKey: ENV['PLACE_API_KEY'] }
    }
  end

  def self.parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end
