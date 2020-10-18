class CreateTags < ActiveRecord::Migration[6.0]
  def change
    create_table :tags do |t|
      t.string :name
      t.timestamps
    end

    create_table :recipes_tags, id: false do |t|
      t.belongs_to :tag
      t.belongs_to :recipe
    end
  end
end
