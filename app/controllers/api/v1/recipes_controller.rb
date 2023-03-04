module Api
  module V1
    class RecipesController < ApplicationController
      def index
        if params[:country] == ''
        else
          recipes = RecipeFacade.recipes(params[:country]) 
          @recipes = RecipeSerializer.new(recipes) 
        end
      end
    end
  end
end
