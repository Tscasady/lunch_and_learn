module Api
  module V1
    class UsersController < ApplicationController
      def create
        render json: UserSerializer.new(User.create!(user_params)), status: 201
      end

      private 

      def user_params
        params.require(:user).permit(:name, :email).merge(api_key: key)
      end

      def key
        ApiKeyGenerator.new.key
      end
    end
  end
end
