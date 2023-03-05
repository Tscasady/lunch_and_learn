class RecipeService
  BASE_URL = 'https://api.edamam.com'

  def self.recipes(country)
    parse(conn.get('/api/recipes/v2') do |req|
      req.params['q'] = country 
    end)
  end

  def self.conn
    Faraday.new(conn_params)
  end

  def self.conn_params
    {
      url: BASE_URL,
      params: { type: 'public',
                app_id: ENV['app_id'],
                app_key: ENV['app_key'] }
    }
  end

  def self.parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end
