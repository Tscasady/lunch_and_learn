class RecipeSerializer
  include JSONAPI::Serializer
  attributes :id, :type, :attributes
end
