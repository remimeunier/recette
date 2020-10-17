class CreateRecipes < ActiveRecord::Migration[6.0]
  def change
    create_table :authors do |t|
      t.string :name
      t.timestamps
    end

    create_table :recipes do |t|
      t.string :name
      t.integer :total_time
      t.integer :prep_time
      t.integer :cook_time
      t.text :author_tip
      t.float :rate
      t.text :ingredients
      t.text :image
      t.references :author, index: true, foreign_key: true
      t.timestamps
    end
  end
end
