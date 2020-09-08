# frozen_string_literal: true

class RecipesController < ApplicationController
  class ShowQuery
    def self.call(params)
      new(params).call
    end

    def initialize(params)
      @params = params

      # TODO: make more concrete exception here:
      raise unless params[:id]
    end

    def call
      Recipe.params(include: 2).find(params[:id])
    end

    private

    attr_reader :params
  end
end
