class AddIngredientsTsvector < ActiveRecord::Migration[6.0]
  def up
    execute <<-SQL
      ALTER TABLE Recipes
      ADD COLUMN searchable tsvector GENERATED ALWAYS AS (
        to_tsvector('french', coalesce(ingredients, ''))
      ) STORED;
    SQL
  end

  def down
    remove_column :recipes, :searchable
  end
end
