module Api
  module V1
    class UsersController < ApplicationController
      def create
        User.create!(user_params)
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
