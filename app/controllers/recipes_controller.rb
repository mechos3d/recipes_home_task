class RecipesController < ApplicationController
  def index
    # TODO: sanitize, and validate input params (if needed)
    @recipes = IndexQuery.call(params: params)
  end

  def show
    @recipe = Recipe.params(include: 2).find(id)
  end
end
