# frozen_string_literal: true

class RecipesController < ApplicationController
  before_action :validate_index_params, only: :index

  def index
    @recipes = IndexQuery.call(index_params)
  end

  def show
    # TODO: sanitize, and validate params
    id = params.require(:id)
    # TODO: raise some exception inside ShowQuery if not found and rescue it in ApplicationController.
    recipe = ShowQuery.call(id: id)
    @recipe = Recipe::ShowPresenter.new(recipe)
  end

  private

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
