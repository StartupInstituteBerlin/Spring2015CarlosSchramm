class CreateRestaurantsCategories < ActiveRecord::Migration
  def change
    create_table :restaurants_categories do |t|

      t.timestamps null: false
    end
  end
end
