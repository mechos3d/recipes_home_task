# frozen_string_literal: true

require 'rails_helper'

describe ApplicationController, type: :controller do
  describe 'Error handling' do
    RSpec.shared_examples 'renders_special_error_page' do
      it 'renders special error page' do
        get(:index)
        aggregate_failures do
          expect(response).to render_template('errors/connection_error_page')
          expect(response.status).to eq(503)
        end
      end
    end

    context "when HTTP::TimeoutError is raised" do
      controller do
        def index
          raise HTTP::TimeoutError
        end
      end

      it_behaves_like 'renders_special_error_page'
    end

    context "when HTTP::ConnectionError is raised" do
      controller do
        def index
          raise HTTP::ConnectionError
        end
      end

      it_behaves_like 'renders_special_error_page'
    end
  end
end
