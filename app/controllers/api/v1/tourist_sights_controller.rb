module Api
  module V1
    class TouristSightsController < ApplicationController
      def index
        if params[:country] == '' || params[:country].nil?
          render json: { data: [] }
        else
          tourist_sights = TouristSightsFacade.sights(params[:country]) 
          render json: TouristSightSerializer.new(tourist_sights) 
        end
      end
    end
  end
end
