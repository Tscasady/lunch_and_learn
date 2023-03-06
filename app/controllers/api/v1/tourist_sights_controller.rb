module Api
  module V1
    class TouristSightsController < ApplicationController
      def index
        if params[:country] == ''
          render json: { data: [] }
        else
          tourist_sights = TouristSightsFacade.sights(country) 
          render json: TouristSightsSerializer.new(tourist_sights) 
        end
      end
    end
  end
end
