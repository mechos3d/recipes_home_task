# frozen_string_literal: true

require 'rails_helper'

describe 'GET /recipes/:id', type: :request do
  subject(:call_endpoint) do
    get("/recipes/#{id}", params: {}, as: :html, headers: {})
  end

  describe 'happy-path' do
    before do
      allow(RecipesController::ShowQuery).to receive(:call).and_return(recipe)
    end

    let(:recipe) { build(:recipe) }
    let(:id)     { recipe.id }

    it 'returns page, status 200 OK' do
      call_endpoint

      aggregate_failures do
        expect(response).to have_http_status(:success)
        expect(response.body).to include(recipe.title)
        expect(response.body).to include(recipe.description)
        expect(response.body).to include(recipe.calories.to_s)
        expect(response.body).to include(recipe.photo.description)
        expect(response.body).to include(recipe.tags.first.name)
        expect(response.body).to include(recipe.chef.name)
      end
    end
  end
end
