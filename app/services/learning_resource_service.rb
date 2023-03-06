class LearningResourceService
  BASE_URL = 'https://youtube.googleapis.com'

  def self.search(query)
    parse(conn.get('/youtube/v3/search') do |req|
      req.params[:q] = query
    end)
  end

  def self.conn
    Faraday.new(conn_params)
  end

  def self.conn_params
    {
      url: BASE_URL,
      params: {
        channelId: 'UCluQ5yInbeAkkeCndNnUhpw',
        key: ENV['GOOGLE_API_KEY'],
        type: 'video',
        part: 'snippet'
      }
    }
  end

  def self.parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end

  private_class_method :conn, :conn_params, :parse
end
