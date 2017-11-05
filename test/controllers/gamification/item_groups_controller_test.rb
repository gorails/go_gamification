require 'test_helper'

class Gamification::ItemGroupsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @gamification_item_group = gamification_item_groups(:one)
  end

  test "should get index" do
    get gamification_item_groups_url
    assert_response :success
  end

  test "should get new" do
    get new_gamification_item_group_url
    assert_response :success
  end

  test "should create gamification_item_group" do
    assert_difference('Gamification::ItemGroup.count') do
      post gamification_item_groups_url, params: { gamification_item_group: { name: @gamification_item_group.name } }
    end

    assert_redirected_to gamification_item_group_url(Gamification::ItemGroup.last)
  end

  test "should show gamification_item_group" do
    get gamification_item_group_url(@gamification_item_group)
    assert_response :success
  end

  test "should get edit" do
    get edit_gamification_item_group_url(@gamification_item_group)
    assert_response :success
  end

  test "should update gamification_item_group" do
    patch gamification_item_group_url(@gamification_item_group), params: { gamification_item_group: { name: @gamification_item_group.name } }
    assert_redirected_to gamification_item_group_url(@gamification_item_group)
  end

  test "should destroy gamification_item_group" do
    assert_difference('Gamification::ItemGroup.count', -1) do
      delete gamification_item_group_url(@gamification_item_group)
    end

    assert_redirected_to gamification_item_groups_url
  end
end
