module Api
  module V1
    class FavoritesController < ApplicationController
      def create
        user = User.find_by(api_key: params[:api_key])
        Favorite.create!(favorite_params.merge(user: user))
        render json: { success: 'Favorite added successfully' }, status: 201
      end

      private 

      def favorite_params
        params.permit(:country, :recipe_link, :recipe_title)
      end
    end
  end
end
