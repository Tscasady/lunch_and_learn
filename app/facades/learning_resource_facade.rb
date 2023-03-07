class LearningResourceFacade
  def self.search(country)
    video_data = LearningResourceVideoService.search_videos(country)[:items].first
    image_data = LearningResourcePhotoService.search_photos(country)[:results].first(10)
    LearningResource.new(video_data, image_data, country)
  end
end
