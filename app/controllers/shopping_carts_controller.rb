class ShoppingCartsController < ApplicationController
  before_action :authenticate_user! # Add this if you want to ensure users are signed in

  def show
    @cart_items = current_user.shopping_cart_items
  end

  def add_to_cart
    food = Food.find(params[:food_id])
    current_user.add_to_shopping_cart(food)
    redirect_to food, notice: 'Food added to shopping cart.'
  end

  def remove_from_cart
    food = Food.find(params[:food_id])
    current_user.remove_from_shopping_cart(food)
    redirect_to food, notice: 'Food removed from shopping cart.'
  end
end
