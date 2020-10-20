require 'test_helper'

class RecipeTest < ActiveSupport::TestCase

  setup do
    @author = Author.create(name: "someone")
    @r2 = Recipe.create(name: 'Lasagne Végétarienne', ingredients: 'Champignon pate',
                        author: @author)
  end

  test "search_recipes should return full singredient before double match on one word" do
    r1 = Recipe.create(name: 'Lasagne', ingredients: 'Champignon champignon viande', author: @author)
    results =  Recipe.search_recipes('Champignon pate')
    assert results.first == @r2
    assert results.second == r1
  end

  test "search_recipes should look into tags" do
    tag = Tag.create(name: 'Copieu')
    r1 = Recipe.create(name: 'Lasagne', ingredients: 'Champignon viande',
                       author: @author, tags: [tag])
    results =  Recipe.search_recipes('Copieu Champignon')
    assert results.first == r1
    assert results.second == @r2
  end

  test "search_recipes should look into recipe name" do
    r1 = Recipe.create(name: 'Lasagne', ingredients: 'Champignon viande',
                       author: @author)
    results =  Recipe.search_recipes('Végétarienne Champignon')
    assert results.first == @r2
    assert results.second == r1
  end

  test "search_recipes should prefix search" do
    r1 = Recipe.create(name: 'Lasagne', ingredients: 'Choup',
                       author: @author)
    results =  Recipe.search_recipes('Champ')
    assert results.first == @r2
    assert results.second == nil
  end
end
