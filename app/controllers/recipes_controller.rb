class RecipesController < ApplicationController
  
  def show 
    @recipe = Recipe.find(params[:id])
    if @recipe.ingredients.last.try(:name)
      @recipe.ingredients.build
    end
  end

  def new
  @recipe = Recipe.new
  @recipe.ingredients.build(ingredient_name_1: 'pepper')
  @recipe.ingredients.build(ingredient_name_2: 'salt')
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
      :ingredient_quantity,
      :ingredient_name
    ]
  )
end
end
