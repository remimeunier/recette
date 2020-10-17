json.extract! recipe, :id, :name, :time, :rate, :ingredients, :image, :created_at, :updated_at
json.url recipe_url(recipe, format: :json)
