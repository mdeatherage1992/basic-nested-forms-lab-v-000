class Recipe < ActiveRecord::Base
  has_many :ingredients

  def new
  @recipe = Recipe.new
  @recipe.ingredients.build(ingredient_name: 'pepper')
  @recipe.ingredients.build(ingredient_name: 'salt')
  end

def create
  recipe = Recipe.create(recipe_params)
  redirect_to recipe_path
end

def index
  @recipes = Recipe.all
end

private

def recipe_params
  params.require(:recipe).permit(
    :name,
    ingredients_attributes: [
      :ingredient_quantity
      :ingredient_name
    ]
  )
end
end
