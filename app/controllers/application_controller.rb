# frozen_string_literal: true

class ApplicationController < ActionController::Base
  rescue_from HTTP::TimeoutError, HTTP::ConnectionError do
    render '/errors/connection_error_page', status: :service_unavailable
  end

  rescue_from ContentfulModel::NotFoundError do
    render '/errors/not_found_page', status: :not_found
  end
end
