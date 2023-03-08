module Api
  module V1
    class LearningResourcesController < ApplicationController
      def index
        lr = Rails.cache.fetch("l_r_search/#{params[:country]}", expires_in: 1.hour) do
          LearningResourceFacade.search(params[:country])
        end
        render json: LearningResourceSerializer.new(lr)
      end
    end
  end
end
