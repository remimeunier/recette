class CreateRecipes < ActiveRecord::Migration[6.0]
  def change
    create_table :recipes do |t|
      t.string :name
      t.integer :time
      t.float :rate
      t.text :ingredients
      t.text :image

      t.timestamps
    end
  end
end
