class AddIndexesToRecipesAndLikes < ActiveRecord::Migration[7.0]
  def change
    unless index_exists?(:likes, :user_id)
      add_index :likes, :user_id
    end

    unless index_exists?(:likes, :recipe_id)
      add_index :likes, :recipe_id
    end

    unless index_exists?(:recipes, :user_id)
      add_index :recipes, :user_id
    end
  end
end
