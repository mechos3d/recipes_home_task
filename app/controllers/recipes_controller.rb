# frozen_string_literal: true

class RecipesController < ApplicationController
  def index
    @recipes = IndexQuery.call({})
  end

  def show
    # TODO: sanitize, and validate params
    recipe = ShowQuery.call(id: params.require(:id))
    @recipe = Recipe::ShowPresenter.new(recipe)
  end
end
