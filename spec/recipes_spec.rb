require 'rails_helper'

RSpec.describe RecipesController, type: :controller do
  let(:user) { create(:user) }
  let(:valid_attributes) do
    {
      name: 'Test Recipe',
      preparation_time: 45,
      cooking_time: 90,
      description: 'Test recipe description.'
    }
  end

  before do
    sign_in user
  end

  describe 'POST #create' do
    context 'with valid parameters' do
      it 'creates a new Recipe' do
        expect do
          post :create, params: { recipe: valid_attributes }
        end.to change(Recipe, :count).by(1)
      end

      it 'redirects to the created recipe' do
        post :create, params: { recipe: valid_attributes }
        expect(response).to redirect_to(recipe_url(Recipe.last))
      end
    end

    context 'with invalid parameters' do
      it "returns a success response (i.e., to display the 'new' template)" do
        post :create, params: { recipe: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  private

  def invalid_attributes
    {
      name: nil,
      preparation_time: 45,
      cooking_time: 90,
      description: 'Test recipe description.'
    }
  end
end
