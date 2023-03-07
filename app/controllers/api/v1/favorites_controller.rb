module Api
  module V1
    class FavoritesController < ApplicationController
      def create
        render json: FavoriteSerializer.new(Favorite.create!(favorite_params)), status: 201
      end

      private 

      def favorite_params
        params.require(:favorite)
      end

    end
  end
end
