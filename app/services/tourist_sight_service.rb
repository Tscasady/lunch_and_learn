class TouristSightService
  BASE_URL = ''

  def self.sights(country)
    parse(conn.get('') do |req|
      req.params['q'] = country 
    end)
  end

  def self.conn
    Faraday.new(conn_params)
  end

  def self.conn_params
    {
      url: BASE_URL,
      params: {
              }
    }
  end

  def self.parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end
