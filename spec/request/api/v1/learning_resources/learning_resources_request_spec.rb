require 'rails_helper'

RSpec.describe 'The learning resources request', type: :request do
  describe 'provides the learning resources by country endpoint', :vcr do
    it 'can return all recipes for a given country' do
      get '/api/v1/learning_resources?country=laos'
      expect(response).to be_successful

      learning_resource = JSON.parse(response.body, symbolize_names: true)[:data]
      
      expect(learning_resource).to be_a Hash
      expect(learning_resource[:id]).to eq nil
      expect(learning_resource[:type]).to eq "learning_resource"
      expect(learning_resource[:attributes]).to be_a Hash
      expect(learning_resource[:attributes][:country]).to be_a String
      expect(learning_resource[:attributes][:video]).to be_a Hash
      expect(learning_resource[:attributes][:video][:title]).to be_a String
      expect(learning_resource[:attributes][:video][:youtube_video_id]).to be_a String
      expect(learning_resource[:attributes][:images]).to be_a Array
      expect(learning_resource[:attributes][:images][0]).to be_a Hash
      expect(learning_resource[:attributes][:images][0][:alt_tag]).to be_a String
      expect(learning_resource[:attributes][:images][0][:url]).to be_a String
    end

    it 'can return an empty hash for the video field if no video is found' do
      get '/api/v1/learning_resources?country=notcountry'
      expect(response).to be_successful

      learning_resource = JSON.parse(response.body, symbolize_names: true)[:data]

      expect(learning_resource[:attributes][:video]).to eq({})
    end

    it 'can return an empty array for the images field if no images are found' do
      get '/api/v1/learning_resources?country=notcountry'
      expect(response).to be_successful

      learning_resource = JSON.parse(response.body, symbolize_names: true)[:data]

      expect(learning_resource[:attributes][:images]).to eq []
    end
  end
end

