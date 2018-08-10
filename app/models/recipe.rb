class Recipe < ActiveRecord::Base
  has_many :ingredients

  def new
  @recipe = Recipe.new
  @recipe.ingredients.build(ingredient_name: 'pepper')
  @recipe.ingredients.build(ingredient_name: 'salt')
  end

def create
  person = Person.create(person_params)
  redirect_to people_path
end

def index
  @people = Person.all
end
end
