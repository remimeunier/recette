require 'test_helper'

class RecipesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @author = Author.create(name: "someone")
    @r1 = Recipe.create(name: 'Lasagne Végétarienne', ingredients: 'Champignon pate',
                        author: @author)
    @r2 = Recipe.create(name: 'Lasagne', ingredients: 'Champignon champignon viande', author: @author)
  end

  test "should get index and return empty recipes" do
    get recipes_url
    assert_response :success
    assert !response.body.include?('Végétarienne')
    assert !response.body.include?('viande')
    assert !response.body.include?('pate')
    assert !response.body.include?('someone')
  end

  test "should get index and return both recipes" do
    get recipes_url params: { search: "Lasagne"}
    assert_response :success
    assert response.body.include?('Végétarienne')
    assert response.body.include?('viande')
    assert response.body.include?('pate')
    assert response.body.include?('someone')
  end
end
