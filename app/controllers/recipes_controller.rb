class RecipesController < ApplicationController
  
  def show 
    @recipe = Recipe.find(params[:id])
    if @recipe.ingredients.last.try(:name)
      @recipe.ingredients.build
    end
  end

  def new
  @recipe = Recipe.new
  2.times {@recipe.ingredients.build}
  end

def create
  recipe = Recipe.create(recipe_params)
  redirect_to recipe
end

def update
  recipe = Recipe.find(params[:id])
  recipe.update(recipe_params)
  redirect_to recipe
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
