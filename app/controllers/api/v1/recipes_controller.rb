module Api
  module V1
    class RecipesController < ApplicationController
      def index
        recipes = Rails.cache.fetch("search/#{country}", expires_in: 4.hour) do
          RecipeFacade.recipes(country)
        end
        render json: RecipeSerializer.new(recipes) 
      end

      private 

      def country
        GuaranteedCountry.fetch(params[:country])
      end
    end
  end
end
