require 'rails_helper'

RSpec.describe RecipeService do
  describe 'class methods' do
    describe 'recipes' do
      it 'returns a hash of recipe data' do
        recipe_data = RecipeService.recipes('Bosnia')
        
        expect(recipe_data).to be_a Hash
        expect(recipe_data[:hits]).to be_a Array
        expect(recipe_data[:hits][0]).to be_a Hash
        expect(recipe_data[:hits][0][:recipe]).to be_a Hash
        expect(recipe_data[:hits][0][:recipe][:url]).to be_a String
        expect(recipe_data[:hits][0][:recipe][:label]).to be_a String
        expect(recipe_data[:hits][0][:recipe][:image]).to be_a String
      end
    end
  end
end
