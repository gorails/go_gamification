require 'test_helper'

class Gamification::ItemTypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @gamification_item_type = gamification_item_types(:one)
  end

  test "should get index" do
    get gamification_item_types_url
    assert_response :success
  end

  test "should get new" do
    get new_gamification_item_type_url
    assert_response :success
  end

  test "should create gamification_item_type" do
    assert_difference('Gamification::ItemType.count') do
      post gamification_item_types_url, params: { gamification_item_type: { name: @gamification_item_type.name } }
    end

    assert_redirected_to gamification_item_type_url(Gamification::ItemType.last)
  end

  test "should show gamification_item_type" do
    get gamification_item_type_url(@gamification_item_type)
    assert_response :success
  end

  test "should get edit" do
    get edit_gamification_item_type_url(@gamification_item_type)
    assert_response :success
  end

  test "should update gamification_item_type" do
    patch gamification_item_type_url(@gamification_item_type), params: { gamification_item_type: { name: @gamification_item_type.name } }
    assert_redirected_to gamification_item_type_url(@gamification_item_type)
  end

  test "should destroy gamification_item_type" do
    assert_difference('Gamification::ItemType.count', -1) do
      delete gamification_item_type_url(@gamification_item_type)
    end

    assert_redirected_to gamification_item_types_url
  end
end
