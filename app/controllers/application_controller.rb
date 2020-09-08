# frozen_string_literal: true

class ApplicationController < ActionController::Base
  rescue_from HTTP::TimeoutError, HTTP::ConnectionError do
    render '/errors/connection_error_page', status: :service_unavailable
  end
end
