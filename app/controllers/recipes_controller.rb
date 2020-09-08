# frozen_string_literal: true

class RecipesController < ApplicationController
  def index
    # TODO: validate offset param (no negative or non-integer values)
    @recipes = IndexQuery.call(
      params.permit(:offset).to_h.symbolize_keys
    )
  end

  def show
    # TODO: sanitize, and validate params
    recipe = ShowQuery.call(id: params.require(:id))
    @recipe = Recipe::ShowPresenter.new(recipe)
  end
end
