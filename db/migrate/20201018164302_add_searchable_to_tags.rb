class AddSearchableToTags < ActiveRecord::Migration[6.0]
  def up
    execute <<-SQL
      ALTER TABLE Tags
      ADD COLUMN searchable tsvector GENERATED ALWAYS AS (
        to_tsvector('french', coalesce(name, ''))
      ) STORED;
    SQL
  end

  def down
    remove_column :tags, :searchable
  end
end
