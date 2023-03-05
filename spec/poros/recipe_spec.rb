require 'rails_helper'

RSpec.describe Recipe do
  it 'exists and has readable attributes' do
    recipe_data = {
        label: 'my recipe', 
        url: 'www.food.com', 
        image: 'image.com'
    }
    recipe = Recipe.new(recipe_data, 'France')

    expect(recipe.id).to eq nil
    expect(recipe.country).to eq 'France' 
    expect(recipe.title).to eq recipe_data[:label] 
    expect(recipe.url).to eq recipe_data[:url] 
  end
end
