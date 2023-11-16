require 'rails_helper'

RSpec.describe FoodsController, type: :controller do
  let(:valid_attributes) do
    {
      name: 'Test Food',
      measurement_unit: 'ounces',
      price: 15.99,
      quantity: 2
    }
  end

  describe 'POST #create' do
    context 'with valid parameters' do
      it 'creates a new Food' do
        expect do
          post :create, params: { food: valid_attributes }
        end.to change(Food, :count).by(1)
      end

      it 'redirects to the created food' do
        post :create, params: { food: valid_attributes }
        expect(response).to redirect_to(food_url(Food.last))
      end
    end

    context 'with invalid parameters' do
      it "returns a success response (i.e., to display the 'new' template)" do
        post :create, params: { food: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  private

  def invalid_attributes
    {
      name: nil,
      measurement_unit: 'ounces',
      price: 15.99,
      quantity: 2
    }
  end
end
