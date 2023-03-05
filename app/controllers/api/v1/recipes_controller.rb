module Api
  module V1
    class RecipesController < ApplicationController
      def index
        if params[:country] == ''
          render json: { data: [] }
        else
          recipes = RecipeFacade.recipes(params[:country]) 
          render json: RecipeSerializer.new(recipes) 
        end
      end
    end
  end
end
