class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all.params({ include: 2 }).load
  end

  def show
  end
end
