module Api
  module V1
    class LearningResourcesController < ApplicationController
      def index
        lr = LearningResourceFacade.search(params[:country])
        render json: LearningResourceSerializer.new(lr)
      end
    end
  end
end
