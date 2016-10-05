class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :name
      t.text :ingredients
      t.integer :serving_size
      t.string :cook_time
      t.text :directions
    end
  end
end
