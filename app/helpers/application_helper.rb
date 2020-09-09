# frozen_string_literal: true

module ApplicationHelper
  def query_params
    request.query_parameters
  end
end
