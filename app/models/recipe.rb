class Recipe < ApplicationRecord
  include PgSearch::Model

  belongs_to :author
  has_and_belongs_to_many :tags

  pg_search_scope :search_recipes,
                  against: [:ingredients, :name],
                  associated_against: {
                    tags: :name
                  },
                  #ignoring: :accents, # need postgresql extension
                  using: {
                    tsearch: {
                      dictionary: 'french',
                      tsvector_column: 'searchable',
                      any_word: true,
                      prefix: true
                    }
                  }
end
