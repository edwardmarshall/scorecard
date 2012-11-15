require 'test_helper'

class MuledeersControllerTest < ActionController::TestCase
  setup do
    @muledeer = muledeers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:muledeers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create muledeer" do
    assert_difference('Muledeer.count') do
      post :create, muledeer: { alias: @muledeer.alias, cert: @muledeer.cert, hunter: @muledeer.hunter, image: @muledeer.image, region: @muledeer.region, spread_greatest: @muledeer.spread_greatest, spread_inside: @muledeer.spread_inside, spread_tip: @muledeer.spread_tip, state: @muledeer.state, unit: @muledeer.unit }
    end

    assert_redirected_to muledeer_path(assigns(:muledeer))
  end

  test "should show muledeer" do
    get :show, id: @muledeer
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @muledeer
    assert_response :success
  end

  test "should update muledeer" do
    put :update, id: @muledeer, muledeer: { alias: @muledeer.alias, cert: @muledeer.cert, hunter: @muledeer.hunter, image: @muledeer.image, region: @muledeer.region, spread_greatest: @muledeer.spread_greatest, spread_inside: @muledeer.spread_inside, spread_tip: @muledeer.spread_tip, state: @muledeer.state, unit: @muledeer.unit }
    assert_redirected_to muledeer_path(assigns(:muledeer))
  end

  test "should destroy muledeer" do
    assert_difference('Muledeer.count', -1) do
      delete :destroy, id: @muledeer
    end

    assert_redirected_to muledeers_path
  end
end
