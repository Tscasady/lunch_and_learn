class RecipeFacade
  def self.recipes(country)
    response = RecipeService.recipes(country)

    require 'pry'; binding.pry
    response[:hits].each do |recipe_data|
      Recipe.new(recipe_data) 
    end
  end
end
