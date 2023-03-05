class RecipeFacade
  def self.recipes(country)
    response = RecipeService.recipes(country)

    response[:hits].map do |recipe_data|
      Recipe.new(recipe_data[:recipe], country) 
    end
  end
end
