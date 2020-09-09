# frozen_string_literal: true

class RecipesController < ApplicationController
  before_action :set_default_limit, only: :index
  before_action :validate_index_params, only: :index

  def index
    @recipes = IndexQuery.call(
      index_params.reverse_merge(limit: @default_limit)
    )
  end

  def show
    # TODO: sanitize, and validate params (even 'id')
    recipe = ShowQuery.call(id: params.require(:id))
    @recipe = Recipe::ShowPresenter.new(recipe)
  end

  private

  def set_default_limit
    @default_limit = 10
  end

  def index_params
    @index_params ||= params.permit(:offset).to_h.symbolize_keys
  end

  def validate_index_params
    validation = IndexParamsValidation.new(index_params)
    return if validation.errors.empty?

    flash[:error] = validation.errors.join(', ')
    redirect_back(fallback_location: recipes_url)
  end
end
