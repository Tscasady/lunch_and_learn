class GuaranteedCountry
  def self.fetch(country = nil)
    country || random_country
  end

  def self.random_country
    country_list = all_country_data.map do |country_data|
      country_data[:name][:official] 
    end

    country_list.sample
  end

  def self.all_country_data
    Rails.cache.fetch('all/countries', expires_in: 1.day) { CountryService.country }
  end

  private_class_method :random_country, :all_country_data
end
