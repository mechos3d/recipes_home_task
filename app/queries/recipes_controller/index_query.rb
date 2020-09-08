# frozen_string_literal: true

class RecipesController < ApplicationController
  class IndexQuery
    def self.call(params)
      new(params).call
    end

    def initialize(params)
      @params = params
    end

    def call
      Recipe.all.params(include: 2).load
    end

    private

    attr_reader :params
  end
end
