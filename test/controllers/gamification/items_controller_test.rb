require 'test_helper'

class Gamification::ItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @gamification_item = gamification_items(:one)
  end

  test "should get index" do
    get gamification_items_url
    assert_response :success
  end

  test "should get new" do
    get new_gamification_item_url
    assert_response :success
  end

  test "should create gamification_item" do
    assert_difference('Gamification::Item.count') do
      post gamification_items_url, params: { gamification_item: { ItemType_id: @gamification_item.ItemType_id, cost: @gamification_item.cost, description: @gamification_item.description, image: @gamification_item.image, name: @gamification_item.name, rarity: @gamification_item.rarity, user_id: @gamification_item.user_id } }
    end

    assert_redirected_to gamification_item_url(Gamification::Item.last)
  end

  test "should show gamification_item" do
    get gamification_item_url(@gamification_item)
    assert_response :success
  end

  test "should get edit" do
    get edit_gamification_item_url(@gamification_item)
    assert_response :success
  end

  test "should update gamification_item" do
    patch gamification_item_url(@gamification_item), params: { gamification_item: { ItemType_id: @gamification_item.ItemType_id, cost: @gamification_item.cost, description: @gamification_item.description, image: @gamification_item.image, name: @gamification_item.name, rarity: @gamification_item.rarity, user_id: @gamification_item.user_id } }
    assert_redirected_to gamification_item_url(@gamification_item)
  end

  test "should destroy gamification_item" do
    assert_difference('Gamification::Item.count', -1) do
      delete gamification_item_url(@gamification_item)
    end

    assert_redirected_to gamification_items_url
  end
end
