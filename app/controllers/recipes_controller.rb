class RecipesController < ApplicationController
  before_action :set_recipe, only: :show

  def index
    unless params['search'] && params['search'] != ''
      @recipes = Recipe.all.includes(:author)
    else
      @recipes = Recipe.search_recipes(params['search']).includes(:author)
    end
  end

  def show
  end

  private

    def set_recipe
      @recipe = Recipe.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def recipe_params
      params.require(:recipe).permit(:search)
    end
end
