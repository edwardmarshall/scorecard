require 'test_helper'

class AnimalsControllerTest < ActionController::TestCase
  setup do
    @animal = animals(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:animals)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create animal" do
    assert_difference('Animal.count') do
      post :create, animal: { alias: @animal.alias, certification: @animal.certification, hunter: @animal.hunter, image: @animal.image, kind: @animal.kind, region: @animal.region, spread_greatest: @animal.spread_greatest, spread_inside: @animal.spread_inside, spread_tip: @animal.spread_tip, state: @animal.state, unit: @animal.unit }
    end

    assert_redirected_to animal_path(assigns(:animal))
  end

  test "should show animal" do
    get :show, id: @animal
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @animal
    assert_response :success
  end

  test "should update animal" do
    put :update, id: @animal, animal: { alias: @animal.alias, certification: @animal.certification, hunter: @animal.hunter, image: @animal.image, kind: @animal.kind, region: @animal.region, spread_greatest: @animal.spread_greatest, spread_inside: @animal.spread_inside, spread_tip: @animal.spread_tip, state: @animal.state, unit: @animal.unit }
    assert_redirected_to animal_path(assigns(:animal))
  end

  test "should destroy animal" do
    assert_difference('Animal.count', -1) do
      delete :destroy, id: @animal
    end

    assert_redirected_to animals_path
  end
end
