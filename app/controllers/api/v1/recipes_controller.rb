module Api
  module V1
    class RecipesController < ApplicationController
      def index
        if params[:q] == ''
          
        else
          recipes = RecipeFacade.new.recipes(params[:q]) 
          @recipes = RecipeSerializer.new(recipes) 
        end
      end
    end
  end
end
