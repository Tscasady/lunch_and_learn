class CountryService
  BASE_URL = 'https://restcountries.com'

  def self.country
    parse(conn.get('/v3.1/all')) 
  end

  def self.conn
    Faraday.new(conn_params)
  end

  def self.conn_params
    {
      url: BASE_URL
    }
  end

  def self.parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end
