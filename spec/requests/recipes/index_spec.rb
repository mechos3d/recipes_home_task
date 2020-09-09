# frozen_string_literal: true

require 'rails_helper'

describe 'GET /recipes', type: :request do
  subject(:call_endpoint) do
    get('/recipes', params: params, as: :html, headers: { 'HTTP_REFERER' => 'where_i_came_from' })
  end

  let(:params) { {} }
  let(:recipes_stub) { [] }

  before do
    allow(RecipesController::IndexQuery).to receive(:call).and_return(recipes_stub)
  end

  describe 'happy-path' do
    let(:recipes_stub) { [] }

    context 'with empty collection' do
      it 'returns page, status 200 OK' do
        call_endpoint

        aggregate_failures do
          expect(response).to have_http_status(:success)
        end
      end
    end

    context 'with collection consisting of one element' do
      let(:recipe) { build(:recipe) }
      let(:recipes_stub) { [recipe] }

      it 'returns page, status 200 OK' do
        call_endpoint

        aggregate_failures do
          expect(response).to have_http_status(:success)
          expect(response.body).to include(recipe.title)
        end
      end
    end

    context 'with collection consisting of two elements' do
      let(:recipe_one) { build(:recipe) }
      let(:recipe_two) { build(:recipe) }
      let(:recipes_stub) { [recipe_one, recipe_two] }

      it 'returns page, status 200 OK' do
        call_endpoint

        aggregate_failures do
          expect(response).to have_http_status(:success)
          recipes_stub.each do |recipe|
            expect(response.body).to include(recipe.title)
          end
        end
      end
    end
  end
  # END 'happy-path'

  describe 'foo' do
    context 'when given valid offset' do
      let(:params) { { offset: '777' } }

      it 'render page' do
        call_endpoint

        aggregate_failures do
          expect(RecipesController::IndexQuery).to have_received(:call).with(offset: '777')
          expect(response).to render_template('index')
        end
      end
    end

    RSpec.shared_examples 'redirects_back' do
      it 'redirects back' do
        call_endpoint

        aggregate_failures do
          expect(RecipesController::IndexQuery).not_to have_received(:call)
          expect(response).to redirect_to('where_i_came_from')
        end
      end
    end

    context 'when offset includes a letter' do
      let(:params) { { offset: 'a1' } }

      it_behaves_like 'redirects_back'
    end

    context 'when offset is a negative number' do
      let(:params) { { offset: '-1' } }

      it_behaves_like 'redirects_back'
    end

    context 'when offset is a decimal' do
      let(:params) { { offset: '1.5' } }

      it_behaves_like 'redirects_back'
    end
  end
end
