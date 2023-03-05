require 'rails_helper'

RSpec.describe RecipeFacade do
  it 'can create a list of recipe objects' do
    recipes = RecipeFacade.recipes('thailand')
    expect(recipes).to be_a Array
    recipes.each do |recipe|
      expect(recipe).to be_a Recipe
    end
  end
end
