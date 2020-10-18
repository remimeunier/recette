class RecipesController < ApplicationController
  before_action :set_recipe, only: :show

  def index
    if params['search'] && params['search'] != ''
      @recipes = Recipe.search_recipes(params['search']).includes(:author, :tags)
    else
      @recipes = []
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
