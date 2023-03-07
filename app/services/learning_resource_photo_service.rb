class LearningResourcePhotoService
  BASE_URL = 'https://api.unsplash.com/'

  def self.search_photos(query)
    parse(conn.get('/search/photos') do |req|
      req.params[:query] = query
    end)
  end

  def self.conn
    Faraday.new(conn_params)
  end

  def self.conn_params
    {
      url: BASE_URL,
      params: {
        client_id: ENV['UNSPLASH_ACCESS_KEY'],
      }
    }
  end

  def self.parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end

  private_class_method :conn, :conn_params, :parse
end
