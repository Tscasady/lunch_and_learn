module Api
  module V1
    class FavoritesController < ApplicationController
      def create
        user = User.find_by(api_key: params[:favorite][:api_key])
        Favorite.create!(favorite_params(user))
        # user.favorites.create!(favorite_params)
        render json: { success: 'Favorite added successfully' }, status: 201
      end

      private 

      def favorite_params(user)
        params.require(:favorite).permit(:country, :recipe_link, :recipe_title).merge(user: user)
      end
    end
  end
end
