module Api
  module V1
    class RecipesController < ApplicationController
      def index
        render json: RecipeSerializer.new(RecipeFacade.recipes(country) ) 
      end

      private 

      def country
        GuaranteedCountry.fetch(params[:country])
      end
    end
  end
end
