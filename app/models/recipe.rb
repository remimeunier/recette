class Recipe < ApplicationRecord
  include PgSearch::Model

  belongs_to :author
  pg_search_scope :search_recipes,
                  against: :ingredients,
                  using: {
                    tsearch: {
                      dictionary: 'french', tsvector_column: 'searchable'
                    }
                  }
end
