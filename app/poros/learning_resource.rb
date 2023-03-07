class LearningResource
  attr_reader :id, :country, :video, :images
  def initialize(video_data, image_data, country)
    @id = nil
    @country = country 
    @video = parse_video_data(video_data) 
    @images = parse_image_data(image_data)
  end

  private

  def parse_image_data(image_data)
    image_data.map do |image|
      { alt_tag: image[:description], url: image[:urls][:raw]}
    end
  end

  def parse_video_data(video_data)
    return { title: video_data[:snippet][:title], youtube_video_id: video_data[:id][:videoId] } if video_data
    
    {}
  end
end

