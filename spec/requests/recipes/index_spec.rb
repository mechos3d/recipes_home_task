# frozen_string_literal: true

require 'rails_helper'

describe 'GET /recipes', type: :request do
  subject(:call_endpoint) do
    get('/recipes', params: {}, as: :html, headers: {})
  end

  describe 'happy-path' do
    before do
      allow(RecipesController::IndexQuery).to receive(:call).and_return(recipes_stub)
    end

    context 'with empty collection' do
      let(:recipes_stub) { [] }

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
end
