# frozen_string_literal: true

class RecipesController < ApplicationController
  class IndexParamsValidation
    ONLY_INTEGER_REGEXP = /\A\d+\z/.freeze
    private_constant :ONLY_INTEGER_REGEXP

    def initialize(params)
      @params = params
    end

    def errors
      @errors ||= fill_errors
    end

    private

    attr_reader :params

    def fill_errors
      return [] if !params[:offset] || ONLY_INTEGER_REGEXP.match?(params[:offset])

      # TODO: Use I18n for the error messages:
      ['offset: Invalid format, only positive integers are accepted']
    end
  end
end
