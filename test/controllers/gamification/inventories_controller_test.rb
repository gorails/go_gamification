require 'test_helper'

class Gamification::InventoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @gamification_inventory = gamification_inventories(:one)
  end

  test "should get index" do
    get gamification_inventories_url
    assert_response :success
  end

  test "should get new" do
    get new_gamification_inventory_url
    assert_response :success
  end

  test "should create gamification_inventory" do
    assert_difference('Gamification::Inventory.count') do
      post gamification_inventories_url, params: { gamification_inventory: { Item_id: @gamification_inventory.Item_id, User_id: @gamification_inventory.User_id, equipped: @gamification_inventory.equipped } }
    end

    assert_redirected_to gamification_inventory_url(Gamification::Inventory.last)
  end

  test "should show gamification_inventory" do
    get gamification_inventory_url(@gamification_inventory)
    assert_response :success
  end

  test "should get edit" do
    get edit_gamification_inventory_url(@gamification_inventory)
    assert_response :success
  end

  test "should update gamification_inventory" do
    patch gamification_inventory_url(@gamification_inventory), params: { gamification_inventory: { Item_id: @gamification_inventory.Item_id, User_id: @gamification_inventory.User_id, equipped: @gamification_inventory.equipped } }
    assert_redirected_to gamification_inventory_url(@gamification_inventory)
  end

  test "should destroy gamification_inventory" do
    assert_difference('Gamification::Inventory.count', -1) do
      delete gamification_inventory_url(@gamification_inventory)
    end

    assert_redirected_to gamification_inventories_url
  end
end
