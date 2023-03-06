module Api
  module V1
    class LearningResourcesController < ApplicationController
      def index
        lr = LearningResourceService.search(params[:country])
        render json: LearningResourceSeraializer(lr)
      end
    end
  end
end
