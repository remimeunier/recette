class RecipesController < ApplicationController
  before_action :set_recipe, only: :show

  def index
    if params['search'] && params['search'] != ''
      @recipes = Recipe.search_recipes(params['search']).includes(:author, :tags)
    else
      @recipes = Recipe.none
    end
    set_filter
  end

  def show
  end

  private

    def set_recipe
      @recipe = Recipe.find(params[:id])
    end

    def set_filter
      if params['less_than'] && params['less_than'] != ''
        # total_time in saved in secondes
        @recipes = @recipes.where("total_time <= ?", params['less_than_minutes'].to_i * 60)
      end
      if params['rating_greater_than'] && params['rating_greater_than'] != ''
        # with a rate greater than
        @recipes = @recipes.where("rate >= ?", params['rating_greater_than'].to_f)
      end
      # for pagination
      @recipes = @recipes.page(params[:page])
    end

    # Only allow a list of trusted parameters through.
    def recipe_params
      params.require(:recipe).permit(:search, :less_than_minutes, :rating_greater_than)
    end
end
