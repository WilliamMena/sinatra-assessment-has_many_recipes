class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :name
      t.text :ingredients
      t.string :serving_size
      t.string :cook_time
      t.text :directions
      t.integer :user_id
      t.integer :category_id
    end
  end
end
