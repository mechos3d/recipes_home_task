# frozen_string_literal: true

class RecipesController < ApplicationController
  def index
    # TODO: sanitize, and validate, slice params
    @recipes = IndexQuery.call(params.permit!.to_h)
  end

  def show
    # TODO: sanitize, and validate, slice params
    @recipe = ShowQuery.call(params.permit!.to_h)
  end
end
