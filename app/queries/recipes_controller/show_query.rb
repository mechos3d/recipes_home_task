# frozen_string_literal: true

class RecipesController < ApplicationController
  class ShowQuery
    def self.call(params)
      new(params).call
    end

    def initialize(params)
      @params = params
    end

    def call
      Recipe.params(include: 2).where(id: params[:id]).load!.first
    end

    private

    attr_reader :params
  end
end
