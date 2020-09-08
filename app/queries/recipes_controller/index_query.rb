# frozen_string_literal: true

class RecipesController < ApplicationController
  class IndexQuery
    DEFAULT_LIMIT = 10
    DEFAULT_ORDER = { calories: :desc }.freeze
    private_constant :DEFAULT_LIMIT, :DEFAULT_ORDER

    def self.call(params)
      new(params).call
    end

    def initialize(offset: 0, limit: DEFAULT_LIMIT, order: DEFAULT_ORDER)
      @offset = offset
      @limit  = limit
      @order  = order
    end

    def call
      Recipe.params(include: 2)
            .offset(offset)
            .limit(limit)
            .order(order)
            .load
    end

    private

    attr_reader :offset, :limit, :order
  end
end
