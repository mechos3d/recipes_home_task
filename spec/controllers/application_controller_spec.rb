# frozen_string_literal: true

require 'rails_helper'

describe ApplicationController, type: :controller do
  describe 'Error handling' do
    RSpec.shared_examples 'renders_error_page' do |page, status_code|
      it 'renders special error page' do
        get(:index)
        aggregate_failures do
          expect(response).to render_template(page)
          expect(response.status).to eq(status_code)
        end
      end
    end

    context 'when HTTP::TimeoutError is raised' do
      controller do
        def index
          raise HTTP::TimeoutError
        end
      end

      include_examples 'renders_error_page', 'errors/connection_error_page', 503
    end

    context 'when HTTP::ConnectionError is raised' do
      controller do
        def index
          raise HTTP::ConnectionError
        end
      end

      include_examples 'renders_error_page', 'errors/connection_error_page', 503
    end

    context 'when ContentfulModel::NotFoundError is raised' do
      controller do
        def index
          raise ContentfulModel::NotFoundError
        end
      end

      include_examples 'renders_error_page', 'errors/not_found_page', 404
    end
  end
end
