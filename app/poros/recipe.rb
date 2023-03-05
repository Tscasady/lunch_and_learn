class Recipe
  attr_reader :id, :title, :url, :country, :image

  def initialize(data, country)
    @id = nil
    @title = data[:label]
    @url = data[:url]
    @country = country
    @image = data[:image]
  end
end
