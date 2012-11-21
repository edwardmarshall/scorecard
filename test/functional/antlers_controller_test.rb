require 'test_helper'

class AntlersControllerTest < ActionController::TestCase
  setup do
    @antler = antlers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:antlers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create antler" do
    assert_difference('Antler.count') do
      post :create, antler: { animal_id: @antler.animal_id, certification: @antler.certification, circ_four: @antler.circ_four, circ_one: @antler.circ_one, circ_three: @antler.circ_three, circ_two: @antler.circ_two, image: @antler.image, lg_five: @antler.lg_five, lg_four: @antler.lg_four, lg_mainbeam: @antler.lg_mainbeam, lg_one: @antler.lg_one, lg_seven: @antler.lg_seven, lg_six: @antler.lg_six, lg_three: @antler.lg_three, lg_two: @antler.lg_two, parent_id: @antler.parent_id, side: @antler.side }
    end

    assert_redirected_to antler_path(assigns(:antler))
  end

  test "should show antler" do
    get :show, id: @antler
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @antler
    assert_response :success
  end

  test "should update antler" do
    put :update, id: @antler, antler: { animal_id: @antler.animal_id, certification: @antler.certification, circ_four: @antler.circ_four, circ_one: @antler.circ_one, circ_three: @antler.circ_three, circ_two: @antler.circ_two, image: @antler.image, lg_five: @antler.lg_five, lg_four: @antler.lg_four, lg_mainbeam: @antler.lg_mainbeam, lg_one: @antler.lg_one, lg_seven: @antler.lg_seven, lg_six: @antler.lg_six, lg_three: @antler.lg_three, lg_two: @antler.lg_two, parent_id: @antler.parent_id, side: @antler.side }
    assert_redirected_to antler_path(assigns(:antler))
  end

  test "should destroy antler" do
    assert_difference('Antler.count', -1) do
      delete :destroy, id: @antler
    end

    assert_redirected_to antlers_path
  end
end
