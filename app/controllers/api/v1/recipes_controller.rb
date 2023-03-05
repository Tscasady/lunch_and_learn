module Api
  module V1
    class RecipesController < ApplicationController
      def index
        if params[:country] == ''
          render json: { data: [] }
        else
          recipes = RecipeFacade.recipes(country) 
          render json: RecipeSerializer.new(recipes) 
        end
      end

      private 

      def country
        GuaranteedCountry.fetch(params[:country])
      end
    end
  end
end
